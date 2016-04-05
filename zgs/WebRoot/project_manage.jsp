<%@ page language="java" import="java.util.*,java.util.*,com.hwadee.zgs.service.*,com.hwadee.zgs.pojo.*,com.hwadee.zgs.dao.*,com.hwadee.zgs.pojo.*,com.hwadee.zgs.util.*,java.sql.SQLException,java.sql.Statement" pageEncoding="utf-8"%>
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
    Xinxigongkaiservice service = new Xinxigongkaiservice();
    ArrayList<Project> cs = service.findAllGeneral(pagination);
    
    String pageIndex1 = request.getParameter("pageIndex1");
    if (pageIndex1 == null) {
        pageIndex1 = "1";
    }
    Pagination pagination1 = new Pagination();
    pagination1.setPageIndex(Integer.parseInt(pageIndex1));
    Xinxigongkaiservice service1 = new Xinxigongkaiservice();
    int userid =(Integer)session.getAttribute("user_id");    
    %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/application.css">
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/text.css" />
<link rel="stylesheet" href="css/960_24_col.css" />
<link rel="stylesheet" href="css/index.css">


<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/tab.js" type="text/javascript"></script>

<script type="text/javascript">
function mod() {
    var selectId="";
    $("input:radio").each(function(){
       if (this.checked) {
          selectId = this.value;
       }
    });
    if (selectId == "") {
       alert("请选择！");
       return;
    }
    window.open("Xinxigongkaiaction!modById.action?project.project_id="+selectId,"_self");
}
function FormFunction(){
    alert("收藏成功");
}
function checkRegistration(){
    var form_valid1 = document.getElementById("projectName").value;
    var form_valid2 = document.getElementById("level").value;
    var form_valid3 = document.getElementById("money").value;
    var form_valid4 = document.getElementById("state").value;
    var form_valid5 = document.getElementById("introduction");
    var form_valid6 = document.getElementById("place");
    var form_valid7 = document.getElementById("startTime");
    var form_valid8 = document.getElementById("endTime");
    var form_valid9 = document.getElementById("content");
    var form_valid10 = document.getElementById("summary");
    var form_valid11= document.getElementById("risk");
    if((form_valid1.length==0)|| (form_valid2.length==0) || (form_valid3.length==0)|| (form_valid4.length==0)|| (form_valid5.length==0)
    ||(form_valid6.length==0)||(form_valid7.length==0)||(form_valid8.length==0)||(form_valid9.lenght==0)||(form_valid10.length==0)||(form_valid11==0)){
        alert("请输入完整的信息");
        return false;
    }
    return true;
}
</script>


<title>郫县项目管理信息系统-项目管理</title>
</head>

<body>
<div class="header">
  <h2 class="logo">郫县项目管理系统</h2>

</div>    
 
<div class="nav"> 
  <ul class="nav_first">
    <li>项目管理</li>
    <a href="table_baobiao1.jsp"><li>报表查看</li></a>
    <a href="offical.jsp"><li>个人办公</li></a>
    <a href="personal_info.jsp"><li>个人信息</li></a>
  </ul>
