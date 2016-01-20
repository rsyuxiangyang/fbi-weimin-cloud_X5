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

		this._deviceType = "pc"; // pc || wx || app

		this._userID = "user";
		this._userDefaultName = "新用户";
		this._userDefaultAddress = "";
		this._userPhotoURL = "";
		this._state = "";
	};

	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		// 获取url上的code参数 - 微信授权code，用于获取微信用户信息
		var weixinCode = this.getContext().getRequestParameter("code");

		// 判断运行环境是否在X5移动客户端中，如果在移动客户端中，则当deviceready后取手机设备uuid作为用户唯一标识
		if (justep.Browser.isX5App) {
			this._deviceType = "app";
			CommonUtils.attachDoubleClickExitApp(function() {
				if (self.comp('contents').getActiveIndex() === 0) {
					return true;
				}
				return false;
			});
			document.addEventListener("deviceready", function() {
				self._userID = window.device.uuid;
				self._userDefaultName = "新用户（来自X5APP的用户）";
			}, false);

		} else if (weixinCode !== "") {
			this._deviceType = "wx";
			if (justep.Browser.isWeChat) {
//				this.wxApi = new navigator.WxApi("wxb67cf3f14d6861e4");
				 this.wxApi = new navigator.WxApi("wx3267506118bc9677");
			}

			$.getJSON("/baas/weixin/userinfo?code=" + weixinCode, function(weixinUser) {
				self._userID = weixinUser.openid;
				self._userDefaultName = weixinUser.nickname + "（来自微信的用户）";
				self._userDefaultAddress = weixinUser.country + weixinUser.province + weixinUser.city;
				self._userPhotoURL = weixinUser.headimgurl;
				self.initBpCustsData(weixinUser.openid);// 有可能是异步
			});
		}
	};

	Model.prototype.initBpCustsData = function(openid) {
		var self = this;
		var bpCustsData = this.comp("bpCustsData");
		var params = {
			"columns" : Baas.getDataColumns(bpCustsData),
			"uid3rd" : openid
		};
		var successFunc = function(resultData) {
			var retLength = resultData.length;
			if (retLength === 0) {
				self._state = '0';
			} else {
				var append = event.options && event.options.append;
				bpCustsData.loadData(resultData, append);
				self._state = '1';
			}
		};
		$.ajax({
			type : "GET",
			url : require.toUrl('/weixin/ms/X5/checkBind'),
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

	Model.prototype.orderBtnClick = function(event) {
		if (this._state == '0') {
			this.comp('loginBindDialog').open({
				data : {
					uid3rdPara : this._userID
				}
			});
		} else {

		}
	};

	Model.prototype.ownBtnClick = function(event) {
		if (this._state == '0') {
			this.comp('loginBindDialog').open({
				data : {
					uid3rdPara : this._userID
				}
			});
		} else {
			this.loadOwnContentData();
		}
	};

	Model.prototype.loadOwnContentData = function() {
		var ownContentData = this.comp("ownContentData");
		ownContentData.refreshData();
		if (this._userPhotoURL) {
			$(this.getElementByXid("photoImage")).attr("src", this._userPhotoURL);
		} else {
			$(this.getElementByXid("photoDiv")).hide();
		}
	};

	// 转换动态图片URL
	Model.prototype.transURL = function(url) {
		return require.toUrl(url);
	};

	Model.prototype.gmGoodsInfoDataCustomRefresh = function(event) {
		var data = event.source;
		var params = {
			"limit" : event.limit,
			"offset" : event.offset
		};
		var successFunc = function(resultData) {
			var append = event.options && event.options.append;
			data.loadData(resultData, append);
		};
		$.ajax({
			type : "GET",
			url : require.toUrl('/weixin/ms/X5/qryGoods'),
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

	Model.prototype.bpCustsDataCustomRefresh = function(event) {
		var bpCustsData = event.source;
		var params = {
			"columns" : Baas.getDataColumns(bpCustsData),
			"uid3rd" : this._userID
		};
		var successFunc = function(resultData) {
			var append = event.options && event.options.append;
			bpCustsData.loadData(resultData, append);
		};
		$.ajax({
			type : "GET",
			url : require.toUrl('/weixin/ms/X5/checkBind'),
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

	Model.prototype.ownContentDataCustomRefresh = function(event) {
		var ownContentData = event.source;
		var params = {
			"columns" : Baas.getDataColumns(ownContentData),
			"uid3rd" : this._userID
		};
		var successFunc = function(resultData) {
			var append = event.options && event.options.append;
			ownContentData.loadData(resultData, append);
		};
		$.ajax({
			type : "GET",
			url : require.toUrl('/weixin/ms/X5/getOwnContentData'),
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

	Model.prototype.jifenRowClick = function(event) {
//		var bpCustsData = this.comp("bpCustsData");
		var uid3rdTemp = this._userID;
		if (this._state == '0') {
			this.comp('loginBindDialog').open({
				data : {
					uid3rdPara : uid3rdTemp
				}
			});
		} else {
			this.comp('myPointsDialog').open({
				data : {
					uid3rdPara : uid3rdTemp
				}
			});
		}
	};

	Model.prototype.xingjiRowClick = function(event) {
		var uid3rdTemp = this._userID;
		justep.Util.hint('敬请期待！');
	};

	Model.prototype.aixinjuanzengRowClick = function(event) {
		this.comp("contents").to("goodsContent");
	};

	Model.prototype.huiyuanzhuceRowClick = function(event) {
//		var bpCustsData = this.comp("bpCustsData");
		var uid3rdTemp = this._userID;

		if (this._state == '0') {
			this.comp('loginBindDialog').open({
				data : {
					uid3rdPara : uid3rdTemp
				}
			});
		} else {
			justep.Util.hint('您已经是会员！');
		}
	};

	Model.prototype.gerenxinxiRowClick = function(event) {
//		var bpCustsData = this.comp("bpCustsData");
		var uid3rdTemp = this._userID;

		if (this._state == '0') {
			this.comp('loginBindDialog').open({
				data : {
					uid3rdPara : uid3rdTemp
				}
			});
		} else {
			justep.Util.hint('敬请期待！');
		}
	};

	Model.prototype.goodsDivClick = function(event) {
		var row = event.bindingContext.$object;
		console.log(row);

		var goodsIdTemp = row.val("goodsId");

		this.comp('goodsDetailDialog').open({
			data : {
				uid3rd : this._userID,
				goodsId : goodsIdTemp,
				state:this._state
			}
		});

	};

	Model.prototype.weiminfengcaiRowClick = function(event) {
		this.comp('fencaiDialog').open();
	};

	Model.prototype.loginBindDialogReceive = function(event) {
		this._state = event.data;
		var bpCustsData = this.comp("bpCustsData");
		bpCustsData.refreshData();
		this.comp("contents").to("goodsContent");
	};

	Model.prototype.rongyuRowClick = function(event){
		justep.Util.hint('敬请期待！');
	};

	Model.prototype.personInfoRowClick = function(event){
		justep.Util.hint('敬请期待！');

	};

	Model.prototype.myDonationRowClick = function(event){
//		var bpCustsData = this.comp("bpCustsData");
		var uid3rdTemp = this._userID;
		if (this._state == '0') {
			this.comp('loginBindDialog').open({
				data : {
					uid3rdPara : uid3rdTemp
				}
			});
		} else {
			this.comp('myDonationDialog').open({
				data : {
					uid3rdPara : uid3rdTemp
				}
			});
		}

	};


	Model.prototype.jifenColClick = function(event){
		var uid3rdTemp = this._userID;
		if (this._state == '0') {
			this.comp('loginBindDialog').open({
				data : {
					uid3rdPara : uid3rdTemp
				}
			});
		} else {
			this.comp('myPointsDialog').open({
				data : {
					uid3rdPara : uid3rdTemp
				}
			});
		}

	};

	Model.prototype.row3Click = function(event){
		var uid3rdTemp = this._userID;
		if (this._state == '0') {
			this.comp('loginBindDialog').open({
				data : {
					uid3rdPara : uid3rdTemp
				}
			});
		} else {
			this.comp('myDonationDialog').open({
				data : {
					uid3rdPara : uid3rdTemp
				}
			});
		}

	};

	return Model;
});