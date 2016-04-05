<%@ page language="java" import="java.util.*,com.hwadee.zgs.dao.*,com.hwadee.zgs.action.*,com.hwadee.zgs.service.*,com.hwadee.zgs.pojo.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>郫县项目管理新闻中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/text.css" />
	<link rel="stylesheet" href="css/960_24_col.css" />
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="css/news.css" />

  </head>
   <%				
   					//String pageIndex = request.getParameter("pageIndex");
   					int news_id;
   					news_id=(Integer)request.getPatameter("news_id");
		        	//int news_id = (Integer)session.getAttribute("news_id");
		        	Newsdao dao=new Newsdao();
		        	News n=new News();
		        	n=dao.findById(news_id);		        		        	
		        	
		        %>
 <body>
<div class="header">
  <h2 class="logo">郫县项目管理新闻中心</h2>
</div>  
<div id="main_news">
<div class="main_news_head"><%=request.getParameter("hotel.hotelName") %></div>
<div class="main_news_title" align="center">电子科技大学欢迎你！</div>
<div class="main_news_info">来源凤凰新闻 &nbsp &nbsp &nbsp&nbsp&nbsp时间：2013-07-01</div>
<div class="main_news_content">王志强对新学院的成立表示祝贺。他说，国家高度重视网络空间安全，成立了由习近平总书记亲任组长的中央网络安全和信息化领导小组。今年7月初，国务院学位委员会、教育部又在"工学"门类下增设了"网络空间安全"一级学科。电子科大以服务国家战略为己任，力求以贡献求支持、在服务中求发展，成立网络空间安全学院既是适应国家安全战略的需要，也是学校积极实施"学科拓展"的重要举措。</br>他指出，学校经过认真研究、慎重考虑，决定网络空间安全学院与计算机科学与工程学院合署，希望计算机学院积极承担起主体责任来，真正将网络空间安全学院办好，将其作为计算机学院今后一段时期内的一项重点工作来抓，学校和各职能部门都将大力支持学院的建设和发展。他说，学科既是学院发展的重要平台，也是教师施展才华的舞台，网络空间安全学院近期的首要任务就是要齐心协力争取到网络空间安全一级学科博士点。他还对学院的干部队伍、师资力量、人才培养等工作提了要求。</div>
</div>
<div class="footer">
  <a href="#"><span>四川省政府</span></a>
  <a href="#"><span>郫县政府</span></a>
  <a href="#"><span>郫县少管所</span></a>
  <div>copyright 2015</div>
</div>  

</body>
</html>
