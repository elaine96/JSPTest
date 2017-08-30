<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.util.*,java.text.*" %>
<%request.setCharacterEncoding("utf-8");%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
</head>
<body>
	<%
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Date date = new Date();
		SimpleDateFormat ft = 
				   new SimpleDateFormat("yyyy-MM-dd");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc","root","123456");
		String sql = "insert into newses(title,content,time) values(?,?,?)";
		PreparedStatement pre = con.prepareStatement(sql);
		pre.setString(1,title);
		pre.setString(2,content);
		pre.setString(3,ft.format(date));
		if(title == null || title == "" || content == null || content == "") {
			request.setAttribute("message","新闻和内容不能为空");
			%>
			<jsp:forward page="insert.jsp"></jsp:forward>
			<%
		} else {
			pre.executeUpdate();
			session.setAttribute("message","新闻添加成功 ");
			response.sendRedirect("show.jsp");
		}
	%>
</body>
</html>