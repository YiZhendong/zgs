<%@ page language="java" contentType="text/html" import="java.util.*,com.hwadee.zgs.service.*,com.hwadee.zgs.pojo.*" pageEncoding="utf-8"%>
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
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/text.css" />
<link rel="stylesheet" href="css/960_24_col.css" />
<link rel="stylesheet" href="css/index.css">

<title>郫县项目管理信息系统</title>
</head>

<body>
<div class="header">
  <h2 class="logo">郫县项目管理系统</h2>

</div>    
 
<div class="nav"> 
  <ul class="nav_first">
    <%if((session.getAttribute("level")!="市政府")&&(session.getAttribute("level")!="监察局")) 
          out.println("<a href='project_manage.jsp'><li>项目管理</li></a>");
    %>     
    <a href="table_baobiao1.jsp"><li>报表查看</li></a>
    <a href="offical.jsp"><li>个人办公</li></a>
    <a href="personal_info.jsp"><li>个人信息</li></a>
  </ul>
</div>

 
<div class="container_24 container">



   
  <div class="grid_12 news_list">
    <h4 class="news_list_title" align="center">焦点新闻</h4>
    <ul class="news_list_title_ul news_list_title_ul_page">
     <%
             for(News c:cs) {
           %>
           <tr align="center">
               <a href="#"><li><%=c.getTitle()%></li></a>
           </tr>
           <%}%>
       </ul>
     <div class="whole_page"><p>共<%=pagination.getTotalRow()%>条记录，当前第<%=pagination.getPageIndex()%>页/共<%=pagination.getTotalPage()%>页 </p> 
    <p><a href="indexlog1.jsp?pageIndex=1">首页</a>&nbsp;<a href="indexlog1.jsp?pageIndex=<%=pagination.getPageIndex()-1%>" >上页</a>&nbsp;<a href="indexlog1.jsp?pageIndex=<%=pagination.getPageIndex()+1%>" >下页</a>&nbsp;<a href="indexlog1.jsp?pageIndex=<%=pagination.getTotalPage()%>" >末页</a></p></div>
  
  </div>
  
  <div class="grid_12 news_list">
    <h4 class="news_list_title" align="center">项目概览</h4>
 
    <ul class="news_list_title_ul">
      <%
             for(Project c:cs1) {
           %>
           <tr align="center">
               <a href="#"><li><%=c.getProjectName()%></li></a>
           </tr>
           <%}%>
   
    </ul>
    <div class="whole_page"><p>共<%=pagination1.getTotalRow()%>条记录，当前第<%=pagination1.getPageIndex()%>页/共<%=pagination1.getTotalPage()%>页 </p> 
    <p><a href="indexlog1.jsp?pageIndex1=1">首页</a>&nbsp;<a href="indexlog1.jsp?pageIndex1=<%=pagination1.getPageIndex()-1%>" >上页</a>&nbsp;<a href="indexlog1.jsp?pageIndex1=<%=pagination1.getPageIndex()+1%>" >下页</a>&nbsp;<a href="indexlog1.jsp?pageIndex1=<%=pagination1.getTotalPage()%>" >末页</a></p></div>
  
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
