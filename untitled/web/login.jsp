<%--
  Created by IntelliJ IDEA.
  User: crumble
  Date: 2018/12/8
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--<style type="text/css">--%>
        <%--.container{--%>
            <%--background: #4A4A82;--%>
        <%--}--%>
        <%--.row{--%>
            <%--background: #1fb554;--%>
        <%--}--%>
        <%--.col-xs-6{--%>
            <%--background: #8B3A3A;--%>
            <%--margin-left: 600px;--%>
        <%--}--%>
    <%--</style>--%>
    <link href="css/login.css"  rel="stylesheet"/>
</head>
<body>
<%--<div class="container">--%>
    <%--<div class="row">--%>
        <%--<div class="col-xs-6">--%>
            <%--<form action="servlet/LoginServlet" method="post">--%>
                <%--用户名：<input type = "text" name = "username">--%>
                <%--密码：<input type = "password" name = "userpass">--%>
                <%--<input type = "submit" value = "登陆">--%>
                <%--<input type = "reset" value = "重置">--%>
            <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<div class="login_img">
    <!--<img src="images\sign_up.jpg"/>-->
</div>

<div class="login_txt">
    <!--<form method="post" action="login.js">-->
    <form method="post" action="servlet/LoginServlet">
        <p><label class="pp">用户名</label><input type="text" name="username" class="text_input"/></p>
        <p><label class="pp">密码</label><input type="password" name="password" class="text_input"/></p>
        <div class="login_control">
            <input type="submit" class="btn_login" value="登录"/>
            <input type="reset" class="btn_login" value="重置"/>
        </div>
    </form>
</div>
</body>
</html>
