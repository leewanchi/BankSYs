function back(){
		window.history.back();
	}

	function checkAccount(){
		//alert("111");
        var cardId=$("#cardId").val();
        //清空上一次的顾客姓名
        $("#customName").val('');
        $(".msg").val('');
        var accountReg = /^([1-9]{1})(\d{15}|\d{18})$/;
    	if(accountReg.test(cardId)){
        	$.ajax({
                url:"../checkAccount",
                type:"post",
                data:{"cardId":cardId},
                dataType:"json",
                async:true,            
               success:function(data){  
     				if (data.i==2) {
     				   $(".cardId-msg").text("账号不存在").css("color","red");
     				   flag=false;
     				}if(data.i==1 ){
     					$(".cardId-msg").text("账号存在").css("color","green");
     					$("#customName").val(data.customName);
     					flag=true;
     				}
     				if(data.i==3 ){
     					$(".cardId-msg").text("账号被冻结").css("color","red");
     					$("#customName").val(data.customName);
     					flag=false;
     				}
               }});
        	return flag;
        }
    	else{
    		$(".cardId-msg").text("账号格式错误").css("color","red");
    		return false;
    	}
    }
	function checkAmounts(){
        var tradeMoney=$("#tradeMoney").val();
        var amountsReg=/^(([1-9]\d*)|0)(\.\d{2})?$/;
    	if(amountsReg.test(tradeMoney)){
    		$(".tradeMoney-msg").text("交易金额格式正确").css("color","green");
        	return true;
        }else{
        	$(".tradeMoney-msg").text("交易金额格式错误").css("color","red");
        	return false;
        }
    }
	function check(){
		var f1 =checkAccount();
		var f2 =checkAmounts();
		if(f1==true && f2==true){
			return true;
		}else{
			return false;
		}
	}
	
