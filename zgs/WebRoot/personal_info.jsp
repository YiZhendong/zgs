<%@ page language="java" import="java.util.*,com.hwadee.zgs.service.*,com.hwadee.zgs.pojo.*,com.hwadee.zgs.dao.*,com.hwadee.zgs.pojo.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import = "java.sql.*,com.hwadee.zgs.util.*,java.sql.SQLException,java.sql.Statement" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/text.css" />
<link rel="stylesheet" href="css/960_24_col.css" />
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/address.css">
<link rel="stylesheet" href="css/personal_info.css">


<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/tab.js" type="text/javascript"></script>
<script>
function checkRegistration(){
	
    var form_valid1 = document.getElementById("userName").value;
    var form_valid2 = document.getElementById("password").value;
    var form_valid3 = document.getElementById("email").value;
    var form_valid4 = document.getElementById("telenum").value;
    if((form_valid1.length==0)|| (form_valid2.length==0) || (form_valid3.length==0)|| (form_valid4.length==0)){
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
    <a href="project_manage.jsp"><li>项目管理</li></a>
    <a href="table_baobiao1.jsp"><li>报表查看</li></a>
    <a href="offical.jsp"><li>个人办公</li></a>
    <li>个人信息</li>
  </ul>
</div>

 
<div class="container_24 container">
  <div class="grid_3 nav_left alpha">
    <ul>
      <a href="#"><li class="tabli tabIn">查看信息</li></a>
      <a href="#"><li class="tabli">修改信息</li></a>
   
    </ul>
  </div>
  <div class="grid_20 content_right">
    <%
		        	int user_id = (Integer)session.getAttribute("user_id");
		        	Xinxiguanlidao dao=new Xinxiguanlidao();
		        	User u=new User();
		        	u=dao.findById(user_id);		        		        	
		        	
		        %>
    <div class="inner tabCont" >
      <p class="content_title">个人信息查看</p>
      <div class="member_list">
	    <div class="member_line">
		 
           <div><p class="member_title">用户名：</p><p ><%=u.getUserName()%></p></div>
	      <div><p class="member_title">密码：    </p><p><%=u.getPassword() %></p></div> <!-- 应该删去 -->
          <div><p class="member_title">email：  </p><p><%=u.getEmail()%></p></div>
		  <div><p class="member_title">联系方式：    </p><p><%=u.getTelenum()%></p></div>
		 
		  <div><p class="member_title">身份：</p> <p><%=u.getLevel()%></p></div>
	    </div>
      </div>      
    </div>
    
    <div class="inner" >
  
		        
		         <p class="content_title">个人信息修改</p>
				<div class="user">
					<form id="userForm" onsubmit="return checkRegistration()" action="Xinxiguanliaction!moduser.action" method="post">
						
						<input class="user_input" type="text" name="user.user_id" style="display: none;" value="<%=u.getUser_id()%>"/>
						<div class="user_id"><p>昵称:</p><input class="user_input" type="text" id="userName" name="user.userName" value="<%=u.getUserName()%>" placeholder="输入自己萌萌的昵称吧"></div>
						<div class="user_id"><p>密码:</p><input class="user_input" type="password" id="password" name="user.password" value="<%=u.getPassword() %>" placeholder="密码交出来"></div>
						<div class="user_id"><p>邮箱:</p><input class="user_input" type="text" id="email" name="user.email" value="<%=u.getEmail()%>" placeholder="不会给你发垃圾邮件哒"></div>
						<div class="user_id"><p>联系方式:</p><input class="user_input" type="text" id="telenum" name="user.telenum" value="<%=u.getTelenum()%>" placeholder="求骚扰"></div>
                        <div class="user_id"><p>身份:</p><span><%=u.getLevel()%></span></div>
                        <input type="submit" class="submit_btn" value="提交">
                        
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

</body>
</html>
