<%@page contentType="text/html" pageEncoding="utf-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<title>登录成功</title>
</head>

<body>

	<%
		if(session.getAttribute("usrid")!=null || session.getAttribute("uname")!=null ){


			String name = (String)session.getAttribute("usrid");
			String uname = (String)session.getAttribute("uname");
	%>
	<h2>欢迎<%= uname %>登录，身份是<%= name%></h2>
	<h2><a href="logout.jsp">注销</a></h2>
	<%

	}else{
	%>
	<h2>请您先<a href="login.html">登录</a></h2>
	<%

	}
	%>




</body>




</html>