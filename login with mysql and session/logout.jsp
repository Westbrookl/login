<%@page contentType="text/html" pageEncoding = "utf-8"%>
<html>
<head>
	<title>注销</title>
</head>
<body>
	<%
	response.setHeader("refresh","2;URL=login.html");
	session.invalidate();	
	%>
	<h3>你已经退出本系统</h3>
	<h3>2秒后自动跳转，如果没有跳转点击<a href="login.html">这里</a></h3>
</body>



</html>