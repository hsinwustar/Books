<%--
  Created by IntelliJ IDEA.
  User: crumble
  Date: 2018/12/8
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<%@ page import="entity.Content"%>
<%@ page import="dao.ContentDAO"%>
<%@ page import="entity.Specification"%>
<%@ page import="dao.SpecificationDAO"%>
<%@ page import="entity.Review"%>
<%@ page import="dao.ReviewDAO"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <title>Title</title>
    <%--<link href="css/main.css" rel="stylesheet" type="text/css">--%>
    <link href="css/first.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/lhgcore.js"></script>
    <script type="text/javascript" src="js/lhgdialog.js"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body data-spy="scroll" data-target="#myScrollspy" data-backdrop="false">
<div class="container" style="width: 100%;margin:0;padding: 0">
    <!--海报式浏览-->
    <div class="jumbotron" style="width: 100%;height: 950px;margin:0;padding: 0;background-image: url('img/3275.jpg');background-repeat: no-repeat;background-size: cover;">
        <!--主导航-->
        <div id="d2">
            <label class="d2_lb">
                <a href="main.jsp" class="d2_a">首页</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="cart.jsp" class="d2_a">购物车</a>
            </label>
        </div>
    </div>
    <script>
        window.onscroll=function(){
            var h =document.documentElement.scrollTop||document.body.scrollTop;
            console.log(h*2.5);      //控制台查看监听滚动
            var headerTop =document.getElementById("d2");
            // var menuTop =document.getElementById("menu");
            if( h >=40) {       //header的高度是40px;
                headerTop.style.background="#363636";
                // menuTop.style.background="#363636";
                headerTop.style.color="rgba(181,181,181,1)";
                // menuTop.style.color="rgba(181,181,181,1)";
            }else{
                if(h<10){
                    //40*2.5=100;这样透明度就可以由0渐变到100%；
                    headerTop.style.background="rgba(54,54,54,0.0"+h*1.5+")";
                    // menuTop.style.background="rgba(54,54,54,0.0"+h*1.5+")";
                    headerTop.style.color="rgba(181,181,181,0.0"+h*1.5+")";
                    // menuTop.style.color="rgba(181,181,181,0.0"+h*1.5+")";
                }else if(h>10 && h<= 40){
                    headerTop.style.background="rgba(54,54,54,0."+h*1.5+")";
                    // menuTop.style.background="rgba(54,54,54,0."+h*1.5+")";
                    headerTop.style.color="rgba(181,181,181,0."+h*1.5+")";
                    // menuTop.style.color="rgba(181,181,181,0."+h*1.5+")";
                }
            }
        };
    </script>
    <!--图文版块-->
    <div class="d3">
        <!--left-->
        <%
