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
	};

	Model.prototype.button1Click = function(event){
		console.log(event)
var  row=this.comp('input2');
if(row.value.length!=3){
alert("fail")
}else{
alert('success'+row.value.length)}

//alert(row.value.length)
	};

	Model.prototype.input1Change = function(event){
		$(this.getElementByXid("button1")).attr("disabled", false);

	};

	Model.prototype.modelLoad = function(event){
//		$(this.getElementByXid("button1")).attr("disabled", true);

	};

	return Model;
});