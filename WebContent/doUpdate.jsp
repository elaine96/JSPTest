<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("utf-8");%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc","root","123456");
	String sql = "update newses set title = ? , content = ? where id = ?";
	PreparedStatement pre = con.prepareStatement(sql);
	pre.setString(1,title);
	pre.setString(2,content);
	pre.setInt(3,id);
	if(title == null || title == "" || content == null || content == "") {
		session.setAttribute("message","新闻和内容不能为空 ");
		response.sendRedirect("show.jsp");
	} else {
		pre.executeUpdate();
		session.setAttribute("message","新闻修改成功 ");
		response.sendRedirect("show.jsp");
	}
%>
</body>
</html>