<%@ page language="java" contentType="text/html" import="java.util.*,com.hwadee.zgs.service.*,com.hwadee.zgs.pojo.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    String pageIndex = request.getParameter("pageIndex");
    if (pageIndex == null) {
        pageIndex = "1";
    }
    Pagination pagination = new Pagination();
    pagination.setPageIndex(Integer.parseInt(pageIndex));
    Newsservice service = new Newsservice();
    ArrayList<News> cs = service.findAllGeneral(pagination);
    
    
    
    
    String pageIndex1 = request.getParameter("pageIndex1");
    if (pageIndex1 == null) {
        pageIndex1 = "1";
    }
    Pagination pagination1 = new Pagination();
    pagination1.setPageIndex(Integer.parseInt(pageIndex1));
    Xinxigongkaiservice service1 = new Xinxigongkaiservice();
    ArrayList<Project> cs1 = service1.findAllGeneral(pagination1);
    
    
    String pageIndex2 = request.getParameter("pageIndex2");
    if (pageIndex2 == null) {
        pageIndex2 = "1";
    }
    Pagination pagination2 = new Pagination();
    pagination2.setPageIndex(Integer.parseInt(pageIndex2));
    Newsservice service2 = new Newsservice();
    ArrayList<News> cs2 = service2.findSpecial(pagination2);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>郫县项目管理信息系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/text.css" />
<link rel="stylesheet" href="css/960_24_col.css" />
<link rel="stylesheet" href="css/index.css">
  </head>
  
  <body>
<div class="header">
  <h2 class="logo">郫县项目管理系统</h2>
  <a href="zhuce.html"><div class="log_reg_btn">注册</div></a>
  <a href="login.html"><div class="log_reg_btn">登录</div></a> 
</div>    
   
<div class="container_24">
  <div class="grid_7 news_list">
    <h4 class="news_list_title">焦点新闻</h4>
    <ul class="news_list_title_ul">
    <%
             for(News c:cs) {
           %>
           <tr align="center">
               <a href="index.jsp"><li><%=c.getTitle()%></li></a>
               <%System.out.println(c.getTitle()+"hello"); 
               System.out.println("hhhh");%>
           </tr>
           <%}%>
      
    </ul>
  </div>
  
  <div class="grid_7 news_list">
    <h4 class="news_list_title">政策概览</h4>
    <ul class="news_list_title_ul">
    <%
             for(News c:cs2) {
           %>
           <tr align="center">
               <a href="index.jsp"><li><%=c.getTitle()%></li></a>
               <%System.out.println(c.getNews_id()); %>
           </tr>
           <%}%>
    </ul>
  </div>

  
  <div class="grid_10 news_list">
      <h4 class="news_list_title">项目概览</h4>
    <ul class="news_list_title_ul">
    
     <%
             for(Project c:cs1) {
           %>
           <tr align="center">
               <a href="index.jsp"><li><%=c.getProjectName()%></li></a>
           </tr>
           <%}%>
     
    </ul>
  </div>
</div>
<div class="footer">
  <a href="#"><span>四川省政府</span></a>
  <a href="#"><span>郫县政府</span></a>
  <a href="#"><span>郫县少管所</span></a>
  <div>copyright 2015</div>
</div>  
</body>
</html>
