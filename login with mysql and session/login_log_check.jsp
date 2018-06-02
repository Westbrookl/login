<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<title>注册验证</title>

</head>
<body>
	<%!
		public static String DRIVER = "com.mysql.jdbc.Driver";
		public static String URL = "jdbc:mysql://localhost:3306/login?characterEncoding=utf8&useSSL=false";
		public static String NAME = "root";
		public static String PASSWORD = "123456";


	%>
	<%
		Connection conn = null;
		PreparedStatement pst = null;
		String idf = null;
		int flag = 0;

	%>
	<%
		try{
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL,NAME,PASSWORD);
			String sql = "insert into user(mid,password,name)values(?,?,?)";
			pst = conn.prepareStatement(sql);
			request.setCharacterEncoding("utf-8");
			pst.setString(1,request.getParameter("name"));
			pst.setString(2,request.getParameter("password"));
			pst.setString(3,request.getParameter("ids"));
			flag = pst.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
	}
		finally{
		if(pst!=null){
			try{
				pst.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(conn != null){
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	 }


	%>
	<%
		if(flag == -1){
			//response.setHeader("refresh","2;URL=login_log_failure.jsp");
	%>
		<h3>注册失败，点击<a href="login_log.jsp">这里</a>重新注册</h3>
	<%
		}else{	
			session.setAttribute("usrid",request.getParameter("ids"));
			session.setAttribute("uname",request.getParameter("name"));
			response.setHeader("refresh","2,URL=login_success.jsp");
	%>
	<h3>注册成功，2秒后跳转到登录成功页面。如果没有跳转点击<a href="login_success.jsp">这里</a></h3>
	<%
}
	%>


</body>

</html>