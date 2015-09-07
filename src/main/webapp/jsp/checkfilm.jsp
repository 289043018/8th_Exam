<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看电影列表</title>

</head>
<body>
 <table border="1" spacing="2">  

		<%!
		Connection conn =null;
		
		public static final	int pagesize=50;
		int pagecount;
		int curpage=1;
		%>
		<%
		try {
			conn = ConnectionFactory.getInstance().makeConnection();  
			conn.setAutoCommit(false);
			
			FilmDao filmDao = new FilmDaoImpl();
			FilmEntity film = new FilmEntity();
			ResultSet  data =null;
			data = filmDao.get(conn, film);
			conn.commit();

		data.last();
		int size = data.getRow();
		pagecount = (size%pagesize==0)?(size/pagesize):(size/pagesize+1);
		String tmp = request.getParameter("curpage");  
		if(tmp==null){
			tmp="1";
		}
		curpage = Integer.parseInt(tmp);
		if(curpage>=pagecount) curpage = pagecount;  
		boolean flag = data.absolute((curpage-1)*pagesize+1);  
		out.println(curpage); 
		int count = 0; 
		
		do{
			 if(count>=pagesize)break;
			long film_id=data.getLong("film_id");
			String title=data.getString("title");
			String description=data.getString("description");
			String name=data.getString("name");
			 count++;
			 
			 %>
			<tr>
			<td>电影编号：<%=film_id%></td>
			<td>标题：<%=title%></td>
			<td>简介：<%=description%></td>
			<td>语言：<%=name%></td>
			<td><form action="<%= request.getContextPath()%>/DeleteServlet" Method="post">
			<input type="hidden" name="film_id" value="<%=data.getString("film_id")%>"/>
			<input type="submit" name="delete" value="删除"/>
			</form>
			<form action="<%= request.getContextPath()%>/UpdataServlet01" Method="post">
			<input type="hidden" name="film_id" value="<%=data.getLong("film_id")%>"/>
			<input type="hidden" name="title" value="<%=data.getString("title")%>"/>
			<input type="hidden" name="description" value="<%=data.getString("description")%>"/>
			<input type="hidden" name="name" value="<%=data.getString("name")%>"/>
			<input id="<%=data.getInt("film_id") %>" type="submit" name="updata" value="修改" />
			</form></td>
			
			 
		 <%		 }while(data.next());%>
		<% conn.close();%>
		 <%
		} catch (Exception e) {
			 e.printStackTrace();
			
		}
		
		%>
		</table>
<a href = "checkfilm.jsp?curpage=1" >首页</a>  
<a href = "checkfilm.jsp?curpage=<%=curpage-1%>" >上一页</a>  
<a href = "checkfilm.jsp?curpage=<%=curpage+1%>" >下一页</a>  
<a href = "checkfilm.jsp?curpage=<%=pagecount%>" >尾页</a>  
第<%=curpage%>页/共<%=pagecount%>页  

</body>
</html>