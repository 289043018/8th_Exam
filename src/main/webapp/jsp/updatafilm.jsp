<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改电影就记录</title>

<script type="text/javascript">
	function check(form) {
		if(document.forms.loginForm.userName.value==""){
			alert("请输入用户名！");
			document.forms.loginForm.userName.focus();
			return false;
		}

	}
</script>
</head>
<body>
<form action="<%= request.getContextPath()%>/UpdataServlet" Method="post">
<table border="1" cellspacing="0" cellpadding="5" bordercolor="silver" align="center">
		
		
	
	
		<tr>
			<td colspan="4" align="center" bgcolor="#E8E8E8">添加电影记录</td>
		</tr>
		<tr>
			<td>编号：</td>
			<td>标题：</td>
			<td>简介：</td>
			<td>语言：</td>
		</tr>
		
		<tr>
			<td><%=request.getAttribute("film_id") %></td>
			<td><%=request.getAttribute("title") %></td>
			<td><%=request.getAttribute("description") %></td>
			<td><%=request.getAttribute("language") %></td>
		</tr>
		
		<tr>
		<td><input type="hidden" value="<%=request.getAttribute("film_id") %>" name="film_id"></td>
		<td><input style="height:200px;width:200px" type="text" name="title" /></td>
		<td><input style="height:200px;width:200px" type="text" name="description" /></td>
		
		<td><p><input type="radio" value="1" name="language">English</p><br/>
		<input type="radio" value="2" name="language">Italian</p><br/>
		<p><input type="radio" value="3" name="language">Japanese</p><br/>
		<p><input type="radio" value="4" name="language">Mandarin</p><br/>
		<p><input type="radio" value="5" name="language">French</p><br/>
		<p><input type="radio" value="6" name="language">German</p></td><br/>
		
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="submit" name="submit" value="修改"/>
				<input type="reset" name="reset" /></td>
		</tr>	

	
	</table>
	</form>
</body>
</html>