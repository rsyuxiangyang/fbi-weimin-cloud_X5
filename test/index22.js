define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};


	

	Model.prototype.jqueryAddClick = function(event){
	    var data ='[{username:"hzy",password:"22",email:"333@qq.com"}]';	    
	    var data2 = eval('('+data+')');
	    console.log($.parseJSON(data)[0].username);
	    //var row = event.bindingContext.$object;
	
		//var data =this.comp("data1");	
		//var data2 = this.comp("username");
		//console.log("username---"+row.username.value+"---password---"+row.password.value+"---phone----"+row.phone.value);	
		
//		console.log(row.val("username"));	
//		console.log(data.toJson(true));	
//      console.log(data.toJson(true).rows[0]);	
       //var row = data.toJson(true).rows[0]
       //alert(row.username.value)
       //console.log(this.comp("username").value)
		//console.log("username---"+row.username.value+"---password---"+row.password.value+"---phone----"+row.phone.value);	
		//console.log(event.bindingContext.$object.val("username"));	  
		//通用获取内容
		//alert(data.domNode.value);
		//获取文本框的内容
		//alert(data.value)
		//alert(data.get("value"));
		//console.log(this);
		
//	     $.ajax({
//            type: "POST",
//            url: require.toUrl('./save.j'),
//            contentType: 'application/json',
//            async: false,
//            cache: false,
//            data: JSON.stringify(masterData.toJson(true)),//序列化data修改的数据
//            success: function(data){
//            	masterData.applyUpdates();//更新数据状态
//            },
//            error: function(){
//              throw justep.Error.create("保存数据失败");
//            }
//        });
	

	};

	Model.prototype.lastTimeClick = function(event){	  
	   var _self = this;
	   var count = 0;
	   var totalCount = 60;
	   totalCount = parseInt(totalCount);
	   count = parseInt(count);
	   /*_self.comp("lastTime").disabled=true;*/
	    $(this.getElementByXid("lastTime")).attr("disabled", true);
	   var timer = setInterval(function(){
	      count++;
	      _self.comp("lastTime").domNode.innerText = totalCount-count
	      if(totalCount-count==0){
	        window.clearInterval(timer);
	        _self.comp("lastTime").domNode.innerText = '发送验证码'
	        /*_self.comp("lastTime").disabled=false;*/
	        $(this.getElementByXid("lastTime")).attr("disabled", false);
	      }
		     
	   },1000);

	};

	return Model;
});