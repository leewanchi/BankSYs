<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>柜员用户管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="/WEB-INF/common/head.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/pager.js"></script>
<link href="${pageContext.request.contextPath}/static/css/pager.css"
	rel="stylesheet" />
<script type="text/javascript">
	function checktable() {
		$("#tableinfo").css("display", "block");
	}
	function unFreeze(userId){
		$.ajax({
            url:"teller/unFreezeTeller",
            type:"post",
            data:{"userId":userId},
            async:true,            
           success:function(data){  
 				if (data.i) {
 				   $(".cardId-msg").text("账号不存在").css("color","red");
 				   flag=false;
 				}if(data.i==1 ){
 					$(".cardId-msg").text("账号存在").css("color","green");
 					$("#customName").val(data.customName);
 					flag=true;
 				}
           }});
	}
</script>
</head>
<body>
	<!-- 页面顶部 -->
	<%@include file="/WEB-INF/common/top.jsp"%>
	<div class="container-fluid all">
<div class="sidebar">
    <ul class="nav">
        <li ><a href="${pageContext.request.contextPath}/account/index">主页面</a></li>
        <li class="has-sub">
            <a href="javascript:void(0);"><span>银行业务</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu" >
                <li ><a id="deposit" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;存款业务</a></li>
                <li><a id="withdrawal"><i class="fa fa-circle-o fa-fw"></i>&nbsp;取款业务</a></li>
                <li><a id="transfer" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;转账业务</a></li>
            </ul>
        </li>
        <li class="has-sub">
            <a href="javascript:void(0);"><span>查询业务</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu" >
                <li ><a id="checkaccount"><i class="fa fa-circle-o fa-fw"></i>&nbsp;账户信息</a></li>
                <li><a id="queryMore"><i class="fa fa-circle-o fa-fw"></i>&nbsp;交易明细</a></li>
            	<!-- <li ><a id="bigApplies"><i class="fa fa-circle-o fa-fw"></i>&nbsp;大额申请</a></li> -->
            </ul>
        </li>
        <!--todo 经理模块 -->       
        <li class="has-sub   active"><a href="javascript:void(0);"><span>经理业务</span><i
                class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu" style="display:block" >
                <li  class="active"><a id="managerIndex" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;柜员管理</a></li>
<!-- 
                <li><a id="managerBigMoney" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;大额交易</a></li> -->
            </ul>
        </li>
         <!--todo 管理员模块 -->
         <li class="has-sub"><a href="javascript:void(0);"><span>管理员业务</span><i
                 class="fa fa-caret-right fa-fw pull-right"></i></a>
             <ul class="sub-menu">
                 <li><a id="usermana"><i
                         class="fa fa-circle-o fa-fw"></i>&nbsp;用户管理</a></li>
                 <li><a id="rolemana" href="javascript:void(0);"><i
                         class="fa fa-circle-o fa-fw"></i>&nbsp;角色管理</a></li>
                 <li><a  id="systemlog" ><i
                         class="fa fa-circle-o fa-fw"></i>&nbsp;系统日志</a></li>
             </ul>
         </li>
       
    </ul>
</div>
		<%@include file="/WEB-INF/common/sidebar.jsp"%>
		<div class="maincontent row">
			<section class="content-header">
			<h2>
				Teller management <small></small>
			</h2>
			</section>
			<section class="content container-fluid">
			<div class="table-responsive">
				<table class="table">
					<caption>柜员信息表</caption>
					<thead>
						<tr>
							<th>工号</th>
							<th>柜员姓名</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="userList">
						
					</tbody>
				</table>
			</div>
			<!-- <div style="text-align: center">
				<div class="pager"></div>
			</div> -->
			</section>
		</div>
	</div>
	<a href="#top" id="goTop"><i class="fa fa-angle-up fa-3x"></i></a>
	<%@include file="../common/authModal.jsp"%>
</body>
<script type="text/javascript">
function getUserList(){
	 $.get("${pageContext.request.contextPath}/teller/getAllUser",function (result){
		  $("#userList").empty();
		  for(var i=0;i<result.length;i++){
			  var userId=result[i].userId;
			  var loginId = ${userinfo.userId};
			  if(userId==loginId){
					continue;
			  }
			  if(result[i].status==1){
				  $("#userList").append("<tr>\n    " +
		                    "<td>"+result[i].userId+"</td>" +
		                    "<td>"+result[i].userName+"</td>" +
		                    "<td>"+"正常"+"</td>" +
		                    "<td><button id=\"freeze_"+result[i].userId+"\" "+
		                    "type=\"button\" class=\"btn btn-primary btn-sm\"  onclick=\"freeze(\'"+result[i].userId+"\')\">冻结</button>\n\n\n    " +
		                    "<button id=\"thaw_"+result[i].userId+"\" type=\"button\" class=\"btn btn-primary btn-sm\" onclick=\"thaw(\'"+result[i].userId+"\')\">解冻</button></td>" +
		                    "</tr>");
			  }else{
				  $("#userList").append("<tr>\n    " +
		                    "<td>"+result[i].userId+"</td>" +
		                    "<td>"+result[i].userName+"</td>" +
		                    "<td>"+"冻结"+"</td>" +
		                    "<td><button id=\"freeze_"+result[i].userId+"\" "+
		                    "type=\"button\" class=\"btn btn-primary btn-sm\"  onclick=\"freeze(\'"+result[i].userId+"\')\">冻结</button>\n\n\n    " +
		                    "<button id=\"thaw_"+result[i].userId+"\" type=\"button\" class=\"btn btn-primary btn-sm\" onclick=\"thaw(\'"+result[i].userId+"\')\">解冻</button></td>" +
		                    "</tr>");
			  }
			  

		  }
	 });
}

/* 解冻按钮 */
function thaw(userId) {
    $.post("${pageContext.request.contextPath}/teller/userThaw/"+userId,
        {},function (data) {   	 
      	  if(data.status){
      		  alert(data.statusInfo);
      		getUserList();
      	  }else{
      		alert(data.statusInfo);
      	  }
        });
}
/*  冻结按钮 */
function freeze(userId) {
    $.post("${pageContext.request.contextPath}/teller/userFreeze/"+userId,
        {},function (data) {
      	  if(data.status){
      		  alert(data.statusInfo);
      		getUserList();
      	  }else{
      		alert(data.statusInfo);
      	  }
        });
}


//加载时动态获取用户信息
$(document).ready(function(){
	  getUserList();
});
    
</script>
</html>
