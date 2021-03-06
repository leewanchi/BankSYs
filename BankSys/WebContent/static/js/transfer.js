function valipass() {
	$("#to").css("display", "none");
	$("#ti").css("display", "none");
	$("#ta").css("display", "none");
	$("#tb").css("display", "none");
	$("#tp").css("display", "table");
	$("#ts").css("display", "block");
	$("#tw").css("display", "block");
}
function checkAllInfo(){
	$.ajax({
    url:"../checkAllInfo",
    type:"post",
    data:{"inAccount":$("#inAccount").val(),"outAccount":$("#outAccount").val(),
    	"tradeMoney":$("#tradeMoney").val()},
    async:true,            
   success:function(data){
			if (data.out_flag) {
			   $(".outAccount-msg").text(data.out_msg).css("color","green");
			  f1=true;
			}else{
				$(".outAccount-msg").text(data.out_msg).css("color","red");
				f1=false;
			}
			
			if (data.in_flag) {
				   $(".inAccount-msg").text(data.in_msg).css("color","green");
				  f2=true;
				}else{
					$(".inAccount-msg").text(data.in_msg).css("color","red");
					f2=false;
				}
			
			if (data.tMoney_flag) {
				   $(".tradeMoney-msg").text(data.tMoney_msg).css("color","green");
				  f3=true;
				}else{
					$(".tradeMoney-msg").text(data.tMoney_msg).css("color","red");
					f3=false;
				}
			if(f1 && f2 && f3){
				window.setTimeout(function (){valipass();},1000);
			}
   }});
	
}
function checkPassWord(){
	$.ajax({
	    url:"../checkPassWord",
	    type:"post",
	    data:{"cardId":$("#outAccount").val(),"password":$("#password").val()},
	    async:true,            
	   success:function(result){
				if (result.status) {
					$(".passWord-msg").text(result.data).css("color","green");
					$("#transform").submit();
					return true;
				}else{
					$(".passWord-msg").text(result.statusInfo).css("color","red");
					
					return false;
				}
	   }});
}
function checkAll(){
	
		var inAccount = $("#inAccount").val();
		var outAccount = $("#outAccount").val();
		var tradeMoney = $("#tradeMoney").val();
		var flag1 = true;
		var flag2 = true;
		var flag3 = true;
		/*账户验证正则表达式*/
		var accountvali = /^([1-9]{1})(\d{15}|\d{18})$/;
		/*金额验证正则表达式*/
		var amountvali = /^(([1-9]\d*)|0)(\.\d{2})?$/;
		/*验证出账账户是否正确输入*/
		$(".outAccount-msg").css("display", "block");
		if(inAccount == null || inAccount == ""){
			$(".outAccount-msg").text("请输入账号").css("color", "red");
			flag1 = false;
		}else if(!accountvali.test(inAccount)){
			$(".outAccount-msg").text("出账账户格式不正确").css("color", "red");
			flag1 = false;
		}else {
			//$(".inAccount-msg").css("display", "none");
			$(".inAccount-msg").text("");
			flag1 = true;
		}
		
		/*验证入账账户是否正确输入*/
		$(".inAccount-msg").css("display", "block");
		if(outAccount == null || outAccount == ""){
			$(".inAccount-msg").text("请输入账号").css("color", "red");
			flag2 = false;
		}else if(!accountvali.test(outAccount)){
			$(".inAccount-msg").text("入账账户格式不正确").css("color", "red");
			flag2 = false;
		}else if(outAccount==inAccount){
			$(".inAccount-msg").text("与出账账户相同").css("color", "red");
			flag2 = false;
		}
		else {
			//$(".outAccount-msg").css("display", "none");
			$(".inAccount-msg").text("");
			flag2 = true;
		}
		
		/*验证交易金额输入是否正确输入*/
		$(".tradeMoney-msg").css("display", "block");
		if(tradeMoney == null || tradeMoney == ""){
			$(".tradeMoney-msg").text("请输入金额").css("color", "red");
			flag3 = false;
		}else if(!amountvali.test(tradeMoney)){
			$(".tradeMoney-msg").text("金额格式不正确").css("color", "red");
			flag3 = false;
		}else {
			$(".tradeMoney-msg").text("");
			flag3 = true;
		}
		
		if(flag1 && flag2 && flag3){
			checkAllInfo();
		}
}

/*点击提交后验证输入的密码格式*/
function checkPass(){
		var password = $("#password").val();
		/*验证密码非空*/
		$(".passWord-msg").css("display", "block");
		if(password == null || password == ""){
			$(".passWord-msg").text("请输入密码").css("color", "red");
			return false;
		}else {
			return checkPassWord();
		}
}














