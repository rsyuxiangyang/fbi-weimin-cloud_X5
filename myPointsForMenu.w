<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:m;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:269px;top:423px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="pointsDtlData" idColumn="pkid" limit="2" onCustomRefresh="pointsDtlDataCustomRefresh">
   <column label="pkid" name="pkid" type="String" xid="xid1"></column>
  <column label="卡号后四位" name="cardNoLastFour" type="String" xid="xid2"></column>
  <column label="累计积分数" name="cumuPoints" type="String" xid="xid3"></column>
  <column label="累计增加积分数" name="cumuIncPoints" type="String" xid="xid4"></column>
  <column label="累计减少积分数" name="cumuRedPoints" type="String" xid="xid5"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="pointsData" idColumn="cardNo" limit="2" onCustomRefresh="pointsDataCustomRefresh">
   <column label="卡号" name="cardNo" type="String" xid="column4"></column>
   <column label="卡号后四位" name="cardNoLastFour" type="String" xid="column5"></column>
   <column label="累计积分数" name="cumuPoints" type="String" xid="column1"></column>
   <column label="累计增加积分数" name="cumuIncPoints" type="String" xid="column2"></column>
   <column label="累计减少积分数" name="cumuRedPoints" type="String" xid="column3"></column></div></div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="loginBindDialog" src="$UI/takeout/registrationForMenu.w"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="registrationCheckDialog" src="$UI/takeout/registrationCheckForMenu.w"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        title="我的积分"> 
        <div class="x-titlebar-left text-muted"> 
          </div>  
        <div class="x-titlebar-title">我的积分</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards x-scroll-view" style="bottom: 0px;" xid="C6EB65157F20000133E0EA73F9D75430"> 
      
  
  
  <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView2">
    <div class="x-content-center x-pull-down container" xid="div3">
   <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"></i>
   <span class="x-pull-down-label" xid="span2">下拉刷新...</span></div><div class="x-scroll-content" xid="div5">
    <div xid="div1" style="z-index:2;margin:20px auto;position:absolute;height:122px;top:0;width:80%;">
   <h4 xid="h47" class="fontColor" style="position:absolute;height:88px;width:114px;top:50px;left:50px;"><![CDATA[积分余额]]></h4>
   <img src="" alt="" xid="image6" class="text-center" style="position:absolute;width:30px;left:15px;top:120px;" bind-attr-src="$model.getImageUrl('./img/icons/iconfont-wodejifenw.png')" height="30px"></img>
   <h1 xid="h12" class="fontColor" style="position:absolute;height:51px;width:80px;top:95px;left:50px;" bind-text="pointsData.ref('cumuPoints')"><![CDATA[]]></h1></div><div xid="div8" style="z-index:2;margin:20px auto;position:absolute;height:122px;top:0;width:80%;right:0px">
   <h4 xid="h41" class="fontColor" style="position:absolute;height:88px;width:114px;right:25px;top:50px;"><![CDATA[累计已捐积分]]></h4>
   <img src="" alt="" xid="image1" class="text-center" style="position:absolute;width:30px;right:145px;top:120px;" bind-attr-src="$model.getImageUrl('./img/icons/iconfont-wodejifenw.png')" height="30px"></img>
   <h1 xid="h11" class="fontColor" style="position:absolute;height:51px;width:80px;right:60px;top:95px;" bind-text="pointsData.ref('cumuRedPoints')"></h1></div><div xid="div2" class="text-center" style="z-index:2;background-color:#00c160;height:150px;"></div><div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="jifenRow" style="width:100%;background-color:#E8E8E8">
   <div class="col col-xs-12" xid="col10" style="height:40px;background-color:#fafafa;">
    <span xid="span15">
     <h5 xid="h51" style="position:absolute;left:4%;top:7%;color:#C0C0C0;"><![CDATA[卡累计积分]]></h5></span> </div> </div><div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="pointsList" data="pointsDtlData" limit="8" autoLoad="true">
     <ul class="x-list-template list-group" xid="pointsDetaillistTemplateUl1">
      <li xid="li1" class="list-group-item">
       <div class="media" xid="pointsDiv">
        
   
  <div xid="div4">
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5">
    <div class="x-col" xid="col7">
     <img bind-attr-src="$model.getImageUrl('./img/icons/kapian.png')" alt="" xid="image3" height="30" class="pull-left"></img><div component="$UI/system/components/justep/output/output" class="x-output list-group-item-heading" xid="output1" bind-ref="ref('cardNoLastFour')" style="font-size:14px;font-weight:bold;padding-top:5px;"></div></div> 
    </div></div><div xid="div7" style="margin-bottom:-15px;">
         
          
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row8">
   
   <div class="x-col " xid="col23" style="color:#6DCF4B">
  <label xid="label3" dir="rtl" class="pull-left"><![CDATA[:共累计积分]]></label><div component="$UI/system/components/justep/output/output" class="fontColor1 x-output list-group-item-text" xid="output14" style="height:auto;position:relative;bottom:3px" bind-ref="ref('cumuIncPoints')"></div></div>
  </div></div>
  </div> </li> </ul> </div>
  <div xid="nodataDiv" class="text-center" style="display:none">
   <img src="" alt="" xid="image2" class="image-wall img1 img-responsive" style="width:100%;background-color:#E8E8E8" bind-attr-src="$model.getImageUrl('./img/pointsNodata.png')" height="80%"></img></div>
  </div> 
   <div class="x-content-center x-pull-up" xid="div6">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i12" /> 
    <span class="x-pull-up-label" xid="span5">加载更多...</span></div> 
  </div></div>  
    </div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="myPointsReceiver" style="left:61px;top:11px;" onReceive="myPointsReceiverReceive"></span></div>
