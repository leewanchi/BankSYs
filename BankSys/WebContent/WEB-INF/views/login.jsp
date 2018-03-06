<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css" />
   	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="text/javascript">
    	
		window.onload = function() {
			history.pushState(null, null, document.URL);
	        window.addEventListener('popstate', function () {
	            history.pushState(null, null, document.URL);
	        });
			var config = {
				vx : 4,
				vy : 4,
				height : 2,
				width : 2,
				count : 100,
				color : "121, 162, 185",
				stroke : "100, 200, 180",
				dist : 6000,
				e_dist : 20000,
				max_conn : 10
			};
			CanvasParticle(config);
		};
		
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/canvas-particle.js"></script>
</head>
<body>
<div class="page">
	<div class="loginwarrp">
		<div class="logo">用户登陆</div>
        <div class="login_form">
			<form >
				<li class="login-item">
					<span>用户名：</span>
					<input type="text" id="username" name="username" class="login_input" >
                                        <span id="count-msg" class="error"></span>
				</li>
				<li class="login-item">
					<span>密　码：</span>
					<input type="password" id="password" name="password" class="login_input" >
                                        <span id="password-msg" class="error"></span>
				</li>
                <br>
                <br>
				<li class="login-sub">
					<input id="loginbtn" type="button"  value="登录" style="background-color:#00ACAC; "/>
                    <input type="reset" name="Reset" value="重置" style="background-color:#00ACAC; "/>
				</li>                      
           </form>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	$('#username').focus().blur(checkName);
	$('#password').blur(checkPassword);
	$('#loginbtn').click(function(){
		$.post("${pageContext.request.contextPath}/login/userLogin",{"username":$("#username").val(),"password":$("#password").val()},
				 function(result) {
		
	      if(result.status){
	           window.location.href="${pageContext.request.contextPath}/account/index";
	       }else{
	    	   alert(result.statusInfo);
	       }
	  	
	   });
	});
});


function checkName(){
	var name = $('#username').val();
	if(name == null || name == ""){
		//提示错误
		$('#count-msg').html("用户名不能为空");
		return false;
	}
	
	$('#count-msg').empty();
	return true;
}

function checkPassword(){
	var password = $('#password').val();
	if(password == null || password == ""){
		//提示错误
		$('#password-msg').html("密码不能为空");
		return false;
	}
	var reg = /^\w{3,10}$/;
	if(!reg.test(password)){
		$('#password-msg').html("输入3-10个字母或数字或下划线");
		return false;
	}
	$('#password-msg').empty();
	return true;

}

</script>

</html>