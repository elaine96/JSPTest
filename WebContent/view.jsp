<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻展示</title>
<link rel="stylesheet" type="text/css" href="public/css/news.css">
<link rel="stylesheet" href="public/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="public/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.css">
<script type="text/javascript" src="public/js/jquery-3.2.1.min.js"></script>
</head>
<body style="background: radial-gradient(circle, #49B0F1, #5493e2, #4493FC, #023D99);">
	<div class="news-box">
	<% 
		int id = Integer.parseInt(request.getParameter("id"));
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc","root","123456");
		String sql = "select * from newses where id = '"+id+"'";
		Statement sta = con.createStatement();
		ResultSet rs = sta.executeQuery(sql);
		while(rs.next()) {
	%>
			<h1><%= rs.getString("title") %></h1>
					
			<p><%= rs.getString("content") %></p>

	<%
		}
	%>
</div>
</body>
</html>