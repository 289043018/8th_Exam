<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加电影记录</title>
</head>
<body>
<form action="<%= request.getContextPath()%>/interServlet" Method="post">
<table border="1" cellspacing="0" cellpadding="5" bordercolor="silver" align="center">

		<tr>
			<td colspan="6" align="center" bgcolor="#E8E8E8">添加电影记录</td>
		</tr>
		<tr>
			<td>标题：</td>
			<td>简介：</td>
			<td>语言：</td>
		</tr>
		<tr>
		<td><input type="text" name="title" /></td>
		<td><input type="text" name="description" /></td>
		<td><p><input type="radio" value="1" name="language">English</p><br/>
		<input type="radio" value="2" name="language">Italian</p><br/>
		<p><input type="radio" value="3" name="language">Japanese</p><br/>
		<p><input type="radio" value="4" name="language">Mandarin</p><br/>
		<p><input type="radio" value="5" name="language">French</p><br/>
		<p><input type="radio" value="6" name="language">German</p></td><br/>
		
		
		</tr>
		<tr>
			<td colspan="6" align="center">
				<input type="submit" name="submit" value="添加"/>
				<input type="reset" name="reset" /></td>
		</tr>	

	
	</table>
	</form>
</body>
</html>