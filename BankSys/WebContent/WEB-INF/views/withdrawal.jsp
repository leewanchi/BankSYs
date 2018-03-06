<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>取款</title>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="/WEB-INF/common/head.jsp"%>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/withdrawal.js"></script> 
</head>
<body>
	<!--   页面顶部 -->
	<%@include file="/WEB-INF/common/top.jsp"%>
	<div class="container-fluid all">
	<div class="sidebar">
    <ul class="nav">
        <li ><a href="${pageContext.request.contextPath}/account/index">主页面</a></li>
        <li class="has-sub  active">
            <a href="javascript:void(0);"><span>银行业务</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu"  style="display:block">
                <li ><a id="deposit" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;存款业务</a></li>
                <li class="active"><a id="withdrawal"><i class="fa fa-circle-o fa-fw"></i>&nbsp;取款业务</a></li>
                <li><a id="transfer" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;转账业务</a></li>
            </ul>
        </li>
        <li class="has-sub ">
            <a href="javascript:void(0);"><span>查询业务</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu" >
                <li ><a id="checkaccount"><i class="fa fa-circle-o fa-fw"></i>&nbsp;账户信息</a></li>
                <li ><a id="queryMore"><i class="fa fa-circle-o fa-fw"></i>&nbsp;交易明细</a></li>
            	<!-- <li ><a id="bigApplies"><i class="fa fa-circle-o fa-fw"></i>&nbsp;大额申请</a></li> -->
            </ul>
        </li>
        <!--todo 经理模块 -->       
        <li class="has-sub"><a href="javascript:void(0);"><span>经理业务</span><i
                class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu"  >
                <li ><a id="managerIndex" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;柜员管理</a></li>

                <!-- <li><a id="managerBigMoney" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;大额交易</a></li> -->
            </ul>
        </li>
         <!--todo 管理员模块 -->
         <li class="has-sub "><a href="javascript:void(0);"><span>管理员业务</span><i
                 class="fa fa-caret-right fa-fw pull-right"></i></a>
             <ul class="sub-menu" >
                 <li ><a id="usermana"><i
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
				Withdrawal page <small>You are doing the withdrawal</small>
			</h2>
			</section>
			<!-- Main content -->
			<section class="content container-fluid">
			<div style="padding: 100px 400px 10px 400px; width: 1200px">
				<form class="bs-example bs-example-form" role="form" method="post"
					action="${pageContext.request.contextPath}/drawMoney" onsubmit="return checkPass()">
					<span class="msg" >${msg}</span>
					<div class="input-group" id="wn">
						<span class="input-group-addon">账户</span> <input type="text"
							class="form-control" placeholder="account" id="cardId"
							name="cardId" onfocus="clearInfo1()"> <span class="input-group-addon"
							id="input-group-account"><span class="cardId-msg"></span></span>
					</div>
					<br>
					<div class="input-group" id="wa">
						<span class="input-group-addon">金额</span> <input type="text"
							class="form-control" placeholder="amount" id="tradeMoney"
							name="tradeMoney" onfocus="clearInfo2()"> <span class="input-group-addon"
							id="input-group-account"><span class="tradeMoney-msg"></span></span>
					</div>
					<br>
					<!-- onclick="valipass();" -->
					<div class="subButton" id="ws">
						<button type="button" id="Button"
							class="btn btn-primary btn-lg btn-block"
							style="background-color: #00ACAC;" onclick="checkAll()">确定</button>
					</div>
					<div class="input-group" id="wf" style="display: none;">
						<span style="font-family: 楷体; font-size: 20px; color: red;">请输入密码</span>
					</div>
					<br>
					<div class="input-group" id="wp" style="display: none;">
						<span class="input-group-addon">密码</span> <input type="text"
							class="form-control" placeholder="password" id="password"
							name="password" onfocus="clearInfo3()"><span class="input-group-addon"
							id="input-group-account"><span class="passWord-msg"></span></span>
					</div>
					<br>
					<div class="subButton" id="wc" style="display: none;">
						<button type="submit" id="SButton" class="btn btn-primary btn-lg btn-block"
							 style="background-color: #00ACAC;">提交</button>
					</div>
				</form>
			</div>
			</section>
		</div>
	</div>
	<a href="#top" id="goTop"><i class="fa fa-angle-up fa-3x"></i></a>
<%@include file="../common/authModal.jsp"%>
</body>
</html>
