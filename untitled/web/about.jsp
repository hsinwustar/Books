<%--
  Created by IntelliJ IDEA.
  User: crumble
  Date: 2018/12/16
  Time: 23:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        .container{
            /*margin-left: 10px;*/
            padding-left: 0;
        }
        .col-xs-9{
            margin-left: 0;
            padding-left: 0 ;
            font-family: "Microsoft YaHei UI";
        }
        h3{
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 30px;
        }
        h4{
            font-size: 17px;
            font-weight: bold;
            margin-bottom: 17px;
            margin-top:30px;
        }
        p{
            font-size: 14px;
            margin-top:10px;
            /*text-indent: 2em;*/
            margin-left: 10px;

        }
        a{
            text-decoration: none;
            color:#696969;
        }
        a:hover{
            text-decoration: none;
            color: #363636;
        }
    </style>
</head>
<body>
<div class="container" style="width: 800px">
    <div class="row">
        <div class="col-xs-9" >
            <h3>关于我们</h3>
            <hr>
            <h4>Hsin图书</h4>
            <p>制作：<span style="color: #CD4F39">吴慧鑫</span><br>相关设计参考豆瓣，数据来源[<a href="https://read.douban.com">https://read.douban.com</a>]</p>
            <h4>技术实现</h4>
            <p>本网站主要采用了JavaScript+Servlet技术+MySQL数据库+bootstrap框架+JQuery，搭载Tomcat8.7服务器，期间引入了dialog会话盒交互技术，以及SVG格式语言。</p>
            <p>网站整体采用简约扁平化风格，搭配冷灰色调，给用户呈现出一种良好的视觉效果。在主页面上引用了Affix插件来实现轮播效果，以及运用SVG格式语言编写图书的图画效果。在详情页面中运用客户端的Cookie值来获取浏览记录，给用户营造良好的产品体验。</p>
            <h4>联系方式</h4>
            <p><i class="glyphicon glyphicon-envelope"></i>&nbsp;邮箱：heaven1158114976@163.com</p>
        </div>
    </div>
</div>
</body>
</html>
