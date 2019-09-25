<%--
  Created by IntelliJ IDEA.
  User: crumble
  Date: 2018/12/8
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="entity.Cart" %>
<%@ page import="entity.Items" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">
        body{
            font-family: "Microsoft YaHei UI";
            background: #F5F5F5;
            margin:0;
            padding:0;
        }
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
        h3{
            font-family: "Microsoft YaHei UI";
            font-size: 23px;
        }
        .delete a{
            text-decoration: none;
            color: #363636;
        }
        .delete a:hover{
            text-decoration: none;
            background-color: #363636;
            color: white;
        }
        table tr>td{
            height:60px;
            /*margin-left: 10px;*/
            /*background: #B5B5B5;*/
            font-size: 13px;
        }
        /*table tr{*/
        /*border-bottom: #F5F5F5 solid 10px;*/
        /*}*/
        /*p{*/
        /*background: #B5B5B5;*/
        /*}*/
        a:link, a:visited { text-decoration: none;}
        a:hover, a:active { text-decoration: none;}

        .total{
            height:60px;
            margin-left:500px;
            margin-top: 20px;
        }
        .total span{
            line-height:60px;
            font-family: "Microsoft YaHei UI";
            font-size: 15px;
            font-weight: bold;
            float: left;
        }
        .sd_btn{
            position: relative;
            margin-left: 100px;
            top:10px;
        }
        .sd_btn a,.sd_btn a:hover{
            text-decoration: none;
            /*margin-left: 400px;*/
        }
        .btn-cart{
            /*margin-top: 5px;*/
            /*margin-left: 250px;*/
            /*display: inline-block;*/
            width: 80px;
            height:38px;
            background: #CD4F39;
            border-radius: 0.4em;
            /*margin-left: 100px;*/
            text-align: center;
        }
        .btn-cart-p{
            color: white;
            font-family: "Microsoft YaHei UI";
            font-size: 18px;
            padding-top: 0.35em;
        }
    </style>
    <script language="javascript">
        function delcfm() {
            if (!confirm("确认要删除？")) {
                window.event.returnValue = false;
            }
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
        <div class="col-xs-9" style="margin-left: 180px;">
            <h3>购物车</h3>
            <div id="shopping">
                <form action="" method="">
                    <table style="margin-top: 30px;background-color: #DCDCDC;width: 700px">
                        <tr style="border-bottom: #F5F5F5 solid 1px" bgcolor="#F5F5F5">
                            <th width="300px" style="padding-left: 50px;"><p>作品</p></th>
                            <th width="100px">单价</th>
                            <th width="100px">价格</th>
                            <th width="100px">数量</th>
                            <th width="100px">操作</th>
                        </tr>
                        <%
                            //首先判断session中是否有购物车对象
                            if(request.getSession().getAttribute("cart")!=null){
                        %>
                            <!-- 循环的开始 -->
                            <%
                                Cart cart = (Cart)request.getSession().getAttribute("cart");
                                HashMap<Items,Integer> goods = cart.getGoods();
                                Set<Items> items = goods.keySet();
                                Iterator<Items> it = items.iterator();

                                while(it.hasNext()){
                                    Items i = it.next();
                        %>
                        <tr style="border: #F5F5F5 solid 15px;">
                            <td style="padding-left: 50px;"><a href=""><span style="color: #8B4C39;font-size: 13.5px"><%=i.getName()%></span></a>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #696969;font-size: 12px"><%=i.getAuthor()%></span></td>
                            <td>¥<%=i.getPrice()%></td>
                            <td><span style="color: darkred;font-weight: bold">¥<%=i.getPrice()*goods.get(i) %></span><input type="hidden" value="" /></td>
                            <td><%=goods.get(i)%></td>
                            <td class="delete">
                                <a href="servlet/CartServlet?action=delete&id=<%=i.getId()%>" onclick="delcfm();">删除</a>
                            </td>
                        </tr>
                        <%
                        }
                        %>
                        <!--循环的结束-->
                    </table>
                    <%--<div class="total"><span id="total">总计：￥<%=cart.getTotalPrice() %></span></div>--%>
                    <div class="total">
                        <span id="total">总计：￥<%=cart.getTotalPrice() %></span>
                        <%
                            }
                        %>
                        <div class="sd_btn">
                            <a href="#">
                                <div class="btn-cart">
                                    <p class="btn-cart-p">购买</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <%--<div class="button"><input type="button" value="reset" /></div>--%>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
