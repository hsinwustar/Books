<%--
  Created by IntelliJ IDEA.
  User: crumble
  Date: 2018/12/16
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
        <meta charset="utf-8">
        <title>Title</title>
        <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
        <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style type="text/css">
            body{
                margin:0;
                padding:0;
                background: #F5F5F5;
            }
            /*.container{*/
                /*background: #F5F5F5;*/
            /*}*/
            /*.row{*/
                /*background: #F5F5F5;*/
            /*}*/

            /*首导航栏*/
            .d_one{
                width: 100%;
                height: 45px;
                margin-top: 0px;
                background-color: #363636;
            }
            .first{
                margin-left: 30px;
                font-family: "Microsoft YaHei UI";
                font-weight: normal;
                font-size: 15px;
            }

            .first_nav{
                margin-left:1050px;
                font-family: 宋体;
                font-size: 13px;
            }
            .first_a{
                color: #B5B5B5;
                text-decoration: none;
                margin-left: 10px;
            }
            .first_a:hover{
                color: white;
                text-decoration: none;
            }
            /*.col-xs-8{*/
            /*background:#ebbb5a;*/
            /*}*/
            .col-xs-4{
                /*background: cadetblue;*/
                margin-top: 20px;
            }
            .nav-pills,.nav-stacked{
                background: #F5F5F5;
                font-family: "Microsoft YaHei UI";
                font-size: 15px;
                font-weight: bold;
            }
            /*.nav-stacked active{*/
            /*background: #B5B5B5;*/
            /*color: #B5B5B5;*/
            /*}*/
            .nav-pills a{
                color: #363636;
            }
            ul.nav-pills li a:hover{
                color: #363636;
            }
            .nav-pills>li.active>a,
            .nav-pills>li.active>a:focus,
            .nav-pills>li.active>a:hover{
                color:#fff;
                background-color:#363636;
            }

            .nav .open>a,.nav .open>a:focus,.nav .open>a:hover{background-color:#eee;border-color:#363636}

            .dropdown-menu>.active>a,
            .dropdown-menu>.active>a:focus,
            .dropdown-menu>.active>a:hover
            {
                color:#fff;
                text-decoration:none;
                background-color:#363636;
                outline:0
            }

        </style>
    </head>
<body style="background-color: #F5F5F5;padding:0;margin:0;">
    <div class="d_one">
        <p style="padding-top: 10px;">
            <span class="first"><a href="main.jsp" class="first_a"><i class="glyphicon glyphicon-home"></i>&nbsp;首页</a><a href="review.jsp" class="first_a"><i class="glyphicon glyphicon-heart"></i>&nbsp;书评</a><a href="cart.jsp" class="first_a"><i class="glyphicon glyphicon-shopping-cart"></i>&nbsp;购物车</a><a href="others.jsp" class="first_a"><i class="glyphicon glyphicon-signal"></i>&nbsp;其他</a></span>
        </p>
    </div>
    <div class="container" style="margin-top: 50px;">
        <div class="row">
            <div class="col-xs-4">
                <div class="col-xs-8" style="margin-left: 145px;">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="ac" data-id="about"><a><i class="glyphicon glyphicon-user"></i>&nbsp;关于我们</a></li>
                        <li class="dropdown" data-id="help">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-education"></i>&nbsp;帮助中心<b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">使用文档</a></li>
                                <li><a href="#">联系客服</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-8" id="content"></div>
        </div>
    </div>
</body>
<script>
    $(function() {
        $(".nav").on("click", "li", function() {
            var sId = $(this).data("id"); //获取data-id的值
            window.location.hash = sId; //设置锚点
            loadInner(sId);
        });

        function loadInner(sId) {
            var sId = window.location.hash;
            var pathn, i;
            switch(sId) {
                case "#about":
                    pathn = "about.jsp";
                    i = 0;
                    break;
                case "#help":
                    pathn = "help.jsp";
                    i = 1;
                    break;
                default:
                    pathn = "about.jsp";
                    i = 0;
                    break;
            }
            $("#content").load(pathn); //加载相对应的内容
            // $(".nav li").eq(i).addClass("ac").siblings().removeClass("ac"); //当前列表高亮
        }
        var sId = window.location.hash;
        loadInner(sId);
    });
</script>
</html>
