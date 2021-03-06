<%@ page language="java" import="java.util.*,com.hwadee.zgs.service.*,com.hwadee.zgs.pojo.*" pageEncoding="utf-8"%>
<%
    String pageIndex = request.getParameter("pageIndex");
    if (pageIndex == null) {
        pageIndex = "1";
    }
    Pagination pagination = new Pagination();
    pagination.setPageIndex(Integer.parseInt(pageIndex));
    Addlistservice service = new Addlistservice();
    int userid =(Integer)session.getAttribute("user_id");
    ArrayList<Addlist> cs = service.findAll(pagination,userid);
    String pageIndex1 = request.getParameter("pageIndex1");
    if (pageIndex1 == null) {
        pageIndex1 = "1";
    }
    Pagination pagination1 = new Pagination();
    pagination1.setPageIndex(Integer.parseInt(pageIndex1));
    Favoriteservice favoriteservice = new Favoriteservice();
    ArrayList<Project> bs = favoriteservice.findAll(pagination1, userid);
    String pageIndex2 = request.getParameter("pageIndex2");
    if (pageIndex2 == null) {
        pageIndex2 = "1";
    }
    Pagination pagination2 = new Pagination();
    pagination2.setPageIndex(Integer.parseInt(pageIndex));
    Logservice logservice=new Logservice();
    ArrayList<Log>  ds = logservice.findAllGeneral(pagination2,userid);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/text.css" />
<link rel="stylesheet" href="css/960_24_col.css" />
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/address.css">
<link rel="stylesheet" href="css/offcial_tele.css">

<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js" ></script>
<script type="text/javascript">
function checkRegistration(){
	
    var form_valid1 = document.getElementById("userName").value;
    var form_valid2 = document.getElementById("telenum").value;
    var form_valid3 = document.getElementById("email").value;
    if(form_valid1.length==0||form_valid2.lenght==0||form_valid3.length==0){
        alert("请输入完整的信息");
        return false;
    }
    return true;
}

function checkRegistration1(){
	
    var form_valid4 = document.getElementById("title").value;
    var form_valid5 = document.getElementById("content").value;
    if(form_valid4.length==0||form_valid5.lenght==0){
        alert("请输入完整的信息");
        return false;
    }
    return true;
}
function modLog() {
    var mbtype = document.getElementsByName("log.log_id");
    var selectId;
 for(var i=0;i<mbtype.length;i++){
   if (mbtype.item(i).checked) {
    selectId = mbtype.item(i).getAttribute("value");
    break;
   }
 }
    if (selectId == "") {
       alert("请选择！");
       return;
    }
    window.open("Logaction!findById.action?log.log_id="+selectId,"_self");
}
function delLog() {
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
    window.open("Logaction!del.action?log.log_id="+selectId,"_self");
}
$(document).ready(function(){
    $("#AddlistForm").validate();
});
</script>
<title>郫县项目管理信息系统-个人办公</title>
</head>

<body>
<div class="header">
  <h2 class="logo">郫县项目管理系统</h2>

</div>    
 
<div class="nav"> 
  <ul class="nav_first">
    <a href="project_manage.jsp"><li>项目管理</li></a>
    <a href="table_baobiao1.jsp"><li>报表查看</li></a>
    <a href="offical.jsp"><li>个人办公</li></a>
   <a href="personal_info.jsp"><li>个人信息</li></a>
  </ul>
