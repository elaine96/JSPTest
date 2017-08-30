<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="public/css/user.css">
<link rel="stylesheet" href="public/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="public/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.css">
<script type="text/javascript" src="public/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<form action="checkUser.jsp" method="post" name="Register">
		<div class="login-box">
			<%
				if(session.getAttribute("message") != null) {
			%>
					<p class="alert alert-success">
						<%= session.getAttribute("message") %>
					</p>
			<% 
				}
			%>
			<h1>登录</h1>
			<div class="input-group margin-bottom-sm">
				<span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
				<input class="form-control" type="text" placeholder="Username" name="loginName">
			</div>
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
				<input class="form-control" type="password" placeholder="Password" name="password">
			</div>
			<a href="register.jsp">没有账号？请注册</a>
			<button class="btn btn-primary">登录</button>
		</div>
	</form>
</body>
</html>