<%--
  Created by IntelliJ IDEA.
  User: crumble
  Date: 2018/12/8
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="entity.Items"%>
<%@ page import="dao.ItemsDAO"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <title>Title</title>
    <link href="css/details.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/lhgcore.js"></script>
    <script type="text/javascript" src="js/lhgdialog.js"></script>

    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <script type="text/javascript">
        function showcart(id)
        {
            var num =  document.getElementById("number").value;
            <%--J.dialog.get({id: 'haoyue_creat', skin:'chrome',bgcolor:'#363636', opacity:0.2,title: '购物成功',width: 700,height:300, link: '<%=path%>/servlet/CartServlet?id='+id+'&num='+num+'&action=add', cover:true});--%>
            // alert("购物成功！");
            J.dialog.get({ id:'test41', title: '购物成功',skin:'chrome',bgcolor:'#363636', link: '<%=path%>/servlet/CartServlet?id='+id+'&num='+num+'&action=add' });
        }
        function add()
        {
            var num = parseInt(document.getElementById("number").value);
            if(num<100)
            {
                document.getElementById("number").value = ++num;
            }
        }
        function sub()
        {
            var num = parseInt(document.getElementById("number").value);
            if(num>1)
            {
                document.getElementById("number").value = --num;
            }
        }

    </script>

    <style type="text/css">
        body{
            background: #F5F5F5;
            padding: 0;
            margin:0;
        }
        /*.container{*/
        /*background: #0aa082;*/
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
        .row{
            background: #F5F5F5;
        }
        .col-xs-9{
            background: #F5F5F5;
        }

        .col-xs-3{
            text-align: center;
            background: #F5F5F5;
        }

        hr{
            color: #363636;
        }

        .breadcrumb{
            margin-top: 30px;
            background: #F5F5F5;
        }
        .breadcrumb a{
            color: #363636;
        }
        .breadcrumb a:hover{
            color: black;
            text-decoration: none;
        }

    </style>
</head>
<body>

<div class="d_one">
    <p style="padding-top: 10px;">
        <span class="first"><a href="main.jsp" class="first_a"><i class="glyphicon glyphicon-home"></i>&nbsp;首页</a><a href="review.jsp" class="first_a"><i class="glyphicon glyphicon-heart"></i>&nbsp;书评</a><a href="cart.jsp" class="first_a"><i class="glyphicon glyphicon-shopping-cart"></i>&nbsp;购物车</a><a href="others.jsp" class="first_a"><i class="glyphicon glyphicon-signal"></i>&nbsp;其他</a></span>
    </p>
</div>
<div class="container">
<%
    ItemsDAO itemDao = new ItemsDAO();
    Items item = itemDao.getItemsById(Integer.parseInt(request.getParameter("id")));
    if(item!=null)
    {
%>

<ul class="breadcrumb">
    <li><a href="main.jsp">首页</a></li>
    <li><a href="main.jsp">图书</a></li>
    <li class="active"><%=item.getName()%></li>
</ul>

    <div class="row">
        <div class="col-xs-9">
            <div class="d_le_up">
                <img src="img/<%=item.getPicture()%>" width="220"/>
                <div class="up_others">
                    <h3><%=item.getName()%></h3>
                    <label><%=item.getSynopsis()%></label>
                    <br>
                    <br>
                    <table>
                        <tr><td>作者</td><td><%=item.getAuthor()%></td></tr>
                        <tr><td>译者</td><td><%=item.getAuthor2()%></td></tr>
                        <tr><td>类别</td><td> <%=item.getLeibie()%></td></tr>
                        <tr><td>出版社&nbsp;</td><td><%=item.getPress()%></td></tr>
                        <tr><td>提供方&nbsp;</td><td><%=item.getGongying()%></td></tr>
                        <tr><td>字数</td><td><%=item.getZishu()%></td></tr>
                        <tr><td>ISBN</td><td><%=item.getISBN()%></td></tr>
                    </table>
                </div>
                <div class="sd_btn">
                    <p class="sd">购买数量：<span id="sub" onclick="sub();">-</span><input type="text" id="number" name="number" value="1" size="2"/><span id="add" onclick="add();">+</span></p>
                    <a href="javascript:showcart(<%=item.getId()%>)" class="sd_btn_a">
                        <div class="btn-cart">
                            <p class="btn-cart-p">加入购物车</p>
                        </div>
                    </a>
                </div>
            </div>
            <!--<br>-->
            <!--<hr>-->
            <div class="d_le_down">
                <ul class="nav nav-tabs">
                    <li ><a href="#tab">作品简介</a></li>
                    <li><a href="#show">作品展示</a></li>
                    <li><a href="#o">经典名句</a></li>
                </ul>
                <br>
                <br>
                <h3 id="tab">作品简介</h3>
                <p><%=item.getIntroduction1()%></p>
                <!--<a href="#top" style="color: #363636;text-decoration: none;float: right;font-size: 15px;font-weight: bold">导航</a>-->
                <br>
                <br>
                <h3 id="show">作品展示</h3>
                <p><%=item.getIntroduction2()%></p>
                <br>
                <br>
                <h3 id="o">经典名句</h3>
                <p>
                    <%=item.getIntroduction3()%>
                </p>
            </div>
         <%
             }
         %>
            <br>
            <br>
            <br>
        </div>

        <%
        String list ="";
        //从客户端获得Cookies集合
        Cookie[] cookies = request.getCookies();
        //遍历这个Cookies集合
        if(cookies!=null&&cookies.length>0)
        {
        for(Cookie c:cookies)
        {
        if(c.getName().equals("ListViewCookie"))
        {
        list = c.getValue();
        }
        }
        }

        list+=request.getParameter("id")+"#";
        //如果浏览记录超过1000条，清零.
        String[] arr = list.split("#");
        if(arr!=null&&arr.length>0)
        {
        if(arr.length>=1000)
        {
        list="";
        }
        }
        Cookie cookie = new Cookie("ListViewCookie",list);
        /* System.out.println(list); */
        response.addCookie(cookie);

        %>

        <div class="col-xs-3" style="color: #363636">
            <h3>浏览记录</h3>
            <hr>
            <%
            ArrayList<Items> itemlist = itemDao.getViewList(list);
            if(itemlist!=null&&itemlist.size()>0 )
            {
            System.out.println("itemlist.size="+itemlist.size());
            for(Items i:itemlist)
            {

            %>
            <div class="liulan">
                <dl>
                    <dt>
                        <a href="details.jsp?id=<%=i.getId()%>"><img src="img/<%=i.getPicture()%>" width="150" height="180" border="1"/></a>
                    </dt>
                    <dd class="dd_name"><%=i.getName()%></dd>
                    <dd class="dd_other">作者 <%=i.getAuthor()%>&nbsp;&nbsp;￥<%=i.getPrice()%> </dd>
                </dl>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>
<footer><p style="margin-top:10px;"><a href="main.jsp">图书</a>   |   <a href="main.jsp">Books</a><br>Copright@HsinW·吴慧鑫</p></footer>

</body>
</html>
