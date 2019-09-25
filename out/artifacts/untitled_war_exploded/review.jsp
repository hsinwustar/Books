<%--
  Created by IntelliJ IDEA.
  User: crumble
  Date: 2018/12/15
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.Longreview"%>
<%@ page import="dao.LongreviewDAO"%>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/review.css" />
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">
        body{
            margin:0;
            padding:0;
            background: #F5F5F5;
        }
        .col-xs-8{
            background: #F5F5F5;
        }
        .col-xs-4{
            background: #F5F5F5;
        }
    </style>
    <%--<script type="text/javascript">--%>
        <%--function show()--%>
        <%--{--%>
            <%--var rv_content = document.getElementsByClassName("rv_content");--%>
            <%--var text = rv_content.innerHTML;--%>
            <%--var newBox = document.createElement("div");--%>
            <%--var btn = document.createElement("a");--%>
            <%--newBox.innerHTML = text.substring(0,150);--%>
            <%--btn.innerHTML = text.length > 150 ? "[展开]" : "";--%>
            <%--btn.href = "###";--%>
            <%--btn.onclick = function(){--%>
                <%--if(btn.innerHTML == "[展开]")--%>
                <%--{--%>
                    <%--btn.innerHTML = "[收起]";--%>
                    <%--newBox.innerHTML = text;--%>
                <%--}--%>
                <%--else--%>
                <%--{--%>
                    <%--btn.innerHTML = "[展开]";--%>
                    <%--newBox.innerHTML = text.substring(0,150);--%>
                <%--}--%>
            <%--}--%>
            <%--rv_content.innerHTML = "";--%>
            <%--rv_content.appendChild(newBox);--%>
            <%--rv_content.appendChild(btn);--%>
        <%--}--%>
        <%--window.onload=function()--%>
        <%--{--%>
            <%--show();--%>
        <%--}--%>
    <%--</script>--%>

    <script type="text/javascript">
        var time = 300;
        var h = 40;
        function showdiv(obj) {

            //obj.parentNode.nextSibling.nextSibling.style.display = "block";
            var x = obj.parentNode.nextSibling;
            if (x.nodeType != 1) {
                x = x.nextSibling;
            }
            x.style.display = "block";
            obj.parentNode.style.display = "none";

        }
        function hidediv(obj) {

            obj.parentNode.parentNode.style.display = "none";
            var x = obj.parentNode.parentNode.previousSibling;
            if (x.nodeType != 1) {
                x = x.previousSibling;
            }
            x.style.display = "block";
        }

    </script>
</head>
<body>
<div class="d_one">
    <p style="padding-top: 10px;">
        <span class="first"><a href="main.jsp" class="first_a"><i class="glyphicon glyphicon-home"></i>&nbsp;首页</a><a href="review.jsp" class="first_a"><i class="glyphicon glyphicon-heart"></i>&nbsp;书评</a><a href="cart.jsp" class="first_a"><i class="glyphicon glyphicon-shopping-cart"></i>&nbsp;购物车</a><a href="others.jsp" class="first_a"><i class="glyphicon glyphicon-signal"></i>&nbsp;其他</a></span>
    </p>
</div>
<div class="container">
    <div class="row">
        <div class="col-xs-8">
            <h3 class="h33">最受欢迎的书评（Top50）</h3>
            <hr>
            <div id="rv">
                <%
                    LongreviewDAO longreviewDAO = new LongreviewDAO();
                    ArrayList<Longreview> list1 = longreviewDAO.getAllLongreview();
                    if(list1!=null&&list1.size()>0)
                    {
                        for(int i=0;i<list1.size();i++)
                        {
                            Longreview lrv = list1.get(i);
                %>
                <div class="rv_left">
                    <img src="img/<%=lrv.getPicture()%>" width="80"/>
                </div>
                <div class="rv_right">
                    <div class="rv_up">
                        <img src="img/<%=lrv.getIcon()%>" width="25px">
                        <label><span style="font-weight: normal;"><%=lrv.getUserid()%></span>&nbsp;&nbsp;<span style="font-weight: lighter;font-size: 12px;color: #B5B5B5"><%=lrv.getTime()%></span></label>
                    </div>
                    <div class="rv_down">
                        <label class="down_title"><%=lrv.getTitle()%></label>
                        <div class="rv_content_first"><%=lrv.getContent1()%><a onclick="showdiv(this);" href="#">[展开]</a></div>
                        <div class="rv_content"><%=lrv.getContent()%>
                            <div class="btm">
                                <a href="#" class="btn" onclick="hidediv(this);">[收起]</a>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <%
                        }
                    }
                %>
            </div>
        </div>
        <div class="col-xs-4">
            <a href="https://www.google.com.hk"><img src="img/gg.jpg"></a>
            <p>
                如果你觉得一篇评论对你有帮助，请你点击“有用”。你的投票直接决定哪些评论出现在首页和“最受欢迎的评论”里，以及在书、电影和音乐介绍页里评论的排序。
            </p>
        </div>
    </div>
</div>
<footer><p style="margin-top:10px;"><a href="main.jsp">图书</a>   |   <a href="main.jsp">Books</a><br>Copright@HsinW·吴慧鑫</p></footer>
</body>
</html>
