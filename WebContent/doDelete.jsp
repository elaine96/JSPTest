<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc","root","123456");
	String sql = "delete from newses where id = ?";
	PreparedStatement pre = con.prepareStatement(sql);
	pre.setInt(1,id);
	pre.executeUpdate();
	session.setAttribute("message","新闻删除成功 ");
	response.sendRedirect("show.jsp");
%>
</body>
</html>