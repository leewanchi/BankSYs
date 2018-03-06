<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>存款</title>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@include file="/WEB-INF/common/head.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/deposit.js"></script>
</head>
<body>
	<!-- 页面顶部 -->
	<%@include file="/WEB-INF/common/top.jsp"%>
	<div class="container-fluid all">
		<!-- 左侧边 -->
<div class="sidebar">
    <ul class="nav">
        <li ><a href="${pageContext.request.contextPath}/account/index">主页面</a></li>
        <li class="has-sub  active">
            <a href="javascript:void(0);"><span>银行业务</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu" style="display:block">
                <li  class="active"><a id="deposit" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;存款业务</a></li>
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
        <li class="has-sub "><a href="javascript:void(0);"><span>经理业务</span><i
                class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu" >
                <li><a id="managerIndex" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;柜员管理</a></li>

                <!-- <li><a id="managerBigMoney" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;大额交易</a></li> -->
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
				Deposit page <small>You are working on a deposit</small>
			</h2>
			</section>
			<!-- Main content -->
			<section class="content container-fluid">
			<div style="padding: 100px 400px 10px 400px; width: 1200px">
				<form id="subdeposit" name="subdeposit"
					class="bs-example bs-example-form" role="form" method="post" action="${pageContext.request.contextPath}/saveMoney"
					onsubmit="return check()">
					<span class="msg" >${msg}</span>
					<c:if test="${msg!=null && msg!=''}">
						<script type="text/javascript">
							$(function(){
								var msg=${msg};
								$("#msgModal").modal();
								$("#msg").empty().html(msg);
							});
						</script>
					</c:if>
					<div class="input-group">
						<span class="input-group-addon">账户</span> 
						<input type="text" class="form-control" placeholder="account" id="cardId" name="cardId" onblur="checkAccount()">
						<span class="input-group-addon" id="input-group-account" ><span class="cardId-msg"></span></span> 
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">姓名</span> <input type="text"
							class="form-control" placeholder="name" id="customName"
							name="customName" readonly="readonly">
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">金额</span> <input type="text"
							class="form-control" placeholder="amount" id="tradeMoney"
							name="tradeMoney" onblur="checkAmounts()">
						<span class="input-group-addon" id="input-group-tradeMoney" ><span class="tradeMoney-msg"></span></span> 
					</div>
					<br>
					<div class="subButton">
						<button type="submit" class="btn btn-primary btn-lg btn-block"
							style="background-color: #00ACAC;" onclick="check()">提交</button>
							
					</div>
				</form>
			</div>
			</section>
		</div>
	</div>
	<a href="#top" id="goTop"><i class="fa fa-angle-up fa-3x"></i></a>
</body>
   <!-- Modal -->
<div id="msgModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
                   <h3 id="msg"></h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<%@include file="../common/authModal.jsp"%>
</html>
