define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Baas = require("$UI/demo/baas/baas");
	var comUtil = require("$UI/system/components/justep/common/common");
	
	var Model = function(){
		this.callParent();
	};
    //返回上一页
	Model.prototype.backBtnClick = function(event) {
		this.comp('windowReceiver1').windowCancel();
	};
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
	//加载数
//	Model.prototype.programsCustomRefresh = function(event){
//     var programsData = event.source;
//        $.ajax({
//            type: "GET",
//            url: require.toUrl('./json/programsData.json'),
//            dataType: 'json',
//            async: false,//使用同步方式，目前data组件有同步依赖
//            cache: false,
//            success: function(data){
//            programsData.loadData(data);//将返回的数据加载到data组件
//            },
//            error: function(){
//              throw justep.Error.create("加载数据失败");
//            }
//        });	
//	};
	Model.prototype.windowReceiver1Receive = function(event){

	};
	return Model;
});