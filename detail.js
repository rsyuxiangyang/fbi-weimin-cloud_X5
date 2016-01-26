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
		this._uid3rd = "";
		this._goodsId ="";
		this._state = "";
		this._deviceType = ""; 
	};

	//返回上一页
	Model.prototype.backBtnClick = function(event) {
		this.comp('goodsDetailReceiver').windowCancel();
	};

	
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
	
	Model.prototype.goodsDetailReceiverReceive = function(event){			
		this._uid3rd =event.data.uid3rd; 	
		this._goodsId =event.data.goodsId; 
		this._state=event.data.state;
		this._deviceType=event.data.deviceType;	
		
		var gmGoodsDtlInfoData = this.comp("gmGoodsDtlInfoData");
		gmGoodsDtlInfoData.refreshData();		
		/*var qtyModelData = this.comp("qtyModelData");
		qtyModelData.refreshData();*/
		this.comp('qtyInput').val(1);	
		if(this._deviceType!='wx'){
			justep.Util.hint("请关注微信公众号'WEI民公益'进行操作！");
			$(this.getElementByXid("shoppingCartBtn")).attr("disabled", true);	
			$(this.getElementByXid("qtyInput")).attr("disabled", true);	
			$(this.getElementByXid("reduceCountBtn")).attr("disabled", true);	
			$(this.getElementByXid("addCountBtn")).attr("disabled", true);	
		}else{
//			alert("detail:"+this._state);
			if(this._state=='0'){	
				justep.Util.hint('您当前还不是会员，无法操作，请注册成为会员！');					
				$(this.getElementByXid("shoppingCartBtn")).attr("disabled", true);	
				$(this.getElementByXid("qtyInput")).attr("disabled", true);	
				$(this.getElementByXid("reduceCountBtn")).attr("disabled", true);	
				$(this.getElementByXid("addCountBtn")).attr("disabled", true);	
			}else if(this._state=='2'){	
				justep.Util.hint("无法操作,系统正在审核您的注册信息，结果会以微信消息形式通知您！");	
				$(this.getElementByXid("shoppingCartBtn")).attr("disabled", true);	
				$(this.getElementByXid("qtyInput")).attr("disabled", true);	
				$(this.getElementByXid("reduceCountBtn")).attr("disabled", true);	
				$(this.getElementByXid("addCountBtn")).attr("disabled", true);				
			}else if(this._state=='1'){
				$(this.getElementByXid("shoppingCartBtn")).attr("disabled", false);	
				$(this.getElementByXid("qtyInput")).attr("disabled", false);	
				$(this.getElementByXid("reduceCountBtn")).attr("disabled", false);	
				$(this.getElementByXid("addCountBtn")).attr("disabled", false);				
			}
		}		
	};
	
	Model.prototype.gmGoodsDtlInfoDataCustomRefresh = function(event){
		var gmGoodsDtlInfoData = event.source;
		var params = {
			"uid3rd" : this._uid3rd,
			"goodsId":this._goodsId
		};
		var successFunc = function(resultData) {
			var retResult = resultData["result"];
			if ("nodata" == retResult) {
				justep.Util.hint("加载数据失败！");
			}else if("error"==retResult){
				justep.Util.hint("加载数据失败！");	
			}else{
				var append = event.options && event.options.append;
				gmGoodsDtlInfoData.loadData(resultData, append);
			}
		};
		$.ajax({
            type: "GET",
            url: require.toUrl('/weixin/ms/X5/getGoodsDtlInfoData'),
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
	
	// 转换动态图片URL
	Model.prototype.transURL = function(url) {
		return require.toUrl(url);
	};	
	
	
	Model.prototype.shoppingCartBtnClick = function(event){
		var gmGoodsDtlInfoData=this.comp("gmGoodsDtlInfoData");		
		var qtyTemp=this.comp('qtyInput').value;
		
		if(qtyTemp==null||qtyTemp==''){
		   justep.Util.hint('请输入捐赠数量！');	   
	    }else{		    	
			var params = {
				"uid3rd" : this._uid3rd,
				"goodsId":this._goodsId,
				"qty":qtyTemp
			};
			var successFunc = function(resultData) {
				var retResult=resultData["result"];
				if("success"==retResult){					
					justep.Util.hint("捐赠成功！");
					gmGoodsDtlInfoData.refreshData();					
				}else if("unenough"==retResult){	
					justep.Util.hint("积分不足");
				}else{
					justep.Util.hint("服务异常，捐赠失败！");
				}
			};
			$.ajax({
	            type: "GET",
	            url: require.toUrl('/weixin/ms/X5/saveDonationInfo'),
	            dataType: 'json',
	            data:params,
	            async: false,
	            cache: false,
	            success: successFunc,
	            error: function(){
	              throw justep.Error.create("服务异常，捐赠失败！");
	            }
	        });		    
	    }	
	};
	
	
	
	Model.prototype.qtyModelDataCustomRefresh = function(event){	
		var qtyModelData = event.source;
		qtyModelData.newData({
						index : 0,
						defaultValues : [ {
							"fID" : 1,
							"qtyDataTemp" : '1'
						} ]
					});

	};
	
	
	
	Model.prototype.addCountBtnClick = function(event){
		var row =this.comp('qtyInput');	
		console.log(row);
		row.val(parseInt(row.val()) + 1);
	};
	
	
	
	Model.prototype.reduceCountBtnClick = function(event){
		var row =this.comp('qtyInput');	
		console.log(row);
		row.val((parseInt(row.val()) > 0) ? parseInt(row.val()) - 1 : 0);
	};
	
	
	
	return Model;
});