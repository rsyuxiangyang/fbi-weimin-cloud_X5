define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.button1Click = function(event){
	var hhh=this.comp('h41');
	this.comp('h41').innerText='1211';
//this.getElementByXid("h41").innerText='1211'
	$().value='111';		

	};

	return Model;
});