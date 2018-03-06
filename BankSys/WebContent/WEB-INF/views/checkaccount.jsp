<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看账户信息</title>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <%@include file="/WEB-INF/common/head.jsp" %>
    <script src="${pageContext.request.contextPath}/static/js/searchInfo.js"></script>
    <script type="text/javascript">
    function checktable(){
    	$("#tableinfo").css("display","block");
    }
    
    </script>
</head>
<body>
    <!--  页面顶部 -->
    <%@include file="/WEB-INF/common/top.jsp" %>
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
        <li class="has-sub  active">
            <a href="javascript:void(0);"><span>查询业务</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu" style="display:block">
                <li  class="active"><a id="checkaccount"><i class="fa fa-circle-o fa-fw"></i>&nbsp;账户信息</a></li>
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
           <%@include file="/WEB-INF/common/sidebar.jsp" %>

        <div class="maincontent row">
			<section class="content-header"> 
				<h2> 
					Account information 
					<small>Perform query account information</small> 
				</h2> 
			</section> 
          
            <!--我是主要内容 end-->
			<section class="content container-fluid">
			   <div style="padding:100px 400px 10px 400px;width: 1200px">
                   <div id="ca">
                   	<form >
                   		<div style="float: left;">
                           <span  style="font-family:楷体;font-size:22px;">账号</span>
                           <input type="text" id="searchAccount" name="searchAccount" style="text-indent: 30px;width: 200px; margin-left: 15px;">
                       </div>
                       <div  id="cs"  style="margin-left: 15px;"> <button type="button" id="searchAccountInfo"  style="background-color:#00ACAC;width:55px;height:33px; border-radius:6px;border:none;"
                        >查询</button></div>
                       <div ><span class="searchAccount-msg"></span></div>
                   	</form>
                       
                   </div>
                   <div id="customtable">
                   	
                   </div>
			        
				</div>
			</section>
			
        </div>
    </div>
    <a href="#top" id="goTop"><i class="fa fa-angle-up fa-3x"></i></a>
    
    <%@include file="../common/authModal.jsp"%>
</body>
</html>
<%-- <table id="tableinfo"  style="display:none;">
					   <tr style="height:40px;">
					       <td><span style="font-family:楷体;font-size:18px;">卡号</span></td>
					       <td style="text-indent:15px;"><span style="font-family:楷体;font-size:18px;">${custom.cardId }</span></td>
					   </tr>
					   <tr style="height:40px;">
						   <td><span style="font-family:楷体;font-size:18px;">姓名</span></td>
					       <td style="text-indent:15px;"><span style="font-family:楷体;font-size:18px;">${custom.customName }</span></td>
					   </tr>
					   <tr style="height:40px;">
					       <td><span style="font-family:楷体;font-size:18px;">性别</span></td>
					       <td style="text-indent:15px;"><span style="font-family:楷体;font-size:18px;">${custom.sex }</span></td>
					   </tr>
					   <tr style="height:40px;">
						   <td><span style="font-family:楷体;font-size:18px;">身份证号</span></td>
					       <td style="text-indent:15px;"><span style="font-family:楷体;font-size:18px;">${custom.id }</span></td>
					   </tr>
					   <tr style="height:40px;">
						   <td><span style="font-family:楷体;font-size:18px;">余额</span></td>
					       <td style="text-indent:15px;"><span style="font-family:楷体;font-size:18px;">${custom.balance }</span></td>
					   </tr>
					   <tr style="height:40px;">
					       <td><span style="font-family:楷体;font-size:18px;">状态</span></td>
					       <td style="text-indent:15px;"><span style="font-family:楷体;font-size:18px;">${custom.status }</span></td>
					   </tr>
					</table> --%>
