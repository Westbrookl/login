<%@page contentType="text/html" pageEncoding="utf-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<title>注册账号</title>
	<script>
		function check(){
			String name = document.getElementById("name").value();
			String password = document.getElementById("password").value();
			String ids = document.getElementById("ids").value();
			boolean flag = true;
			if(name == "" || name = null){
				flag = false;
				window.alert("用户名不能为空");
			}else if(password ==""||password = null){

			}

		}
	</script>
</head>
<body>
	<form action="login_log_check.jsp" method="post">
	<center>
		<table border="1" > 
			<tr>
				<td>用户名</td>
				<td><input type="text" name="name" id="name" placeholder="请输入用户名"></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="text" name="password" id="password" placeholder="请输入密码"></td>
			</tr>
			<tr> 
				<td>身份</td>
				<td><input type="text" name="ids" id = "ids" placeholder="请用中文输入身份"></td>
			</tr>
			<tr>
				<td><input type="submit" value="注册"></td>
				<td><input type="reset" value = "重置"></td>
			</tr>
		</table>
	</center> 
	</form>

</body>

</html>