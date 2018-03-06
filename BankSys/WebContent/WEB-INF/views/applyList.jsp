<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>大额申请</title>
<%@include file="../common/head.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/pager.js"></script>
<link href="${pageContext.request.contextPath}/static/css/pager.css"
	rel="stylesheet" />
<script type="text/javascript">
	function checktable() {
		$("#tableinfo").css("display", "block");
	}
</script>
</head>
<body>
<%@include file="../common/top.jsp"%>
<div class="container-fluid all">
<div class="sidebar">
    <ul class="nav">
        <li ><a href="${pageContext.request.contextPath}/account/index">主页面</a></li>
        <li class="has-sub">
            <a href="javascript:void(0);"><span>银行业务</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu">
                <li><a id="deposit" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;存款业务</a></li>
                <li><a id="withdrawal"><i class="fa fa-circle-o fa-fw"></i>&nbsp;取款业务</a></li>
                <li><a id="transfer" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;转账业务</a></li>
            </ul>
        </li>
        <li class="has-sub active">
            <a href="javascript:void(0);"><span>查询业务</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu" style="display:block">
                <li><a id="checkaccount"><i class="fa fa-circle-o fa-fw"></i>&nbsp;账户信息</a></li>
                <li><a id="queryMore"><i class="fa fa-circle-o fa-fw"></i>&nbsp;交易明细</a></li>
            	<!-- <li class="active"><a id="bigApplies"><i class="fa fa-circle-o fa-fw"></i>&nbsp;大额申请</a></li> -->
            </ul>
        </li>
        <!--todo 经理模块 -->       
        <li class="has-sub"><a href="javascript:void(0);"><span>经理业务</span><i
                class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu">
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
	<%@include file="../common/sidebar.jsp"%>
		<div class="maincontent row">
			<section class="content-header">
			<h2>
			<small></small>
			</h2>
			</section>
			<div class="container">		

				<section class="content container-fluid">
				<div class="table-responsive">
					<table class="table">
						<caption>大额交易申请</caption>
						<thead>
							<tr>
								<th>编号</th>
								<th>转出账户</th>
								<th>转入账户</th>
								<th>金额</th>
								<th>币种</th>
								<th>类别</th>
								<th>申请时间</th>
								<th>柜员</th>
								<th>状态</th>
							</tr>
						</thead>
						<tbody id="applyList">

						</tbody>
					</table>
				</div>
				</section>	
			</div>
		</div>
	</div>
	<a href="#top" id="goTop"><i class="fa fa-angle-up fa-3x"></i></a>
	
	<%@include file="../common/authModal.jsp"%>
</body>
<shiro:hasRole name="teller">
<script type="text/javascript">

  function getApplyList() {
        $.post("${pageContext.request.contextPath}/bigMoney/getApplys/${userinfo.userId}",{},function (result) {    	
            $("#applyList").empty();
        	for(var i=0;i<result.data.length;i++){
        		var record=result.data[i];
	            $("#applyList").append("<tr>\n    " +
	                    "<td>"+record.billId+"</td>" +
	                    "<td>"+record.outAccount+"</td>" +
	                    "<td>"+record.inAccount+"</td>" +
	                    "<td>"+record.tradeMoney+"</td>" +
	                    "<td>"+record.currency+"</td>" +
	                    "<td>"+record.tradeType+"</td>" +
	                    "<td>"+record.tradeDate+"</td>" +
	                    "<td>"+record.tellerId+"</td>"+
	                    "<td>等待审核</td>");            
        	}        	
        });
    }
  $(document).ready(function() {
	  getApplyList();
  });
    
</script>
</shiro:hasRole>
</html>