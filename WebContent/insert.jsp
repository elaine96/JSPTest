<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加新闻</title>
<link rel="stylesheet" type="text/css" href="public/css/news.css">
<link rel="stylesheet" href="public/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="public/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.css">
<script type="text/javascript" src="public/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="col-md-offset-2 col-md-8 top">
		<form action="doInsert.jsp" method="post">
			<label class="col-md-2">标题：</label>
			<div class="col-md-10">
				<input class="form-control" type="text" name ="title">
			</div>
			
			<label class="col-md-2 top">正文：</label>
			<div class="col-md-10 top">
				<textarea class="form-control textarea" name="content"></textarea>
			</div>
			
			<input class="btn btn-primary top" type="submit" value="添加" style="float: right">
		</form>
	
	</div>
	
</body>
</html>