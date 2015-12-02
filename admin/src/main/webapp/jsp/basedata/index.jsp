<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/plugins/ztree/metroStyle/metroStyle.css" type="text/css">
    <script src="/plugins/ztree/jquery.ztree.core-3.5.min.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <div class="row" style="margin-top:20px;margin-bottom:20px;">
        <div class="col-md-4">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption">
                        省份和地区
                    </div>
                </div>
                <div class="portlet-body form">
                    <ul id="tree" class="ztree"></ul>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">
                        景点
                    </div>
                    <div class="actions">
                        <div class="btn-group">
                            <label id="add_btn" class="btn grey-steel btn-sm" onclick="toggleAdd()">添加</label>
                        </div>
                    </div>
                </div>
                <div class="portlet-body form">
                    <form id="add_view_form" class="form-horizontal" role="form" style="display: none">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">所属地区</label>
                                <div class="col-md-9">
                                    <input id="parent_name" type="text" class="form-control" placeholder="点击左侧树叶节点选择地区" readonly>
                                    <input id="parent_id" type="hidden">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">名  称</label>
                                <div class="col-md-9">
                                    <input id="view_name" type="text" class="form-control" placeholder="景点名称,多个景点用空格隔开">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">描  述</label>
                                <div class="col-md-9">
                                    <input id="view_comment" type="text" class="form-control" placeholder="景点描述,多个景点时无效">
                                </div>
                            </div>
                        </div>
                        <div class="form-actions" align="center">
                            <button type="button" class="btn green" onclick="saveView()">保存</button>
                            <button type="button" class="btn default" onclick="toggleAdd()">取消</button>
                        </div>
                    </form>

                    <table id="view_table" class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <td>ID</td>
                                <td>名称</td>
                                <td>省份/地区</td>
                                <td>操作</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1111</td>
                                <td>222</td>
                                <td>333</td>
                                <td><a href="javascript:void(0)">删除</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var zTreeObj, setting = {
        data: {simpleData: {enable: true}},
        callback: {onClick: treeClick}
    }, tree_data = JSON.parse('${tree_data}');

    jQuery(document).ready(function() {
        zTreeObj = $.fn.zTree.init($("#tree"), setting, tree_data);
    });

    function treeClick(event, treeId, treeNode) {
        var id = treeNode.id;
        var is_country = treeNode.isParent;
        if (!is_country) {
            $('#parent_name').val(treeNode.name);
            $('#parent_id').val(treeNode.id);
        } else {
            $('#parent_name').val('');
            $('#parent_id').val('');
        }
        refresh(is_country, id);
    }

    function saveView() {
        var province_id = $('#parent_id').val();
        if (province_id == '') {
            alert('请选择所属地区');
            return;
        }
        var view_name = $.trim($('#view_name').val());
        if (view_name == '') {
            alert('请输入景点名称');
            return;
        }
        var view_comment = $.trim($('#view_comment').val());
        $.ajax({
            url: '/basedata/saveViewspot',
            type: 'POST',
            dataType: 'json',
            timeout: 10000,
            data: {province_id : province_id, view_name : view_name, view_comment : view_comment},
            cache: false,
            async: false,
            error: function() {
            },
            success: function(data) {
                refresh(false, province_id);
            }
        });
    }

    function refresh(is_country, id) {
        $.ajax({
            url: '/basedata/searchViewspot',
            type: 'POST',
            dataType: 'json',
            timeout: 10000,
            data: is_country ? {country_id : id} : {province_id : id},
            cache: false,
            async: false,
            error: function() {
            },
            success: function(result) {
                refreshTable(result);
            }
        });
    }

    function refreshTable(result) {
        $('#view_table tbody').empty();
        if (result.status == 1) {
            var list = result.data;
            if (list && list.length > 0) {
                for (var i = 0; i < list.length; i++) {
                    var view = list[i];
                    $('#view_table tbody').append('<tr><td>' + view.id
                        + '</td><td>' + view.name + '</td><td>'
                        + view.province.name + '</td><td><a href="javascript:deleteView('
                        + view.id + ')">删除</a></td></tr>');
                }
            }
        }
    }

    function deleteView(id) {
        $.ajax({
            url: '/basedata/deleteViewspot',
            type: 'POST',
            dataType: 'json',
            timeout: 10000,
            data: {id : id},
            cache: false,
            async: false,
            error: function() {
            },
            success: function(data) {
                refresh(false, province_id);
            }
        });
    }

    function toggleAdd() {
        var form = $('#add_view_form');
        if (form.is(':hidden')) {
            form.show();
            $('#add_btn').text('取消');
        } else {
            form.hide();
            $('#add_btn').text('添加');
        }
    }
</script>

</body>
</html>