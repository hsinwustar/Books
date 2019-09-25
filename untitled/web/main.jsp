<%--
  Created by IntelliJ IDEA.
  User: crumble
  Date: 2018/12/8
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<%@ page import="entity.Items"%>
<%@ page import="entity.Content"%>
<%@ page import="dao.ItemsDAO"%>
<%@ page import="dao.ContentDAO" %>

<html lang="en" class="demo-2 no-js">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>$Title$</title>
    <meta name="description" content="Hover Effects with animated SVG Shapes using Snap.svg" />
    <meta name="keywords" content="animated svg, hover effect, grid, svg shape html, " />
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />
      <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
      <link type="text/css" rel="stylesheet" href="css/carousel.css">
      <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="js/snap.svg-min.js"></script>
    <!--[if IE]>
    <!--<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>-->
    <![endif]-->

    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <script src="http://libs.baidu.com/html5shiv/3.7/html5shiv.min.js"></script>

    <style type="text/css">
      .caroursel{margin:50px auto;}
      body{background-color: #F5F5F5;}
    </style>

  </head>
  <body>
  <div class="d_one">
      <p style="padding-top: 10px;">
          <span class="first"><a href="main.jsp" class="first_a"><i class="glyphicon glyphicon-home"></i>&nbsp;首页</a><a href="review.jsp" class="first_a"><i class="glyphicon glyphicon-heart"></i>&nbsp;书评</a><a href="cart.jsp" class="first_a"><i class="glyphicon glyphicon-shopping-cart"></i>&nbsp;购物车</a><a href="others.jsp" class="first_a"><i class="glyphicon glyphicon-signal"></i>&nbsp;其他</a></span><span class="first_nav"><a href="login.jsp" class="first_a"><span class="glyphicon glyphicon-log-in"></span> 登录</a>&nbsp;<a href="sign.jsp" class="first_a"><span class="glyphicon glyphicon-user"></span> 注册</a></span>
      </p>
  </div>


  <div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
      <%
//        ItemsDAO itemsDao = new ItemsDAO();
        ContentDAO contentDAO = new ContentDAO();
        ArrayList<Content> list1 = contentDAO.getAllContent();
        if(list1!=null&&list1.size()>0)
        {
            int i=0;
            Content ct = list1.get(i);
      %>
      <div class="item active">
        <!-- <a href="details.jsp?id=8">  -->
        <a href="first.jsp?ctid=<%=ct.getCtid()%>">
          <img src="./img/<%=ct.getBacpicture()%>" width="1600px" alt="First slide">
        </a>
        <!-- </a> -->
      </div>
      <%

        }
      %>
      <div class="item">
        <img src="./img/4.jpg" width="1600px" alt="Second slide">
      </div>
      <div class="item">
        <img src="./img/5.jpg" width="1600px" alt="Third slide">
      </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <br>
          <!-- 商品循环开始 -->
  <div class="container">
    <section id="grid" class="grid clearfix">

          <%
            ItemsDAO itemsDao = new ItemsDAO();
            ArrayList<Items> list = itemsDao.getAllItems();
            if(list!=null&&list.size()>0)
            {
              for(int i=0;i<list.size();i++)
              {
                Items item = list.get(i);
          %>

          <a href="details.jsp?id=<%=item.getId()%>" data-path-hover="m 0,0 0,47.7775 c 24.580441,3.12569 55.897012,-8.199417 90,-8.199417 34.10299,0 65.41956,11.325107 90,8.199417 L 180,0 z">
            <figure>
              <img src="img/<%=item.getPicture()%>" />
              <svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="m 0,0 0,171.14385 c 24.580441,15.47138 55.897012,24.75772 90,24.75772 34.10299,0 65.41956,-9.28634 90,-24.75772 L 180,0 0,0 z"/></svg>
              <figcaption>
                <h2><%=item.getName()%></h2>
                <p><%=item.getSynopsis() %></p>
                <button><%=item.getAuthor()%></button>
              </figcaption>
            </figure>
          </a>

          <%--<!-- 商品循环结束 -->--%>
        <%
              }
            }
          %>
    </section>
  </div>

  <script>
      (function() {

          function init() {
              var speed = 330,
                  easing = mina.backout;

              [].slice.call ( document.querySelectorAll( '#grid > a' ) ).forEach( function( el ) {
                  var s = Snap( el.querySelector( 'svg' ) ), path = s.select( 'path' ),
                      pathConfig = {
                          from : path.attr( 'd' ),
                          to : el.getAttribute( 'data-path-hover' )
                      };

                  el.addEventListener( 'mouseenter', function() {
                      path.animate( { 'path' : pathConfig.to }, speed, easing );
                  } );

                  el.addEventListener( 'mouseleave', function() {
                      path.animate( { 'path' : pathConfig.from }, speed, easing );
                  } );
              } );
          }

          init();

      })();
  </script>

  <footer>
    <p style="margin-top:10px;"><a href="#">图书</a>   |   <a href="#">Books</a><br>Copright@HsinW·吴慧鑫</p>
  </footer>
  </body>
</html>
