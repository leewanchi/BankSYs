 function checktable(){
    	$("#tableinfo").css("display","block");
    }
 function hiddtable(){
	 $("#tableinfo").css("display","none");
 }
 
function searchCustom(searchAccount){
	var str=["冻结","正常"];
	$("#customtable").empty();//清空原来的TreeGrid
	$.ajax({
	    url:"../searchInfo",
	    type:"post",
	    data:{"cardId":searchAccount},
	    async:true,            
	   success:function(result){
		   
		  
	    	if(result.status==0){
	    		$("#customtable").append("<table><tr>" +
	 				   "<td><span style='font-family:楷体;font-size:18px;'>卡号</span></td>" +
	                   "<td style='text-indent:15px;'><span style='font-family:楷体;font-size:18px;'>"+result.cardId+"</span></td>" +
	                   "</tr>" +
	                   "<tr><td><span style='font-family:楷体;font-size:18px;'>姓名</span></td>" +
	                   "<td style='text-indent:15px;'><span style='font-family:楷体;font-size:18px;'>"+result.customName+"</span></td></tr>" +
	                   "<tr><td><span style='font-family:楷体;font-size:18px;'>性别</span></td>" +
	                   "<td style='text-indent:15px;'><span style='font-family:楷体;font-size:18px;'>"+result.sex+"</span></td></tr>" +
	                   "<tr><td><span style='font-family:楷体;font-size:18px;'>身份证号</span></td>" +
	                   "<td style='text-indent:15px;'><span style='font-family:楷体;font-size:18px;'>"+result.id+"<span></td></tr>" +
	                   "<tr><td><span style='font-family:楷体;font-size:18px;'>余额</span></td>" +
	                   "<td style='text-indent:15px;'><span style='font-family:楷体;font-size:18px;'>"+result.balance+"</span></td></tr>" +
	                   "<tr><td><span style='font-family:楷体;font-size:18px;'>状态</span></td>" +
	    				"<td style='text-indent:15px;'><span style='font-family:楷体;font-size:18px;'>"+str[0]+"</span></td>" +
  			"</tr></table>");
	    	}else if (result.status==1) {
	    		$("#customtable").append("<table><tr>" +
	    				   "<td><span style='font-family:楷体;font-size:18px;'>卡号</span></td>" +
		                   "<td style='text-indent:15px;'><span style='font-family:楷体;font-size:18px;'>"+result.cardId+"</span></td>" +
		                   "</tr>" +
		                   "<tr><td><span style='font-family:楷体;font-size:18px;'>姓名</span></td>" +
		                   "<td style='text-indent:15px;'><span style='font-family:楷体;font-size:18px;'>"+result.customName+"</span></td></tr>" +
		                   "<tr><td><span style='font-family:楷体;font-size:18px;'>性别</span></td>" +
		                   "<td style='text-indent:15px;'><span style='font-family:楷体;font-size:18px;'>"+result.sex+"</span></td></tr>" +
		                   "<tr><td><span style='font-family:楷体;font-size:18px;'>身份证号</span></td>" +
		                   "<td style='text-indent:15px;'><span style='font-family:楷体;font-size:18px;'>"+result.id+"<span></td></tr>" +
		                   "<tr><td><span style='font-family:楷体;font-size:18px;'>余额</span></td>" +
		                   "<td style='text-indent:15px;'><span style='font-family:楷体;font-size:18px;'>"+result.balance+"</span></td></tr>" +
		                   "<tr><td><span style='font-family:楷体;font-size:18px;'>状态</span></td>" +
		    				"<td style='text-indent:15px;'><span style='font-family:楷体;font-size:18px;'>"+str[1]+"</span></td>" +
	  			"</tr></table>");
	    	}else{
	    		$("#customtable").append(
	    				"<h4 style='text-align:center;'>该账号不存在</h4>"
	    		);
	    	}
		  
	   }});
}
$(document).ready(function(){
	$("#searchTrandeInfo").click(function(){
		var account = $("#account").val();
		var minmoney = $("#minmoney").val();
		var maxmoney = $("#maxmoney").val();
		/*账户验证正则表达式*/
		var flag1 = true;
		var flag2 = true;
		var flag3 = true;
		
		$(".account-msg").css("display", "block");
		$(".minmoney-msg").css("display", "block");
		$(".maxmoney-msg").css("display", "block");
		if(!(account == null || account == "")){
			if(isNaN(account)){
				$(".account-msg").text("账户格式有误").css("color","red");
				flag1 = false;
			}else {
				$(".account-msg").css("display", "none");
			    flag1 = true;	
			}
		}
		/*验证最小金额输入格式*/
		if(isNaN(minmoney)){
			$(".minmoney-msg").text("最小金额格式有误").css("color","red");
			flag2 = false;
		}else {
			$(".minmoney-msg").css("display", "none");
		    flag2 = true;	
		}
		/*验证最大金额格式*/
		if(isNaN(maxmoney)){
			$(".maxmoney-msg").text("最大金额格式有误").css("color","red");
			flag3 = false;
		}else {
			$(".maxmoney-msg").css("display", "none");
		    flag3 = true;	
		}
		if(flag1 && flag2 && flag3){
			  $("form").submit();
			return true;
		}else{
			return false;
		}
	});
	
	$("#searchAccountInfo").click(function(){
		var searchAccount = $("#searchAccount").val();
		/*账户验证正则表达式*/
		var accountvali = /^(\d{16}|\d{19})$/;
		var flag = true;
		hiddtable();
		$(".searchAccount-msg").css("display", "block");
		if(searchAccount ==null || searchAccount == ""){
			$(".searchAccount-msg").text("账户不能为空").css("color","red");
			flag = false;
		}else if(!accountvali.test(searchAccount)){
			$(".searchAccount-msg").text("账户格式错误").css("color","red");
			flag = false;
		}else{
			checktable();
			$(".searchAccount-msg").css("display", "none");
			flag = true;	
		}
		if(flag){
			searchCustom(searchAccount);
			}
	});
});