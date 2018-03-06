function valipass() {
	$("#wn").css("display", "none");
	$("#ws").css("display", "none");
	$("#wa").css("display", "none");
	$("#wp").css("display", "table");
	$("#wc").css("display", "block");
	$("#wf").css("display", "block");
}


function clearInfo1(){
	$(".cardId-msg").text("");
}
function clearInfo2(){
	$(".tradeMoney-msg").text("");
}
function clearInfo3(){
	$(".passWord-msg").text("");
}
function checkInfo(){
	$.ajax({
    url:"../checkInfo",
    type:"post",
    data:{"cardId":$("#cardId").val(),"tradeMoney":$("#tradeMoney").val()},
    dataType:"json",
    async:true,            
   success:function(data){
			if (data.i==2) {
			   $(".cardId-msg").text("账号不存在").css("color","red");
			  f1 =false;
			}if(data.i==1 ){
				$(".cardId-msg").text("账号存在").css("color","green");
				f1=true;
			}
			if(data.i==3 ){
				$(".cardId-msg").text("账号被冻结").css("color","red");
				f1=false;
			}
			if(data.j==4 ){
				$(".tradeMoney-msg").text("余额充足").css("color","green");
				f2=true;
			}
			if(data.j==5 ){
				$(".tradeMoney-msg").text("余额不足").css("color","red");
				f2=false;
			}
			/*
			alert(f1);
			alert(f2);*/
			if(f1 && f2){
				window.setTimeout(function (){valipass();},500);
			}
   }});
}

function checkPassWord(){
	$.ajax({
    url:"../checkPassWord",
    type:"post",
    data:{"cardId":$("#cardId").val(),"password":$("#password").val()},
    async:true,            
   success:function(result){
			if (result.status) {
				$(".passWord-msg").text(result.data).css("color","green");
				return true;
			}else{
				$(".passWord-msg").text(result.statusInfo).css("color","red");
				return false;
			}
   }});
}
function checkAll(){
	/*点击确认按钮后验证账户和金额的输入格式*/
	var carId=null;
	var tradeMoney=null;
		var flag1 = true;
		var flag2 = true;
		
		carId = $("#cardId").val();
		tradeMoney = $("#tradeMoney").val();
		var accountvali = /^([1-9]{1})(\d{15}|\d{18})$/;
		var amountvali = /^(([1-9]\d*)|0)(\.\d{2})?$/;
		/* 判断账号是否正确输入 */
		$(".cardId-msg").css("display", "block");
		if (carId == null || carId == "") {
			$(".cardId-msg").text("请输入账号").css("color", "red");
			flag1 = false;
		} else if (!accountvali.test(carId)) {
			$(".cardId-msg").text("账号格式不正确").css("color", "red");
			flag1 = false;
		} else {
			flag1 = true;
		}
		/* 判断金额是否正确输入 */
		$(".tradeMoney-msg").css("display", "block");
		if (tradeMoney == null || tradeMoney == "") {
			$(".tradeMoney-msg").text("请输入金额").css("color", "red");
			flag2 = false;
		} else if (!amountvali.test(tradeMoney)) {
			$(".tradeMoney-msg").text("金额格式不正确").css("color", "red");
			flag2 = false;
		} else {
			flag2 = true;
		}
		/* 当以上两个量都正确输入时，执行valipass() */
		
		/*alert(flag1);
		alert(flag2);*/
		if (flag1 && flag2){
			checkInfo();
		}
}
	/*点击提交后验证输入的密码格式*/
function checkPass(){
		var passWord = $("#password").val();
		/*验证密码非空*/
		$(".passWord-msg").css("display", "block");
		if(passWord == null || passWord == ""){
			$(".passWord-msg").text("请输入密码").css("color", "red");
			return false;
		}else {
			return checkPassWord();
		}
}
