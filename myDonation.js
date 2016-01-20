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
		this._mydonation_uid3rd = "";
	};

	// 返回上一页
	Model.prototype.backBtnClick = function(event) {
		this.comp('myDonationReceiver').windowCancel();
	};


	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};


	Model.prototype.myDonationReceiverReceive = function(event){
		this._mydonation_uid3rd  = event.data.uid3rdPara;

		var donationDtlData = this.comp("donationDtlData");
		donationDtlData.refreshData();
		
//		alert("donationDtlData.getCount()"+donationDtlData.getCount());
		if(donationDtlData.getCount() === 0) {			
			$(this.getElementByXid("donationList")).attr("style","display:none"); 
			$(this.getElementByXid("div6")).attr("style","display:none");
			$(this.getElementByXid("nodataDiv")).attr("style","display:true");			 
		}
		

	};

	Model.prototype.donationDtlDataCustomRefresh = function(event){
		var donationDtlData = event.source;
		var params = {
			"uid3rd" : this._mydonation_uid3rd
		};
		var successFunc = function(resultData) {
			var retResult = resultData["result"];
			if ("nodata" == retResult) {
				justep.Util.hint("您还没有捐赠记录哦！");			
			}else if("error"==retResult){
				justep.Error.create("加载数据失败！");	
			}else{	
				var append = event.options && event.options.append;
				donationDtlData.loadData(resultData, append);
			}
		};
		$.ajax({
			type : "GET",
			url : require.toUrl('/weixin/ms/X5/getMyDonationDtlData'),
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