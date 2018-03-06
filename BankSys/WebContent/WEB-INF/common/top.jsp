<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
 <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid" >
            <div class="navbar-header">
                <button type="button" class="navbar-toggle show pull-left" data-target="sidebar">
                    <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>
                <a class="navbar-brand"><b class="fa-label">&nbsp;银行柜员系统</b></a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                    <%-- <shiro:hasRole name="manager">
	                    <a href="${pageContext.request.contextPath}/bigMoney/list" style="position: absolute;right: 115px; top: 2px;" class="dropdown-toggle" >
						  <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
						  <span id="requiresNum" style="position: absolute;top: 1px;right: 8px;" class="lable label-success"></span>
						</a>							
					     <script type="text/javascript">	
							    function getRequirs(){
							    	$.get("${pageContext.request.contextPath}/bigMoney/getRequires",function (result) {
							        	//result.statusInfo 条数
							           $("#requiresNum").empty().html(result.statusInfo);
							        });
							    }  
							    $(document).ready(function() {
							    	setInterval("getRequirs();",3000);
							    });
					    </script>
					 </shiro:hasRole>
					 <shiro:hasRole name="teller">
	                    <a href="${pageContext.request.contextPath}/bigMoney/applyList" style="position: absolute;right: 115px; top: 2px;" class="dropdown-toggle" >
						  <span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
						  <span id="confirmNum" style="position: absolute;top: 1px;right: 8px;" class="lable label-success"></span>
						</a>
							<script type="text/javascript">	
							    function getApplies(){
							    	$.post("${pageContext.request.contextPath}/bigMoney/getApplys/${userinfo.userId}",{},function (result) {							   
							           $("#confirmNum").empty().html(result.statusInfo);
							        });
							    }  
							    $(document).ready(function() {
							    	setInterval("getApplies();",3000);
						    });
	    					</script>					
					 </shiro:hasRole> --%>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-expanded="false"><i class="fa fa-user fa-fw"></i>&nbsp;${userinfo.userName}&nbsp;<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="${pageContext.request.contextPath}/user/logout"><i class="fa fa-sign-out fa-fw"></i><b class="fa-logout">登出</b></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

   