<%@page language="java" contentType="text/html;charset=utf-8" import="com.hwadee.zgs.dao.*,com.hwadee.zgs.pojo.*"%>
<%@ page import = "java.sql.*,com.hwadee.zgs.util.*,java.sql.SQLException,java.sql.Statement" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <title>验证页面</title>
  </head>


  <body>
  <%
  	request.setCharacterEncoding("UTF-8");
  	String name = request.getParameter("Username");
  	System.out.println(name);
  	String password = request.getParameter("Password");
   		try
      	{
      		Connection conn = DatabaseHelper.getConnection();
     		Statement stmt = conn.createStatement();
     		String sql = "select * from user where userName='"+name+"' and password='"+password+"'";
   			ResultSet rs = stmt.executeQuery(sql);
   			if(rs.next())
   			{
   				int user_id = rs.getInt("user_id");
				String level = rs.getString("level");
				session.setAttribute("Username",name);
				session.setAttribute("user_id",user_id);
				session.setAttribute("level",level);
				conn.close();
				stmt.close();
		%>
			<jsp:forward page = "indexlog1.jsp"></jsp:forward>
		<%
			}
   			else
   			{
   				out.println("错误的用户名或密码");
   		%>
  			<form action="login.html">
  				<button>返回</button>
  			</form>
  		<%
   			}
      	}
      	catch(Exception e)
      	{
      		e.printStackTrace();
      	}
 %>
 </body>
</html>