</div>

 
<div class="container_24 container">
  <div class="grid_3 nav_left alpha">
    <ul>
      <a href="#"><li class="tabli tabIn">全部项目</li></a>
      <a href="#"><li class="tabli">个人发布</li></a>
      <a href="#"><li class="tabli">添加项目</li></a>
      <a href="#"><li class="tabli">项目审批</li></a>
    </ul>
  </div>
  <div class="grid_20 content_right">
    
    <div class="inner tabCont" >
      <p class="content_title">全部项目</p>
      <table class="table_project">
        <tr><th class="project_title">项目名</th><th class="project_intro">简介</th><th class="project_risk">等级</th><th class="project_sta">状态</th><th class="project_fav">收藏</th></tr>
        <%
             for(Project c:cs) {
           %>
           <tr align="center">
               <form action="Favoriteaction!add.action" method="post">
                <input type="text" name="favorite.user_id" value="<%=userid%>" style="display:none;">
                <input type="text" name="favorite.project_id" value="<%=c.getProject_id()%>" style="display:none;">
                <td class="project_title" ><%=c.getProjectName()%></td>
                <td class="project_intro" maxlength="30"><%=c.getIntroduction()%></td>
                <td class="project_risk" maxlength="10"><%=c.getLevel()%></td>
                <td class="project_sta" maxlength="10"><%=c.getState()%></td>
                <td class="project_fav"><input onclick="FormFunction();" type="submit" value="收藏"></td></form>
           </tr>
           <%}%>
      </table>
      <div class="whole_page"><p>共<%=pagination.getTotalRow()%>条记录，当前第<%=pagination.getPageIndex()%>页/共<%=pagination.getTotalPage()%>页 </p> 
    <p><a href="project_manage.jsp?pageIndex=1">首页</a>&nbsp;<a href="project_manage.jsp?pageIndex=<%=pagination.getPageIndex()-1%>" >上页</a>&nbsp;<a href="project_manage.jsp?pageIndex=<%=pagination.getPageIndex()+1%>" >下页</a>&nbsp;<a href="project_manage.jsp?pageIndex=<%=pagination.getTotalPage()%>" >末页</a></p></div>
    </div>
    
    
    
       
    
    <%
    ArrayList<Project> cs1 = service1.findAllGeneral(pagination1,userid);
    %>
   
   
   
   
    <div class="inner" >
      <p class="content_title">个人发布项目</p>
      
      
      <table class="table_project">
        <tr><th class="project_title">项目名</th><th class="project_intro">简介</th><th class="project_risk">等级</th><th class="project_sta">状态</th><th class="project_fav">选择</th></tr>
           
           <%
             for(Project c:cs1) {
           %>
           
           <tr align="center">
                <form action="Favoriteaction!add.action" method="post">
                <input type="text" name="favorite.user_id" value="<%=userid%>" style="display:none;">
                <input type="text" name="favorite.project_id" value="<%=c.getProject_id()%>" style="display:none;">
                <td class="project_title" ><%=c.getProjectName()%></td>
                <td class="project_intro" maxlength="30"><%=c.getIntroduction()%></td>
                <td class="project_risk" maxlength="10"><%=c.getLevel()%></td>
                <td class="project_sta" maxlength="10"><%=c.getState()%></td>
                <td class="project_fav"><input onclick="FormFunction();" type="submit" value="收藏"></td></form>
           </tr>
           
           <%}%>
                 
      </table>
      
      <div class="whole_page"><p>共<%=pagination1.getTotalRow()%>条记录，当前第<%=pagination1.getPageIndex()%>页/共<%=pagination1.getTotalPage()%>页 </p> 
    <p><a href="project_manage.jsp?pageIndex1=1">首页</a>&nbsp;<a href="project_manage.jsp?pageIndex1=<%=pagination1.getPageIndex()-1%>" >上页</a>&nbsp;<a href="project_manage.jsp?pageIndex1=<%=pagination1.getPageIndex()+1%>" >下页</a>&nbsp;<a href="project_manage.jsp?pageIndex1=<%=pagination1.getTotalPage()%>" >末页</a></p></div>
    </div>
    
    
    
    
    
     <!-- 添加项目 -->
    <div class="inner" >
      <p class="content_title">申请新项目</p>
      <form id="shenqingForm" onsubmit="return checkRegistration()" action="Xiangmuguanliaction!add.action" method="post">
      <div class="project_header">
	    <p class="item_name">项目名称</p>
	    <input type="text" class="pname" id="projectName" name="project.projectName" placeholder="请输入项目名称" size="60">
	  </div>
      <div class="project_add">
        <p class="item_name">项目储备信息</p>
       
            <table class="mytable">
            <tr>
            <td class="td">项目类型：</td>
            <td class="td">
            <input type="text" id="level" name="project.level"/>        	
            </td>
            
            <td>项目金额：</td>
            <td><input type="text" id="money" name="project.money">（万元）</td>
            <td><input type="text" name="project.user_id" value="<%=userid%>" style="display: none;"/></td>
          </tr>
        
       	  <tr>
            <td>完成情况：</td>
            <td colspan="3"><textarea id="state" name="project.state"></textarea></td>
          </tr>
        
          <tr>
            <td>项目简介：</td>
            <td><input type="text" id="introduction" name="project.introduction"></td>
          </tr>
          <tr>
            <td>建设地点：</td>
            <td><input type="text" id="place" name="project.place"></td>
          </tr>
        
          <tr>
            <td>开始时间：</td>
            <td><input class="easyui-datebox" style="width:150px;height:30px;" id="startTime" name="project.startTime"></input></td>
            <td>结束时间：</td> 
            <td><input class="easyui-datebox" style="width:150px;height:30px;" id="endTime" name="project.endTime"></input></td>
          </tr>
        
          <tr>
            <td>项目内容：</td>
            <td colspan="3"><textarea id="content" name="project.content"></textarea></td> 
          </tr>
       
          <tr>
            <td>项目成果概述：</td>
            <td colspan="3" class="td"><textarea id="summary" name="project.summary"></textarea></td>
          </tr>
        
          <tr>
            <td>风险评估：</td>
            <td colspan="3"><textarea id="risk" name="project.risk"></textarea></td>
          </tr>
      </table>
      <input type="submit" class="submit_btn" value="提交">
      
	</div>
    </form>
    </div>
    
   
   
   
   
    
    <%
   
    if((session.getAttribute("level").equals("市政府"))||(session.getAttribute("level").equals("发改委"))) 
    {%>
          <div class="inner">
          <p class="content_title">项目审批</p>
          <table class="table_project">
          <tr><th class="project_fav">选择</th><th class="project_title">项目名</th><th class="project_intro">简介</th><th class="project_risk">等级</th><th class="project_sta">状态</th></tr>
           <%
           ArrayList<Project> cs2 = service.findAllGeneral2(pagination);
             for(Project c:cs2) {
           %>
           <tr align="center">
               <tr><td class="project_fav"><input type="radio" name="project.project_id" value="<%=c.getProject_id()%>"></td>
               <td class="project_title" ><%=c.getProjectName()%></td>
               <td class="project_intro" maxlength="30"><%=c.getIntroduction()%></td>
               <td class="project_risk" maxlength="10"><%=c.getLevel()%></td>
               <td class="project_sta" maxlength="10"><%=c.getState()%></td>
           </tr>
           <%}%>
           <p><button onclick="mod()">通过</button></p>
          </table>
          <div class="whole_page"><p>共<%=pagination.getTotalRow()%>条记录，当前第<%=pagination.getPageIndex()%>页/共<%=pagination.getTotalPage()%>页 </p> 
    <p><a href="indexlog1.jsp?pageIndex=1">首页</a>&nbsp;<a href="index.jsp?pageIndex=<%=pagination.getPageIndex()-1%>" >上页</a>&nbsp;<a href="index.jsp?pageIndex=<%=pagination.getPageIndex()+1%>" >下页</a>&nbsp;<a href="index.jsp?pageIndex=<%=pagination.getTotalPage()%>" >末页</a></p></div>
          </div>       
    <%}
    else {%>
    <div class='inner'>
          <p class='content_title'>项目审批</p>
          <p>抱歉，你不具有审批权限。</p>
    </div>  
    <%}%>
    
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
