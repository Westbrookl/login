<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>登录验证</title>
</head>
<body>
	<!-- jdbc:mysql://localhost:3306/mldn?characterEncoding=utf8&useSSL=false -->
	<%!
		public static String DRIVER = "com.mysql.jdbc.Driver";
		public static String URL = "jdbc:mysql://localhost:3306/login?useSSL=false";
		public static String NAME = "root";
		public static String PASSWORD = "123456";
	%>
	<%
		PreparedStatement pst = null;
		Connection conn = null;
		ResultSet rs = null;
		boolean flag = false;
		String idf = null;
	%>
	<%
		try{
			request.setCharacterEncoding("utf-8");
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL,NAME,PASSWORD);
			String sql = "select name from user where mid=? and password=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1,request.getParameter("uname"));
			pst.setString(2,request.getParameter("password"));
			rs = pst.executeQuery();
			if(rs.next()){
			flag=true;
			idf = rs.getString(1);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				rs.close();
				pst.close();
				conn.close();
			}catch(Exception e){}
		}

	%>
	<%if(flag){	
		response.setHeader("refresh","2;URL=login_success.jsp");
		session.setAttribute("usrid",idf);
		session.setAttribute("uname",request.getParameter("uname"));

	%>
	<h3>用户登陆成功，2秒后登录到欢迎页面</h3>
	<h3>如果没有跳转，点击<a href="login_success.jsp">这里</a>进入页面</h3>
	<%}else{
		response.setHeader("refresh","2;URL=login_check.jsp");

	%>
	<h3>用户名密码错误，请重新<a href="login.html">登录</a></h3>
	<%
		}
	%>
</body>



</html>