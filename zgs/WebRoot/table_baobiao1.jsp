<%@ page language="java" import="java.util.*,java.util.*,com.hwadee.zgs.service.*,com.hwadee.zgs.pojo.*,com.hwadee.zgs.dao.*,com.hwadee.zgs.pojo.*,com.hwadee.zgs.util.*,java.sql.SQLException,java.sql.Statement"  pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%	    	
	String pageIndex = request.getParameter("pageIndex");
	if (pageIndex == null) {
	    pageIndex = "1";
	}
	Pagination pagination=new Pagination();
	pagination=(Pagination)request.getAttribute("pagination");
    ArrayList<Project> list = (ArrayList)request.getAttribute("list");	
    
    int userid =(Integer)session.getAttribute("user_id");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/text.css" />
<link rel="stylesheet" href="css/960_24_col.css" />
<link rel="stylesheet" href="css/index.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
function goPage(pindex) {
	$("#pageIndex").val(pindex);
	$("#baobiaoForm").submit();
}
</script>


<title>郫县项目管理信息系统</title>
</head>

<body>
<div class="header">
  <h2 class="logo">郫县项目管理系统</h2>

</div>    
 
<div class="nav"> 
  <ul class="nav_first">
    <a href="project_manage.jsp"><li>项目管理</li></a>
    <li>报表查看</li>
    <a href="offical.jsp"><li>个人办公</li></a>
    <a href="personal_info.jsp"><li>个人信息</li></a>
  </ul>
</div>

 
<div class="container_24 container">
  <div class="grid_24 table_check">   
      <p class="content_title">报表查看</p>
      
      
		<form id="baobiaoForm" action="Xinxigongkaiaction!findBySome.action"
				method="post">
				<div class="search_select_option">
					<p>项目等级:</p>
					<input type="text" id="level" name="project.level"
						value="${project.level}">
				</div>
				<div class="search_select_option">
					<p>项目金额:</p>
					<input type="text" id="money" name="project.money"
						value="${project.money}">
				</div>
				<div class="search_select_option">
					<p>审批状态:</p>
					<input type="text" id="state" name="project.state"
						value="${project.state}">
				</div>
				<input type="submit" value="查询"> <input type="hidden"
					name="pagination.pageIndex" id="pageIndex">
			</form>
			
			
      <table class="table_project">
        <tr><th class="project_title">项目名</th><th class="project_intro">简介</th><th class="project_risk">等级</th><th class="project_sta">状态</th><th class="project_sta">金额</th><th class="project_fav">收藏</th></tr>
        
      </table>
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
