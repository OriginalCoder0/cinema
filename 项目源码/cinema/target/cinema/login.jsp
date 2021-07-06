<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/22
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>传媒影院-管理员登录</title>
    <%--引入bootstrap样式文件--%>
    <link rel="stylesheet" href="./static/bootstrap-3.4.1-dist/css/bootstrap.css">
    <%--引入动画组件AnimateCSS--%>
    <link rel="stylesheet" href="./static/animate.css-4.1.1/animate.css">
    <style>
        #app {
            width: 100vw;
            height: 100vh;
            background: rgba(0, 0, 0, 0.1);
        }

        .login-box {
            height: 320px;
            margin-top:10%;
            background: rgb(255, 255, 255);
            /*盒子阴影*/
            box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
        }

        h1 {
            font-size: 2rem;
        }
    </style>
</head>
<body>
<div id="app" class="container-fluid">
    <div class="login-box col-md-4 col-md-offset-4 animate__animated animate__flip">
        <h1 class="text-center">传媒影院-后台登录</h1>
        <hr>
        <form id="loginForm" action="login" method="post" class="form-horizontal">
            <!--用户名输入组件-->
            <div class="form-group">
                <label for="username" class="control-label col-md-2">账号:</label>
                <div class="col-md-9">
                    <input type="text" id="username" name="username" class="form-control" placeholder="请输入账号">
                </div>
            </div>
            <!--密码输入组件-->
            <div class="form-group">
                <label for="password" class="control-label col-md-2">密码:</label>
                <div class="col-md-9">
                    <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码">
                </div>
            </div>
            <!--保存密码复选框组件-->
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> 记住密码
                        </label>
                    </div>
                </div>
            </div>
            <!--登录按钮-->
            <div class="form-group">
                <div class="col-md-6 col-md-offset-3">
                    <button class="btn btn-primary btn-block" type="button">登录</button>
                </div>
            </div>
        </form>
        <div class="copy text-center" style="color:#ccc">&copy;武汉传媒学院 2021</div>
    </div>
</div>

<%--引入jquery文件 基于dom驱动/vue(mvvm):基于数据驱动 --%>
<script src="./static/jquery/jquery-3.6.0.js"></script>
<%--引入弹出层组件--%>
<script src="./static/layer-v3.5.1/layer/layer.js"></script>
<script>
    $(function(){
        //判断请求范围内是否存在信息，存在则弹窗显示
        if("${msg}"){
            layer.alert("${msg}");
        }

        //为选中的按钮绑定点击事件
        $('button').click(function(){
            //获取输入的账号和密码
            var name = $('#username').val();
            var pwd = $('#password').val();
            //验证账号密码是否符合规范(正则表达式)
            if($.trim(name).length < 1){
                //弹出提示信息
                layer.msg('请输入账号!');
                //为id=username的控件设置样式
                $('#username').css('box-shadow','0 0 10px #f00');
                //结束当前函数（不再继续向下执行）
                return;
            }else{
                $('#username').css({boxShadow:'0 0 10px #1E9FFF'});
            }

            if($.trim(pwd).length < 1){
                layer.msg('请输入密码!');
                $('#password').css('box-shadow','0 0 10px #f00');
                return;
            }else{
                $('#password').css({boxShadow:'0 0 10px #1E9FFF'});
            }
            //提交表单
            $('#loginForm').submit();
        })
    })
</script>
</body>
</html>
