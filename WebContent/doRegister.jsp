<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册验证</title>
</head>
<body>
<%
	     
	String name = request.getParameter("name");
	String pass = request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc","root","123456");
	String sql = "insert into users(name,password) values(?,?)";
	PreparedStatement pre = con.prepareStatement(sql);
	pre.setString(1,name);
	pre.setString(2, pass);
	if(name == null || name == "") {
		request.setAttribute("message","请输入用户名");
%>
		<jsp:forward page="register.jsp"></jsp:forward>
<%
	} else if (pass.length() < 6 || pass.length() > 12) {
		request.setAttribute("message","密码长度为6~12");
%>
		<jsp:forward page="register.jsp"></jsp:forward>
<%
	} else {
		Statement sta = con.createStatement();
		String sql1 = "select * from users where name='"+name+"'";
		ResultSet results = sta.executeQuery(sql1);
		if(results.next()) {
			session.setAttribute("message","用户名已经存在");
%>
			<jsp:forward page="register.jsp"></jsp:forward>
<%
		} else {
			out.println("注册成功");
			pre.executeUpdate();
		}
	}				
%>
</body>
</html>