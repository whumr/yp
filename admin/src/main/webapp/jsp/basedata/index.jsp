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
                        <div class="btn-group" data-toggle="buttons">
                            <label class="btn grey-steel btn-sm">
                            <input type="radio" name="options" class="toggle" id="option1">添加</label>
                        </div>
                    </div>
                </div>
                <div class="portlet-body form">
                    <form class="form-horizontal" role="form">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">所属地区</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" placeholder="点击左侧树选择地区" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">名  称</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" placeholder="景点名称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">描  述</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" placeholder="景点描述">
                                </div>
                            </div>
                        </div>
                        <div class="form-actions" align="center">
                            <button type="submit" class="btn green">保存</button>
                            <button type="button" class="btn default">取消</button>
                        </div>
                    </form>

                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <td>名称</td>
                                <td>省份/地区</td>
                                <td>上级景点</td>
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
        callback: {onClick: listChildren}
    }, tree_data = JSON.parse('${tree_data}');

    jQuery(document).ready(function() {
        zTreeObj = $.fn.zTree.init($("#tree"), setting, tree_data);
    });

    function listChildren(event, treeId, treeNode) {
        alert(treeNode.id);
    }
</script>

</body>
</html>