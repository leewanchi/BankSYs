<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统日志管理</title>
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
	function gotopage(currentpage){
		window.location.href = 'queryLog?currentpage='+currentpage;
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
        
        <li class="has-sub "><a href="javascript:void(0);"><span>经理业务</span><i
                class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu"  >
                <li ><a id="managerIndex" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;柜员管理</a></li>

                <!-- <li><a id="managerBigMoney" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;大额交易</a></li> -->
            </ul>
        </li>

         <li class="has-sub   active"><a href="javascript:void(0);"><span>管理员业务</span><i
                 class="fa fa-caret-right fa-fw pull-right"></i></a>
             <ul class="sub-menu" style="display:block;" >
                 <li><a id="usermana"><i
                         class="fa fa-circle-o fa-fw"></i>&nbsp;用户管理</a></li>
                 <li><a id="rolemana" href="javascript:void(0);"><i
                         class="fa fa-circle-o fa-fw"></i>&nbsp;角色管理</a></li>
                 <li  class="active"><a  id="systemlog" ><i
                         class="fa fa-circle-o fa-fw"></i>&nbsp;系统日志</a></li>
             </ul>
         </li>
       
    </ul>
</div>
		 <%@include file="/WEB-INF/common/sidebar.jsp" %>
		<div class="maincontent row">
			<section class="content-header">
			<h2>
				System log <small></small>
			</h2>
			</section>
			<section class="content container-fluid">
			<div class="table-responsive">
				<table class="table">
					<caption>系统日志信息</caption>
					<thead>
						<tr>
							<th>时间</th>
							<th>方法</th>
							<th>日志信息</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pageQuery.slist}" var="syslog">
							<tr>
								<td>${syslog.createDate}</td>
								<td>${syslog.method}</td>
								<td>${syslog.message}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

					 <div >

				<div style="display: none;">

					共[${pageQuery.totalrecord} ]条记录，每页 [${pageQuery.pagesize} ]条，共[${pageQuery.totalpage} ]页，
				   	当前第[${pageQuery.currentpage}]页
				   	
				
				   	<a href="javascript:void(0)" onclick="gotopage(${pageQuery.previouspage})">上一页</a>
				   	<c:forEach var="pagenum" items="${pageQuery.pagebar}">
				   		<a href="javascript:void(0)" onclick="gotopage(${pagenum})">${pagenum}</a>
				   	</c:forEach>
				   	<a href="javascript:void(0)" onclick="gotopage(${pageQuery.nextpage})">下一页</a>

				</div>

			</div>
				<c:if test="${pageQuery.totalrecord !=0}">
					<div style="text-align: center">
						<!-- <div class="pager"></div> -->
						<nav aria-label="Page navigation">
						  <ul class="pagination">
						    <li>
						      <a href="javascript:void(0)" onclick="gotopage(1)" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <li>
							    <c:forEach var="pagenum" items="${pageQuery.pagebar}">
							   		<a href="javascript:void(0)" onclick="gotopage(${pagenum})">${pagenum}</a>
							   	</c:forEach>
						   	</li>
						    <li>
						      <a href="javascript:void(0)" onclick="gotopage(${pageQuery.totalpage})" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
				    </div>
				</c:if>
			</section>
		</div>
	</div>
	<a href="#top" id="goTop"><i class="fa fa-angle-up fa-3x"></i></a>
	<%@include file="../common/authModal.jsp"%>
</body>
</html>
