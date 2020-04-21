<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${ctxStatic}/plugins/layui/css/layui.css" media="all" />
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<form class="layui-form">
    <div class="layui-form-item">
        <input type="text" name="id" class="layui-input" style="display: none">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="username" class="layui-input" value='${user.username}' disabled>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="email" class="layui-input" value='${user.email}' disabled>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-block">
            <input type="password" id="password" name="password" placeholder="请输入新密码" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-block">
            <input type="password" id="repassword" name="repassword" placeholder="请确认密码" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-filter="update_user" id="sub">立即修改</button>
        </div>
    </div>
</form>
</body>
<script type="text/javascript" src="${ctxStatic}/plugins/layui/layui.js"></script>
<script>
    layui.use('layer', function() {
        //日期
        var $ = layui.jquery,
            layer = layui.layer;
        var form = layui.form,$=layui.$;
        $('#sub').click(function (event) {
            event.preventDefault();
            var data1=$("input[name=password]").val();
            if (!$("input[name=password]").val()) {
                layer.msg("密码不能为空");
                return false;
            } else if ($("input[name=repassword]").val()!=$("input[name=password]").val()) {
                layer.msg("两次密码不相等");
                return false;
            } else {
                $.post("${ctx}/user/updatepwd" , { password: data1}, function(data){
                    if(data=="success"){
                        alert("修改成功");
                    }
                    location.reload();
                });
            }

        });
    });
</script>
</html>