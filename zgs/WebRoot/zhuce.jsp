<!DOCTYPE HTML>
<html>   
<head>      
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/reg.css">
</head>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/tab.js" type="text/javascript"></script>
<title>项目管理信息注册</title>
<script type="text/javascript">
function checkRegistration(){
	
    var form_valid1 = document.getElementById("username").value;
    var form_valid2 = document.getElementById("password").value;
    var form_valid3 = document.getElementById("email").value;
    var form_valid4 = document.getElementById("telenum").value;
    var form_valid5 = document.getElementById("level").value;
    
    if((form_valid1.length==0)|| (form_valid2.length==0) || (form_valid3.length==0)|| (form_valid4.length==0)|| (form_valid5.length==0)){
    	alert("请输入完整的信息");
        return false;
    }  
    return true;
}
</script>
<body>
	<div class="head_foot_content">
		<p class="title">注册</p>
			<div class="user">
				<form id="Zhuce" onsubmit="return checkRegistration()" action="Zhuceaction!add.action" method="post" name="zhuce">
					<div class="user_id"><p>昵称</p><input class="user_input" type="text" id="username" name="user.userName" placeholder="输入自己萌萌的昵称吧"/></div>
					<div class="user_id"><p>密码</p><input class="user_input" type="password" id="password"name="user.password" placeholder="密码交出来"/></div>
					<div class="user_id"><p>邮箱</p><input class="user_input" type="text" id="email" name="user.email" placeholder="不会给你发垃圾邮件哒"/></div>
					<div class="user_id"><p>联系方式</p><input class="user_input" type="text" id="telenum" name="user.telenum" placeholder="求骚扰"/></div>
					<div class="user_id"><p>身份</p><input  type="text" id="level" name="user.level" placeholder="求骚扰"/></div>
					
					<input class="submit" type="submit"  value="注册">
	             </form>
           </div>
     </div>
</body>
</head>
</html>