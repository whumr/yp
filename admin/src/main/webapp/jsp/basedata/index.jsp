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
            <ul id="tree" class="ztree"></ul>
        </div>

        <div class="col-md-8">
            test
        </div>
    </div>
</div>

<script>
    var zTreeObj, setting = {
        data: {simpleData: {enable: true}},
        callback: {onClick: listChildren}
    }, tree_data = '${tree_data}';

    jQuery(document).ready(function() {
        zTreeObj = $.fn.zTree.init($("#tree"), setting, tree_data);
    });

    function listChildren(event, treeId, treeNode) {
        alert(treeNode.id);
    }
</script>

</body>
</html>