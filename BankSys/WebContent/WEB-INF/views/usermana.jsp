<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<title>柜员用户管理</title>

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
            <ul class="sub-menu" >
                <li ><a id="deposit" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;存款业务</a></li>
                <li><a id="withdrawal"><i class="fa fa-circle-o fa-fw"></i>&nbsp;取款业务</a></li>
                <li  ><a id="transfer" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;转账业务</a></li>
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
         <li class="has-sub  active"><a href="javascript:void(0);"><span>管理员业务</span><i
                 class="fa fa-caret-right fa-fw pull-right"></i></a>
             <ul class="sub-menu" style="display:block" >
                 <li class="active"><a id="usermana"><i
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
				<!-- Trigger the modal with a button -->
				<button id="addUserBtn" type="button" class="btn btn-primary btn-md">
                    <span class="glyphicon glyphicon-plus"></span>添加用户</button>

				<section class="content container-fluid">
				<div class="table-responsive">
					<table class="table">
						<caption>用户信息表</caption>
						<thead>
							<tr>
								<th>工号</th>
								<th>姓名</th>
								<th>角色</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="userList">

						</tbody>
					</table>
				</div>

				</section>
				<!-- Modal 添加用户-->
				<div class="modal fade" id="adduser" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">添加用户</h4>
							</div>
							<div class="modal-body">
								<div style="width: 500px;">
									<form class="form-horizontal" role="form" action=""
										method="post">
										<div class="form-group">
											<label for="userName" class="col-sm-2 control-label">名字</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="userName"
													placeholder="请输入名字">
											</div>
										</div>
										<div class="form-group">
											<label for="password" class="col-sm-2 control-label">密码</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" id="password"
													placeholder="请输入密码">
											</div>
										</div>
										<div class="form-group">
											<label for="roleSelect" class="col-sm-2 control-label">角色</label>
											<div class="col-sm-10">
												<select id="roleSelect" class="form-control" multiple="multiple" size="2">

												</select>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="modal-footer">
								<button id="userConfirm" type="button" class="btn btn-default"
									data-dismiss="modal">提交</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<a href="#top" id="goTop"><i class="fa fa-angle-up fa-3x"></i></a>
	<%@include file="../common/authModal.jsp"%>
</body>
<script type="text/javascript">

	function delUser(userId){
		//删除按钮
        $("#del_"+userId).click(function () {
            $.post("${pageContext.request.contextPath}/user/delete/"+userId,
                {},function (data) {
                    alert(data.statusInfo);
                    getUserList();
                });
        });
	}
	
	

    function getUserList() {
        $.get("${pageContext.request.contextPath}/user/list",function (result) {
            $("#userList").empty();

            for(var i=0;i<result.length;i++){
                var rName="";
                for(var j=0;j<result[i].roleList.length;j++){
                    rName+=result[i].roleList[j].description+" ";
                }

                $("#userList").append("<tr>\n    " +
                    "<td>"+result[i].userId+"</td>" +
                    "<td>"+result[i].userName+"</td>" +
                    "<td>"+rName+"</td>" +
                    "<td>"+
                    "<button id=\"del_"+result[i].userId+"\" type=\"button\" onclick=\"delUser(\'"+result[i].userId+"\')\" class=\"btn btn-primary btn-sm\">删除</button></td>" +
                    "</tr>");             

            }
        });
    }
    //加载时动态获取用户信息
	$(document).ready(function() {
	    getUserList();

		//添加角色按钮，刷新角色列表
        $("#addUserBtn").click(function () {
            $("#adduser").modal();
            //清空选择栏
            $("#roleSelect").empty();
            $.get("${pageContext.request.contextPath}/user/getRoleNames",function (result) {
                for(var i=0;i<result.length;i++){
                    $("#roleSelect").append("<option value='" +
                        result[i].roleId +
                        "'>" + result[i].description +
                        "</option>");
                }
            });
        });

        //提交按钮，获取各属性，发送请求，回调刷新列表
        $("#userConfirm").click(function () {
            var rids=$("#roleSelect").val();
            var roleIds="";
            for(var i=0;i<rids.length;i++){
                roleIds+=rids[i].concat("\,");
            }
            var userName=$("#userName").val();
            var password=$("#password").val();
            $.post("${pageContext.request.contextPath}/user/add",
                {
                    "userName":userName,
                    "password":password,
                    "roleIds":roleIds
                },function (result) {
                    alert(result.info);
                    getUserList();
                });
        });
    });
</script>
</html>
