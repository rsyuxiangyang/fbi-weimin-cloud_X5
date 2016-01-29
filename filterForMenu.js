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

	var Model = function() {
		this.callParent();

		this._deviceType = "pc"; // pc || wx || app

		this._userID = "user";
		this._userDefaultName = "新用户";
		this._userDefaultAddress = "";
		this._userPhotoURL = "";
		this._state = "";
		this._menuType = "";
	};

	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		// 获取url上的code参数 - 微信授权code，用于获取微信用户信息
		var weixinCode = this.getContext().getRequestParameter("code");
		var menuType = this.getContext().getRequestParameter("menuType");
		this._menuType=menuType;
//		alert(this._menuType);

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
				 this.wxApi = new navigator.WxApi("wxb67cf3f14d6861e4");
//				this.wxApi = new navigator.WxApi("wx3267506118bc9677");
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
			"uid3rd" : openid
		};
		var successFunc = function(resultData) {
			var retResult = resultData["result"];
			if ("unSupport" == retResult || "nodata" == retResult || "failBind" == retResult) {
				self._state = '0';
				self.comp('loginBindDialog').open({
					data : {
						uid3rdPara : self._userID,
						menuTypePara:self._menuType,
						displayNamePara : self._userDefaultName
					}
				});
			} else if ("error" == retResult) {
				justep.Util.hint("加载数据失败");
			} else if ("preBind" == retResult) {
				self._state = '2';
				self.comp('registrationCheckDialog').open();
			} else {
				if(self._menuType=='myPointsMenu'){
					self.comp('myPointsDialog').open({
						data : {
							uid3rdPara : self._userID
						}
					});
				}else if(self._menuType=='myRegistrationMenu'){
					justep.Util.hint('您已经是会员，无需注册！');
				}else if(self._menuType=='myDonationMenu'){
					self.comp('myDonationDialog').open({
						data : {
							uid3rdPara : self._userID
						}
					});
				}
				
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

	Model.prototype.loginBindDialogReceive = function(event){
		justep.Util.hint("预注册成功,系统审核结果会以微信消息形式通知您！");
	};

	return Model;
});