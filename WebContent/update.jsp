<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("utf-8");%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改新闻</title>
<link rel="stylesheet" type="text/css" href="public/css/news.css">
<link rel="stylesheet" href="public/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="public/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.css">
<script type="text/javascript" src="public/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc","root","123456");
	
	String sql = "select * from newses where id = '"+id+"'";
	Statement sta = con.createStatement();
	ResultSet rs = sta.executeQuery(sql);
	while(rs.next()) {
%>
<div class="col-md-offset-2 col-md-8 top">
		<form action="doUpdate.jsp" method="post">
			<input type="hidden" value="<%= rs.getString("id") %>" name="id">
			<label class="col-md-2">标题：</label>
			<div class="col-md-10">
				<input class="form-control" type="text" name ="title" value="<%= rs.getString("title") %>">
			</div>
			
			<label class="col-md-2 top">正文：</label>
			<div class="col-md-10 top">
				<textarea class="form-control textarea" name="content"><%= rs.getString("content") %></textarea>
			</div>
			
			<input class="btn btn-primary top" type="submit" value="修改" style="float: right">
			<a href="show.jsp">
				<input class="btn btn-default top" type="button" value="返回" style="float: right;margin-right: 1%;">
			</a>
		</form>
	
	</div>
<%
	}
%>
	
	
</body>
</html>