<%@ page language="java" import="java.util.*,com.hwadee.zgs.service.*,com.hwadee.zgs.pojo.*" pageEncoding="utf-8"%>


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
<script type="text/javascript" src="/cdjy/js/jquery.js"></script>
<script type="text/javascript" src="/cdjy/js/jquery.validate.js" ></script>
<%
 Log l=new Log();
 %>
<script type="text/javascript">
$(document).ready(function(){
    $("#LogForm").validate();
    var inner="";
    $("#log_text").value=inner;
});
</script>
<title>郫县项目管理信息系统-个人办公</title>
</head>

<body>
<div class="header">
  <h2 class="logo">自贡市项目管理系统</h2>

</div>    
 
<div class="nav"> 
  <ul class="nav_first">
    <li>项目管理
      <ul class="nav_second">
        <li>全部项目</li>
        <li>个人发布</li>
        <li>添加项目</li>
        <li>项目审批</li>
       
      </ul>      
    </li>
    <li>报表查看</li>
    <li>个人办公
      <ul class="nav_second">
        <li>通讯录</li>
        <li>个人日志</li>
        <li>收藏夹</li>
      </ul>
    </li>
    <li>个人信息
      <ul class="nav_second">
        <li>个人信息查看</li>
        <li>个人信息修改</li>
        </ul>
    </li>
  </ul>
  </div>

 
<div class="container_24 container">

  <div class="grid_24 content_right">
    <!--   1日志列表-->
    

    
    <!--   2写日志 -->
   
      <p class="content_title">修改日志</p>
      <div class="text">
	    <form id="LogForm"  action="Logaction!mod.action" method="post">
	 	   <div class="log_title"><p>标题</p><input class="title_input" type="text" name="log.title" value="${log.title}" placeholder="请在此输入日志标题"></div>
           <div><textarea class="log_textarea"  name="log.content" value="${log.content} placeholder="请在此输入日志正文" id="log_text"></textarea></div>
           <input type="hidden" name="log.log_id" value="${log.log_id}">
           <input type="hidden" name="log.user_id" value="${log.user_id}">
           <input type="hidden" name="log.time" value="${log.time}">
           <input type="submit" class="submit_btn" value="提交">
         
	 	    
	 	</form>
	  </div>
  
     


  
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
  