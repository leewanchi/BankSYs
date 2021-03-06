<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
    $(function () {
        /**
         * 将超链接转换成 ajax的请求发送，用于权限的检查
         * @param url
         */
        function ajaxHref(url){
            $.ajax({
                type : 'GET',
                url : "${pageContext.request.contextPath}"+url,
                async : false,
                success:function(){
                    window.location.href="${pageContext.request.contextPath}"+url;
                    
                },
                fial:function () {
                    alert("fail");
                }
            });
        }
        /**
         * 修改ajax对401状态的处理
         */
        $.ajaxSetup({
            cache:false,
            error : function(XMLHttpRequest, textStatus,errorThrown) {
                switch (XMLHttpRequest.status){
                    case(401):
                        $("#authModal").modal();
                        break;
                    case(200):
                        break;
                    default:
                        alert("网络已断开");
                }
            }
        });

        $("#transfer").click(function() {
            ajaxHref(bank.URL.transfer());
        });

        $("#deposit").click(function() {
            ajaxHref(bank.URL.deposit());
        });

        $("#withdrawal").click(function() {
            ajaxHref(bank.URL.withdrawal());
        });


        $('#managerAuth').click(function() {
            ajaxHref(bank.URL.managerAuth());

        });

        $('#managerIndex').click(function() {
            ajaxHref(bank.URL.managerIndex());
        });

        $('#Freeze').click(function(){
        	ajaxHref(bank.URL.freezeUser());
        });
        
        $('#unFreeze').click(function(){
        	ajaxHref(bank.URL.unFreezeUser());
        });
        
        $('#systemlog').click(function() {
            ajaxHref(bank.URL.searchSysLog());
        });


        $("#usermana").click(function() {
            ajaxHref(bank.URL.userList());
        });

        $("#rolemana").click(function() {        	
            ajaxHref(bank.URL.roleList());
        });

        
        $("#checkaccount").click(function() {
        	
            ajaxHref(bank.URL.checkaccount());
        });

        $("#queryMore").click(function() {
            ajaxHref(bank.URL.queryMore());
        });
        
        $("#managerBigMoney").click(function() {
        	ajaxHref(bank.URL.managerBigMoney());
        });
        
        $("#bigApplies").click(function(){
        	ajaxHref(bank.URL.bigApplyList());
        });      
        
    });
</script>
