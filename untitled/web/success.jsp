<%--
  Created by IntelliJ IDEA.
  User: crumble
  Date: 2018/12/8
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <%
        String id = request.getParameter("id");
        String num = request.getParameter("num");
    %>
    您成功购买了<%=num%>件编号为<%=id%>的书籍&nbsp;&nbsp;&nbsp;&nbsp;
</center>
</body>
</html>