</div>

 
<div class="container_24 container">
  <div class="grid_3 nav_left alpha">
    <ul>
      <a href="#"><li class="tabli tabIn">日志列表</li></a>
      <a href="#"><li class="tabli">写日志</li></a>
      <a href="#"><li class="tabli">通讯录</li></a>
      <a href="#"><li class="tabli">添加联系人</li></a>
      <a href="#"><li class="tabli">收藏夹</li></a>
      <a href="#"><li class="tabli edit" style="display:none;">修改日志</li></a>
      
    </ul>
  </div>
  <div class="grid_20 content_right">
    <!--   1日志列表-->
    
    <div class="inner tabCont log_list">
     <p class="content_title">日志列表</p>
     <div class="rightbar">

		<table class="mytable">
			<tr>
			<th scope="col">日志名称</th>
			<th scope="col">日期</th>
			<th scope="col">操作</th>

			</tr>
			<%
			 for(Log d:ds){
			 %>
			<tr>
              <form action="Logaction!findById.action" method="post">
				<td scope="row"><input type="text" name="log.log_id" value="<%=d.getLog_id() %>"  style="display: none;"><%=d.getTitle() %></td>
				<td class="td_center"><%=d.getTime() %></td>
				<td class="td_center">
				<input type="submit" class="edit_btn" value="编辑"/>
				</form>
				<form action="Logaction!del.action" method="post">
				<input type="text" name="log.log_id" value="<%=d.getLog_id() %>"  style="display: none;">
				<input type="submit" class="edit_btn" value="删除"/>
				</td>
				</form>
			</tr>
			<%} %>
		</table>
		<div class="grid_20">共<%=pagination2.getTotalRow()%>条记录，当前第<%=pagination2.getPageIndex()%>页/共<%=pagination2.getTotalPage()%>页 </div> <div class="grid_4"><a href="offical.jsp?pageIndex2=1" style="color: #000;text-decoration: none;cursor: pointer;">首页</a>&nbsp;<a href="offical.jsp?pageIndex2=<%=pagination2.getPageIndex()-1%>" style="color: #000;text-decoration: none;cursor: pointer;">上页</a>&nbsp;<a href="offical.jsp?pageIndex2=<%=pagination2.getPageIndex()+1%>"  style="color: #000;text-decoration: none;cursor: pointer;">下页</a>&nbsp;<a href="offical.jsp?pageIndex2=<%=pagination2.getTotalPage()%>"  style="color: #000;text-decoration: none;cursor: pointer;">末页</a></div>
	</div>
    </div>
    
    <!--   2写日志 -->

    <div class="inner">
      <p class="content_title">添加日志</p>
      <div class="text">
	    <form id="Log" onsubmit="return checkRegistration1()" action="Logaction!add.action" method="post">
	 	   <div class="log_title"><p>标题</p><input class="title_input" type="text" id="title" name="log.title" placeholder="请在此输入日志标题"></div>
           <div><textarea class="log_textarea" id="content" name="log.content" placeholder="请在此输入日志正文" ></textarea></div>
           <input type="text" name="log.user_id" value="<%=userid%>"  style="display: none;"/>
           <input type="submit" class="submit_btn" value="提交">
         
	 	    
	 	</form>
	  </div>
    </div>    
     
     
     <!-- 3通讯录列表 -->
    <div class="inner" >
      <p class="content_title">通讯录</p>
                 <!--  通讯录卡片 -->

     <%
     for(Addlist c:cs){
      %>
      <form id="shanchu" action="Addlistaction!del.action" method="post">           
      <div class="member_list">
		 <div class="no_line">
		   <p class="number"><input type="radio" name="addlist.addlist_id" value="<%=c.getAddlist_id()%>" checked="true"></p>
		 </div>
		 <div class="infor">
		   <p class="id">用户名:<%=c.getUserName()%></p>
		   <p class="phonenum">电话:<%=c.getTelenum()%></p>
		   <p class="mail">e-mail:<%=c.getEmail()%></p>
		   <input class="delete" type="submit" value="删除"/>
         </div>
       </div>
       </form>
       <%} %>
       <div class="grid_20">共<%=pagination.getTotalRow()%>条记录，当前第<%=pagination.getPageIndex()%>页/共<%=pagination.getTotalPage()%>页 </div> <div class="grid_4"><a href="offical.jsp?pageIndex=1" style="color: #000;text-decoration: none;cursor: pointer;">首页</a>&nbsp;<a href="offical.jsp?pageIndex=<%=pagination.getPageIndex()-1%>" style="color: #000;text-decoration: none;cursor: pointer;">上页</a>&nbsp;<a href="offical.jsp?pageIndex=<%=pagination.getPageIndex()+1%>"  style="color: #000;text-decoration: none;cursor: pointer;">下页</a>&nbsp;<a href="offical.jsp?pageIndex=<%=pagination.getTotalPage()%>"  style="color: #000;text-decoration: none;cursor: pointer;">末页</a></div>
	 </div>    
     
     <!--   4添加联系人 -->
    <div class="inner">
            <p class="content_title">添加联系人</p>
      		
			
			<div class="add">
			   <form id="Addaddlist" onsubmit="return checkRegistration()" action="Addlistaction!add.action" method="post">
			        <input type="text" name="addlist.list_user_id" value="<%=userid%>" class="required" style="display: none;"/>
					<div class="add_name"><p>姓名</p><input type="text" id="userName"  name="addlist.userName" class="required" placeholder="名字不能超过四个字"/></div>
					<div class="add_tel"><p>电话号码</p><input type="text" id="telenum" name="addlist.telenum" class="required number" placeholder="不可超过16位"/></div>
					<div class="add_name"><p>电子邮箱</p><input type="text" id="email" name="addlist.email" class="required" placeholder="支持各种邮箱地址"/></div>
					<input type="submit" class="submit" value="确定"/>
				</form>
			</div>
		
    </div>         
    
    <!-- 5收藏夹 -->
    <div class="inner" >
                <!--  收藏夹卡片 -->
                <%
                for(Project b:bs){
                 %>
      <div class="member_list">
	    <div class="member_line">
		  <div><p class="member_title">工程名称:<p><%=b.getProjectName() %></p></div>
	      <div><p class="member_title">项目名:  </p><p><%=b.getProjectName() %></p></div>
		  <div><p class="member_title">简介:   </p><p><%=b.getIntroduction() %></p></div>
		  <div><p class="member_title">等级:  </p><p><%=b.getLevel() %></p></div>
		  <div><p class="member_title">状态:   </p><p><%=b.getState() %></p></div>
		  <div><p class="member_title">起止时间: </p><p><%=b.getStartTime() %></p></div>
	    </div>
       </div>  
       <%} %>
       <div class="grid_20 whole_page">共<%=pagination1.getTotalRow()%>条记录，当前第<%=pagination1.getPageIndex()%>页/共<%=pagination1.getTotalPage()%>页 </div> <div class="grid_4"><a href="offical.jsp?pageIndex1=1" style="color: #000;text-decoration: none;cursor: pointer;">首页</a>&nbsp;<a href="offical.jsp?pageIndex1=<%=pagination1.getPageIndex()-1%>" style="color: #000;text-decoration: none;cursor: pointer;">上页</a>&nbsp;<a href="offical.jsp?pageIndex1=<%=pagination1.getPageIndex()+1%>"  style="color: #000;text-decoration: none;cursor: pointer;">下页</a>&nbsp;<a href="offical.jsp?pageIndex1=<%=pagination1.getTotalPage()%>"  style="color: #000;text-decoration: none;cursor: pointer;">末页</a></div>
     </div>  
             
 <div class="inner edit_log">
      <p class="content_title">修改日志</p>
      <div class="text">
	    <form>
	 	   <div class="log_title"><p>标题</p><input class="title_input" type="text" name="log.title" value="${log.title}" placeholder="请在此输入日志标题"></div>
           <div><textarea class="log_textarea" name="log.content" value="${log.cotent}" placeholder="请在此输入日志正文"  ></textarea></div>
           <input type="submit"  class="submit_btn return_list" value="提交">
         
	 	</form>
	  </div>
    </div>           
               
  
  </div>
</div>


<div class="footer">
  <a href="#"><span>四川省政府</span></a>
  <a href="#"><span>郫县政府</span></a>
  <a href="#"><span>郫县少管所</span></a>
  <div>copyright 2015</div>
</div>  
