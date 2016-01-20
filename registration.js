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
	};

	Model.prototype.modelLoad = function(event) {

	};

	Model.prototype.backBtnClick = function(event) {
		this.comp('loginBindReceiver').windowEnsure('0');
	};

	Model.prototype.loginBindReceiverReceive = function(event) {
		this._loginBind_uid3rd = event.data.uid3rdPara;
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
				"uid3rd" : this._loginBind_uid3rd
			};
			var self = this;
			var successFunc = function(resultData) {
				/*
				 * var showInfo="用户信息保存成功，请关注系统审核结果！"; justep.Util.hint(showInfo);
				 * self.comp('loginBindReceiver').windowCancel();
				 */
	
				var retResult = resultData["result"];
				var showInfo = null;
				if ("success" == retResult) {
					showInfo = "信息保存成功！";
					justep.Util.hint(showInfo);
					self.comp('loginBindReceiver').windowEnsure('1');
				}else if ("checkNumfail" == retResult) {
					showInfo = "验证码错误！";
					justep.Util.hint(showInfo);
				} 
				else if ("fail" == retResult) {
					showInfo = "信息保存失败！";
					justep.Util.hint(showInfo);
					self.comp('loginBindReceiver').windowEnsure('0');
				}
	
			};
	
			$.ajax({
				type : "POST",
				url : require.toUrl('/weixin/ms/X5/saveRegisteInfo'),
				dataType : 'json',
				data : params,
				async : false,
				cache : false,
				success : successFunc,
				error : function() {
					throw justep.Error.create("加载数据失败");
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
				var params = {
					"uid3rd" : _self._loginBind_uid3rd,
					"tel" : telTemp
				};
				var successFunc = function(resultData) {
					justep.Util.hint('发送验证码成功！');
				};
				$.ajax({
					type : "GET",
					url : require.toUrl('/weixin/ms/X5/sendCheckCode'),
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
			if (totalCount - count == 0) {
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
							"cardNoLastFour" :'1111',
							"checkNum":''
						} ]
					});

	};


	return Model;
});