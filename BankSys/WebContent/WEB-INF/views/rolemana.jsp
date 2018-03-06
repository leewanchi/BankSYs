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
            <ul class="sub-menu">
                <li><a id="deposit" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;存款业务</a></li>
                <li><a id="withdrawal"><i class="fa fa-circle-o fa-fw"></i>&nbsp;取款业务</a></li>
                <li><a id="transfer" ><i class="fa fa-circle-o fa-fw"></i>&nbsp;转账业务</a></li>
            </ul>
        </li>
        <li class="has-sub">
            <a href="javascript:void(0);"><span>查询业务</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
            <ul class="sub-menu">
                <li><a id="checkaccount"><i class="fa fa-circle-o fa-fw"></i>&nbsp;账户信息</a></li>
                <li><a id="queryMore"><i class="fa fa-circle-o fa-fw"></i>&nbsp;交易明细</a></li>
            	<!-- <li><a id="bigApplies"><i class="fa fa-circle-o fa-fw"></i>&nbsp;大额申请</a></li> -->
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
         <li class="has-sub active"><a href="javascript:void(0);"><span>管理员业务</span><i
                 class="fa fa-caret-right fa-fw pull-right"></i></a>
             <ul class="sub-menu" style="display:block">
                 <li><a id="usermana"><i
                         class="fa fa-circle-o fa-fw"></i>&nbsp;用户管理</a></li>
                 <li class="active"><a id="rolemana" href="javascript:void(0);"><i
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
				<button type="button" class="btn btn-primary btn-md"
					data-toggle="modal" data-target="#addright">
					<span class="glyphicon glyphicon-plus"></span>添加角色
				</button>

				<!--  删除角色 -->
				<section class="content container-fluid">
				<div class="table-responsive">
					<table class="table">
						<caption>角色信息表</caption>
						<thead>
							<tr>
								<th>#</th>
								<th>角色名称</th>
								<th>角色描述</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${roleList}" var="role">
								<tr>
									<td>${role.roleId}</td>
									<td>${role.roleName}</td>
									<td>${role.description}</td>
									<td>
                                        <button id="rp_${role.roleId}" type="button" class="btn btn-primary btn-sm">
                                            <span class="glyphicon glyphicon-locked"></span>权限分配
                                        </button>


                                        <button id="rd_${role.roleId}" type="button" class="btn btn-primary btn-sm">
                                            <span class="glyphicon glyphicon-locked"></span>删除
                                        </button>
                                        <script type="text/javascript">
                                      		//确定按钮
                                        	$(function () {
                                        		/* var rId = ${role.roleId}; */
                                        		$("#update_perm").attr("id","btn_${role.roleId}");
                                                //$("#update_perm").addClass(rId);
                                                //console.log(rId);
                                            });

                                            //删除按钮
                                            $("#rd_${role.roleId}").click(function () {
                                                $.post("${pageContext.request.contextPath}/role/delete/${role.roleId}",
                                                    {},function (result) {
                                                        alert(result.data.statusInfo);
                                                    });
                                            });

                                            //动态加载复选框--对应权限属性（kay）
                                             $("#rp_${role.roleId}").click(function() {
                                            	 var rId = ${role.roleId};
                                            	 if("btn_"+rId != $(".update_perm").attr("id")){
                                            		 //alert(123);
                                            		 $(".update_perm").attr("id","btn_"+rId);
                                            		 console.log(rId);
                                            	 }
                                                 
                                                 
                                                 $("input[type='checkbox']").removeAttr("checked");
                                                 $("#permissions").modal();
                                                 $("#rName").html("${role.description}");
                                                 <c:forEach items="${role.permissionList}" var="permission">
                                                    $("#${permission.id}").attr("checked","true");
                                                 </c:forEach>
                                                 


                                                 //权限变更后发送ajax到后台更新
                                                 $("#btn_"+rId ).click(function() {
                                                	 //alert(rId);
                                                     //权限id拼接字符串
                                                     if("btn_"+rId == $(".update_perm").attr("id")){
	                                                     var permissionIds="";
	                                                     $("input[type='checkbox']:checkbox:checked").each(function() {
	                                                         permissionIds+=$(this).val().concat("\,");
	                                                     });
	
	                                                     $.ajax({
	                                                         url:"${pageContext.request.contextPath}/role/setPermissions/${role.roleId}",
	                                                         type:"post",
	                                                         dataType:"json",
	                                                         contentType:"application/json",
	                                                         data:permissionIds,
	                                                         success:function(result) {
	                                                        	 alert(permissionIds);
	                                                             //$("#btn_${role.roleId}").attr("ID","update_perm");
	                                                             alert(result.result.data.info);
	                                                         }
	                                                     })
                                                     }
                                                     else{
                                                    	 return;
                                                     }
                                                 })


                                             })
                                        </script>

                                    </td>
								</tr>

							</c:forEach>

						</tbody>
					</table>
				</div>
				</section>

				<!-- Modal 添加角色-->
				<div class="modal fade" id="addright" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">添加角色</h4>
							</div>
							<div class="modal-body">
								<div style="width: 500px;">
									<form class="form-horizontal" role="form" action=""
										method="post">
										<div class="form-group">
											<label for="roleName" class="col-sm-2 control-label">角色名称</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="roleName">
											</div>
										</div>
										<div class="form-group">
											<label for="description" class="col-sm-2 control-label">角色描述</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="description">
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="modal-footer">
								<button id="createRoleBtn" type="button" class="btn btn-default"
									data-dismiss="modal">提交</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>
				</div>
                <!-- Modal 分配权限-->
                <div class="modal fade" id="permissions" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">权限分配</h4>
                            </div>
                            <div class="modal-body">
                                <h4><span id="rName" class="label label-success"></span></h4>

                                <table >
                                    <tr>
                                        <td><label><input id="1" type="checkbox" value="1">存款</label></td>
                                        <td style="text-indent: 30px;"><label><input id="2" type="checkbox" value="2">取款</label></td>
                                        <td style="text-indent: 30px;"><label><input id="3" type="checkbox" value="3">转账</label></td>
                                    </tr>
                                    <tr>
                                        <td><label><input id="4" type="checkbox" value="4">查询账户信息</label></td>
                                        <td style="text-indent: 30px;"><label><input id="5" type="checkbox" value="5">查询交易明细</label></td>
                                        <td style="text-indent: 30px;"><label><input id="6" type="checkbox" value="6">冻结账号</label></td>
                                    </tr>
                                    <tr>
                                        <td><label><input id="7" type="checkbox" value="7">柜员管理</label></td>
                                        <td style="text-indent: 30px;"><label><input id="8" type="checkbox" value="8">解冻</label></td>
                                        <td style="text-indent: 30px;"><label><input id="9" type="checkbox" value="9">创建用户</label></td>
                                    </tr>
                                    <tr>
                                        <td><label><input id="10" type="checkbox" value="10">删除用户</label></td>
                                        <td style="text-indent: 30px;"><label><input id="11" type="checkbox" value="11">更新用户</label></td>
                                    	<td style="text-indent: 30px;"><label><input id="12" type="checkbox" value="12">用户管理</label></td>
                                    </tr>
                                    <tr>
                                        <td><label><input id="13" type="checkbox" value="13">角色管理</label></td>
                                        <td style="text-indent: 30px;"><label><input id="14" type="checkbox" value="14">系统日志</label></td>
                                    	
                                    </tr>
                                </table>
                                <div class="modal-footer">
                                    <button id="update_perm" type="button" class="update_perm btn btn-default "
                                            data-dismiss="modal">确定</button>
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
</div>
</body>
<script type="text/javascript">
    $("#createRoleBtn").click(function () {
        $.post("${pageContext.request.contextPath}/role/add",
            {
                "roleName":$("#roleName").val(),
                "description":$("#description").val()
            },function (result) {
                alert(result.data.statusInfo);
            });
    });


</script>
</html>
