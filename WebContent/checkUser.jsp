<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录验证</title>
</head>
<body>
	<%
		String name = request.getParameter("loginName");
		String pass = request.getParameter("password");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc",
				"root",
				"123456");
		Statement sta = con.createStatement();
		String sql = "select * from users where name='"+name+"' and password='"+pass+"'";
		ResultSet results = sta.executeQuery(sql);
		if(results.next()) {
			out.println("欢迎"+name);
			response.sendRedirect("show.jsp");
		} else {	
			session.setAttribute("message","用户名或密码错误");
			%>
			<jsp:forward page="index.jsp"></jsp:forward>
			<%
		}
			
	%>
</body>
</html>