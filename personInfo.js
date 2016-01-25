define(function(require){
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
	
	var Model = function(){
		this.callParent();
		
		this._deviceType = "pc"; // pc || wx || app

		this.person_userID = "user";
		this.person_userDefaultName = "新用户";
		this.person_userPhotoURL = "";
		this._cardNo = "";
	};

	Model.prototype.modelLoad = function(event){

	};

	Model.prototype.personInfoReceiverReceive = function(event){			
		this.person_userPhotoURL= event.data.userPhotoURLPara;
		this.person_userID= event.data.uid3rdPara;
		this.person_userDefaultName= event.data.userDefaultNamePara;
		
		var personBpCustsData = this.comp("personBpCustsData");
		if(personBpCustsData.getCount()==0){			
			personBpCustsData.refreshData();			
			var cardNoInput =this.comp('cardNoInput');
			cardNoInput.val("**** **** ****"+cardNoInput.val());
		}
		if (this.person_userPhotoURL) {
			$(this.getElementByXid("photoImage")).attr("src", this.person_userPhotoURL);
		} else {
			$(this.getElementByXid("photoDiv")).hide();
		}
		
		var nickNameInput =this.comp('nickNameInput');	
		nickNameInput.val(this.person_userDefaultName);		
	};
	

	
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
	
	

	Model.prototype.backBtnClick = function(event){
		this.comp('personInfoReceiver').windowCancel();		
	};
	
	

	Model.prototype.personBpCustsDataCustomRefresh = function(event){
		var self = this;
		var personBpCustsData = event.source;
		var params = {
			"uid3rd" : this.person_userID
		};
		var successFunc = function(resultData) {
			var retResult = resultData["result"];
			if ("unSupport" == retResult || "nodata" == retResult || "failBind" == retResult) {
//				self._state = '0';
			} else if ("error" == retResult) {
//				self._state = '0';
				throw justep.Util.hint("加载用户数据失败");
			} else if ("preBind" == retResult) {
//				self._state = '2';
			} else {
				var append = event.options && event.options.append;
				personBpCustsData.loadData(resultData, append);
//				self._state = '1';
			}
		};
		$.ajax({
			type : "GET",
			url : require.toUrl('/weixin/ms/X5/getBindCust'),
			dataType : 'json',
			data : params,
			async : false,
			cache : false,
			success : successFunc,
			error : function() {
				throw justep.Error.create("加载数据失败");
			}
		});

	};	
	

	return Model;
});