//            ItemsDAO itemDao = new ItemsDAO();
            ContentDAO contentDAO= new ContentDAO();
            int state=Integer.parseInt(request.getParameter("ctid"));
            Content ct = contentDAO.getContentById(state);
            if(ct!=null)
            {
        %>
        <div class="d3_left">
            <p><%=ct.getIntroduction1()%></p>
            <p><%=ct.getIntroduction2()%></p>
            <p><%=ct.getIntroduction3()%></p>
        </div>
        <!--right-->
        <div class="d3_right">
            <!--photo-->
            <div class="d3_right_photo">
                <img src="./img/<%=ct.getPicture()%>"/>
            </div>
            <!--others-->
            <div class="d3_right_others">
                <p class="d3_right_others_title"><%=ct.getName()%></p>
                <p class="d3_right_others_author"><%=ct.getAuthor()%><span>著</span>&nbsp;&nbsp;<%=ct.getPress()%></p><br>
                <div class="d3_right_others_ot">
                    <a href="javascript:selflog_show(<%=ct.getCtid()%>)">
                        <div class="btn-cart">
                            <p class="btn-cart-p">加入购物车</p>
                        </div>
                    </a>
                    <label class="d3_right_others_price">¥<span><%=ct.getPrice()%></span></label>
                </div>
            </div>
        </div>
    </div>


    <div class="row" style="width: 1533px;" >
        <!--附属导航-->

        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked " data-spy="affix" data-offset-top="650" >
                <li class="active" ><a href="#d4_content" >详情</a></li>
                <li ><a href="#d4_specification" >规格</a></li>
                <li ><a href="#d4_shortreview" >短评</a></li>
            </ul>
        </div>


        <!--详情界面-->
        <div class="col-xs-9" style="background-color: #F5F5F5; margin-top:0;padding-top: 0;" >
            <!--锚点设置-->
            <br>
            <section id="d4_content">
                <br>
                <h2><%=ct.getTitle1()%></h2>
                <hr>
                <p><%=ct.getP1()%></p>
                <p><%=ct.getP2()%></p>
                <img src="./img/first-img/<%=ct.getImg1()%>"/>
                <p><%=ct.getP3()%></p>
                <img src="./img/first-img/<%=ct.getImg2()%>">
                <p><%=ct.getP4()%></p>
                <p><%=ct.getP5()%></p>
                <p><%=ct.getP6()%></p>
                <img src="./img/first-img/<%=ct.getImg3()%>">
                <p><%=ct.getP7()%></p>
                <img src="./img/first-img/<%=ct.getImg4()%>">
                <h2><%=ct.getTitle2()%></h2>
                <hr>
                <p><%=ct.getPp1()%></p>
                <p><%=ct.getPp2()%></p>
                <img src="./img/first-img/<%=ct.getImg5()%>">
                <p><%=ct.getPp3()%></p>
                <p><%=ct.getPp4()%></p>
                <p><%=ct.getPp5()%></p>
                <img src="./img/first-img/<%=ct.getImg6()%>">
                <p><%=ct.getPp6()%></p>
                <p><%=ct.getPp7()%></p>
                <img src="./img/first-img/<%=ct.getImg7()%>">
            </section>

            <%
                }
            %>
            <section id="d4_specification">
                <br>
                <br>
                <br>
                <br>
                <!--<br>-->
                <!--<br>-->
                <h2>产品规格</h2>
                <hr>
                <table class="d4_spf_tb">
                    <%
                        SpecificationDAO specificationDAO= new SpecificationDAO();
                        Specification sp = specificationDAO.getSpecificationById(Integer.parseInt(request.getParameter("ctid")));
                        if(sp!=null)
                        {
                    %>
                    <tr>
                        <th>书名</th>
                        <td><label><%=sp.getName()%></label></td>
                    </tr>
                    <tr>
                        <th>副标题</th>
                        <td><label><%=sp.getTitle()%></label></td>
                    </tr>
                    <tr>
                        <th>原作名</th>
                        <td><label><%=sp.getAuthor()%></label></td>
                    </tr>
                    <tr>
                        <th>作者</th>
                        <td><label><%=sp.getAuthor2()%></label></td>
                    </tr>
                    <tr>
                        <th>译者</th>
                        <td><label><%=sp.getWriter()%></label></td>
                    </tr>
                    <tr>
                        <th>出版社</th>
                        <td><label><%=sp.getPress()%></label></td>
                    </tr>
                    <tr>
                        <th>出版时间</th>
                        <td><label><%=sp.getPresstime()%></label></td>
                    </tr>
                    <tr>
                        <th>定价</th>
                        <td><label><%=sp.getPrice()%></label></td>
                    </tr>
                    <tr>
                        <th>装帧</th>
                        <td><label><%=sp.getHardcover()%></label></td>
                    </tr>
                    <tr>
                        <th>ISBN</th>
                        <td><label><%=sp.getISBN()%></label></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </section>
            <section id="d4_shortreview">
                <br>
                <br>
                <br>
                <br>
                <!--<br>-->
                <!--<br>-->
                <h2>豆瓣短评</h2>
                <hr>
                <%
                ReviewDAO reviewDao = new ReviewDAO();
                ArrayList<Review> list = reviewDao.getAllReview();
                    if(list!=null&&list.size()>0)
                    {
                        for(int i=0;i<4;i++)//截取前4条评论list.size()==4
                        {
                            Review rv = list.get(i);
                %>
                <div class="d4_sv_all">
                    <div class="d4_sv_img"><img src="./img/<%=rv.getIcon()%>" style="width: 35px"/></div>
                    <div class="d4_sv_content">
                        <label class="d4_sv_ct_uid"><%=rv.getUserid()%></label><br>
                        <label class="d4_sv_ct_txt"><%=rv.getViews()%></label>
                    </div>
                </div>
                <%
                    }
                    }
                %>
            </section>
        </div>
    </div>
    <!--尾部元素-->
    <footer>
        <p style="margin-top:10px;"><a href="#">图书</a>   |   <a href="#">Books</a><br>Copright@HsinW·吴慧鑫</p>
    </footer>
</div>
</body>
</html>
