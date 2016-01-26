define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Baas = require("$UI/demo/baas/baas");
	var CommonUtils = require("$UI/system/components/justep/common/utils");
	var jpushInstance = require("./jpush");
	var comUtil = require("$UI/system/components/justep/common/common");

	require("$UI/system/lib/cordova/cordova");
	require("cordova!org.apache.cordova.device");
	require("cordova!com.justep.cordova.plugin.weixin.v3");
	require("cordova!com.justep.cordova.plugin.alipay");
	require("cordova!org.apache.cordova.geolocation");
	require("cordova!com.justep.cordova.plugin.baidulocation");
	require("cordova!cn.jpush.phonegap.JPushPlugin");
	require("res!./img");

	var Model = function() {
		this.callParent();
		this._loginBind_uid3rd = "";
		this._loginBind_displayName="";
		this._checkNumFlag="";
	};

	Model.prototype.modelLoad = function(event) {

	};

	Model.prototype.backBtnClick = function(event) {
		this.comp('loginBindReceiver').windowEnsure('0');
	};

	Model.prototype.loginBindReceiverReceive = function(event) {
		this._loginBind_uid3rd = event.data.uid3rdPara;
		this._loginBind_displayName = event.data.displayNamePara;
		$(this.getElementByXid("checkButton")).attr("disabled", true);
		$(this.getElementByXid("saveUserBtn")).attr("disabled", true);			
		
	};

	Model.prototype.telInputChange = function(event) {
		$(this.getElementByXid("checkButton")).attr("disabled", false);
	};

	Model.prototype.saveUserBtnClick = function(event) {
	   var  telInputTemp=this.comp("telInput").value;
	   var  cardNoTemp=this.comp("input8").value;
	   var  checkNumTemp=this.comp("input5").value;
	   if(telInputTemp==null||telInputTemp==''){
		   justep.Util.hint('请输入手机号！');	   
	   }else if(cardNoTemp==null||cardNoTemp==''){
		   justep.Util.hint('请输入卡后四位！');	   
	   }else if(checkNumTemp==null||checkNumTemp==''){
		   justep.Util.hint('请输入验证码！');	   
	   }else if(telInputTemp.length!=11){
		   justep.Util.hint('请输入11位手机号！');	   
	   }else if(cardNoTemp.length!=4){
		   justep.Util.hint('请输入4位卡后四位！');	   
	   }else if(checkNumTemp.length!=4){
		   justep.Util.hint('请输入4位验证码！');	   
	   }else{  
			var registerData = this.comp("registerData");
			var row = registerData.toJson(true).rows[0];
			var tel = row.tel.value;
			var cardNoLastFour = row.cardNoLastFour.value;
			var checkNum = row.checkNum.value;
	
			var params = {
				"tel" : tel,
				"cardNoLastFour" : cardNoLastFour,
				"checkNum" : checkNum,
				"uid3rd" : this._loginBind_uid3rd,
				"displayName":this._loginBind_displayName
			};
			var self = this;
			var successFunc = function(resultData) {
				var retResult = resultData["result"];
				if ("unSupport" == retResult) {
					justep.Util.hint("请关注'WEI民公益'公众号！");
					//此处可跳转到WEI民公益公众号二维码页面
				}else if ("checkNumFail" == retResult) {
					justep.Util.hint("验证码错误！");
					self._checkNumFlag='false';
					registerData.newData({
						index : 0,
						defaultValues : [ {
							"fID" : 1,
							"tel" : tel,
							"cardNoLastFour" :cardNoLastFour,
							"checkNum":''
						} ]
					});
				}else if ("preBindSuccess" == retResult) {
					self.comp('loginBindReceiver').windowEnsure('2');
				}else if ("fail" == retResult) {
					justep.Util.hint("注册失败，相关信息已被其他微信号绑定！");
				}else if ("error" == retResult) {
					justep.Util.hint("保存用户注册信息异常！");
				}	
			};	
			$.ajax({
				type : "POST",
				url : require.toUrl('/weixin/ms/X5/saveRegistrationInfo'),
				dataType : 'json',
				data : params,
				async : false,
				cache : false,
				success : successFunc,
				error : function() {
					throw justep.Error.create("保存用户注册信息异常！");
				}
			});	   
	   }
	};

	Model.prototype.checkButtonClick = function(event) {
		var _self = this;
		var count = 0;
		var totalCount = 60;
		totalCount = parseInt(totalCount);
		count = parseInt(count);
		$(this.getElementByXid("checkButton")).attr("disabled", true);
		var timer = setInterval(function() {
			count++;
			var currentCount=totalCount - count;
			_self.comp("checkButton").domNode.innerText = currentCount+'秒';
			if (count == 1) {
				
				var telTemp = _self.comp("telInput").value;
				if(telTemp.length!=11){
					justep.Util.hint('请输入11位手机号！');
					_self._checkNumFlag='false';
				}else{
					_self._checkNumFlag='true';
					var params = {
						"uid3rd" : _self._loginBind_uid3rd,
						"tel" : telTemp
					};
					var successFunc = function(resultData) {
						var retResult = resultData["result"];				
						if ("success" == retResult) {
							justep.Util.hint("发送验证码成功！");					
						}else if ("error" == retResult) {
							justep.Error.create("发送验证码失败！");
						} 
					};
					$.ajax({
						type : "GET",
						url : require.toUrl('/weixin/ms/X5/sendCheckNum'),
						dataType : 'json',
						data : params,
						async : false,
						cache : false,
						success : successFunc,
						error : function() {
							throw justep.Error.create("发送验证码失败！");
						}
					});			
				
				}				
			}
			if (totalCount - count == 0||_self._checkNumFlag=='false') {
				window.clearInterval(timer);
				_self.comp("checkButton").domNode.innerText = '发送验证码'
				/* _self.comp("lastTime").disabled=false; */
				console.log($(_self.getElementByXid("checkButton")));
				$(_self.getElementByXid("checkButton")).attr("disabled", false);
			}

		}, 1000);

	};


	Model.prototype.registerDataCustomRefresh = function(event){
		var registerData = event.source;
		registerData.newData({
						index : 0,
						defaultValues : [ {
							"fID" : 1,
							"tel" : '',
							"cardNoLastFour" :'',
							"checkNum":''
						} ]
					});

	};



	Model.prototype.input5Change = function(event){
		$(this.getElementByXid("saveUserBtn")).attr("disabled", false);	
	};


	return Model;
});