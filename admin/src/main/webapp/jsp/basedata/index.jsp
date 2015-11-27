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
            <h2>省份和地区</h2>
            <ul id="tree" class="ztree"></ul>
        </div>

        <div class="col-md-8">
            <h2>景点</h2>
            <div class="portlet-body form" style="display: block;">
                <!-- BEGIN FORM-->
                <form action="#" class="form-horizontal">
                    <div class="form-actions top">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green">Submit</button>
                                <button type="button" class="btn default">Cancel</button>
                            </div>
                        </div>
                    </div>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label">Text</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" placeholder="Enter text">
														<span class="help-block">
														A block of help text. </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Email Address</label>
                            <div class="col-md-4">
                                <div class="input-group">
															<span class="input-group-addon">
															<i class="fa fa-envelope"></i>
															</span>
                                    <input type="email" class="form-control" placeholder="Email Address">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Password</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input type="password" class="form-control" placeholder="Password">
															<span class="input-group-addon">
															<i class="fa fa-user"></i>
															</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Left Icon</label>
                            <div class="col-md-4">
                                <div class="input-icon">
                                    <i class="fa fa-bell-o"></i>
                                    <input type="text" class="form-control" placeholder="Left icon">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Right Icon</label>
                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa fa-microphone"></i>
                                    <input type="text" class="form-control" placeholder="Right icon">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Input With Spinner</label>
                            <div class="col-md-4">
                                <input type="password" class="form-control spinner" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group last">
                            <label class="col-md-3 control-label">Static Control</label>
                            <div class="col-md-4">
                                <p class="form-control-static">
                                    email@example.com
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions fluid">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green">Submit</button>
                                <button type="button" class="btn default">Cancel</button>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
            <table class="table table-striped table-bordered table-hover" width="100%">
                <thead>
                    <tr>
                        <td>名称</td>
                        <td>省份/地区</td>
                        <td>上级景点</td>
                        <td>操作</td>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
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