<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException,java.sql.Connection,java.sql.DriverManager,java.sql.Statement,java.sql.ResultSet,java.util.*,java.text.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻列表</title>
<link rel="stylesheet" type="text/css" href="public/css/news.css">
<link rel="stylesheet" href="public/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="public/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.css">
<script type="text/javascript" src="public/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="col-md-offset-2 col-md-8 top">
		<%
				if(session.getAttribute("message") != null) {
			%>
					<p class="alert alert-danger">
						<%= session.getAttribute("message") %>
					</p>
			<% 
				}
			%>
		<div id="newstotal">
			<h3>新闻动态 <span>/News</span></h3>
			<a href="insert.jsp"><button class="btn btn-primary">添加图书</button></a>
			<div id="news">
			<%
				int pageSize=5;
				int pageNow=1;
				int rowCount=0;
				int pageCount=0;
				String s_pageNow=request.getParameter("pageNow");
				if(s_pageNow!=null){
					pageNow=Integer.parseInt(s_pageNow);
				}
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc","root","123456");
				Statement sta = con.createStatement();
				String sql="select * from newses";
				ResultSet rs = sta.executeQuery(sql);
				while(rs.next()){
					rowCount++;
				}
				if(rowCount%pageSize==0){
					pageCount=rowCount/pageSize;
				}else{
					pageCount=rowCount/pageSize+1;
				}
				String sql1 = "select * from newses limit "+((pageNow-1)*pageSize)+","+pageSize+"";
				ResultSet rs1 = sta.executeQuery(sql1);
				while(rs1.next()){
			%>
				<div class="onenews">
					<div class="newdate">
						<% 
							SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM"); 
							Date date = rs1.getDate("time");
			 			%>
						<%= ft.format(date) %>
						<p>
							<% 
								SimpleDateFormat ftd = new SimpleDateFormat("dd");
							%>
							<%= ftd.format(date) %>
						</p>
					</div>
					<form action="view.jsp" method="post">
						<input type="hidden" value="<%= rs1.getString("id") %>" name="id">
						<p class="title">
							<%= rs1.getString("title") %>
						</p>
						<div class="msgs">
							<%= rs1.getString("content") %>
						</div>
						<button class="btn btn-info" style="float:left;">详情</button>
					</form>
					<div class="indexbtn">
						<form action="doDelete.jsp" method="post">
							<input type="hidden" value="<%= rs1.getString("id") %>" name="id">
							<input class="btn btn-danger" style="float: right;" type="submit" value="删除">
						</form>
						<form action="update.jsp" method="post">
							<input type="hidden" value="<%= rs1.getString("id") %>" name="id">
							<input class="btn btn-primary" style="float: right;margin-right:1%;" type="submit" value="修改">
						</form>
					</div>
				</div>
				
			<%
				}
			%>
				<div class="clear"></div>
				<ul class="pagination">
					<%
						if(pageNow!=1){
					%>
						<li><a href="show.jsp?pageNow=<%= (pageNow-1) %>">&laquo;</a></li>
					<%
						}
						for(int i=1;i<=pageCount;i++){
					%>
							<li><a href="show.jsp?pageNow=<%= i %>"><%= i %></a></li>
					<%
						}
						if(pageNow!=pageCount){
					%>
						<li><a href="show.jsp?pageNow=<%= (pageNow+1) %>">&raquo;</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>