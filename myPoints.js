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
		this._myPoints_uid3rd = "";
	};

	//返回上一页
	Model.prototype.backBtnClick = function(event) {
		this.comp('myPointsReceiver').windowCancel();
	};

	//内容隐藏显示
	$(".hiddenBtn").each(function(){
		var height=0;
		$(this).on("click",function(){
			var obj=$(this).parent().find(".features");	
			if(obj.height()<=105){
				height=obj.outerHeight(true);
				obj.css("height","auto");
				$(this).find("i").attr("class","icon-chevron-up");
			} else {
				obj.css("height",height);
				$(this).find("i").attr("class","icon-chevron-down");
			}
		});
	});
	
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
	
	
	Model.prototype.myPointsReceiverReceive = function(event){
		var uid3rd= event.data.uid3rdPara
		this._myPoints_uid3rd =uid3rd; 	
		
		var pointsData = this.comp("pointsData");
		pointsData.refreshData();

		var pointsDtlData = this.comp("pointsDtlData");
		pointsDtlData.refreshData();
		
		if(pointsDtlData.getCount() === 0) {
			 $(this.getElementByXid("pointsList")).attr("style","display:none"); 
			 $(this.getElementByXid("div6")).attr("style","display:none");
			 $(this.getElementByXid("nodataDiv")).attr("style","display:true") 
		}
	};
	
	
	Model.prototype.pointsDtlDataCustomRefresh = function(event){
		var pointsDtlData = event.source;
		var params = {
			"uid3rd" : this._myPoints_uid3rd
		};
		var successFunc = function(resultData) {
			var retResult = resultData["result"];
			if ("nodata" == retResult) {
				justep.Util.hint("您还没有积分哦！");			
			}else if("error"==retResult){
				justep.Error.create("加载数据失败！");	
			}else{			
				var append = event.options && event.options.append;
				pointsDtlData.loadData(resultData, append);
			}
		};
		$.ajax({
            type: "GET",
            url: require.toUrl('/weixin/ms/X5/getMyPointsDtlData'),
            dataType: 'json',
            data:params,
            async: false,
            cache: false,
            success: successFunc,
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });

	};
	Model.prototype.pointsDataCustomRefresh = function(event){
		var pointsData = event.source;
		var params = {
			"uid3rd" : this._myPoints_uid3rd
		};
		var successFunc = function(resultData) {
			var retResult = resultData["result"];
			if ("nodata" == retResult) {
//				justep.Util.hint("您还没有积分哦！");
			}else if("error"==retResult){
				justep.Error.create("加载数据失败！");	
			}else{			
				var append = event.options && event.options.append;
				pointsData.loadData(resultData, append);
			}
		};
		$.ajax({
			type : "GET",
			url : require.toUrl('/weixin/ms/X5/getMyPointsData'),
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