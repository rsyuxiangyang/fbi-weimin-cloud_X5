<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:m;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:235px;top:180px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="pointsDtlData" idColumn="pkid" limit="2" onCustomRefresh="pointsDtlDataCustomRefresh">
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
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        title="我的积分"> 
        <div class="x-titlebar-left text-muted"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="搜索" xid="button6" icon="icon-chevron-left" onClick="backBtnClick"> 
            <i xid="i6" class="icon-chevron-left"/>  
            <span xid="span6">搜索</span> 
          </a> 
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
    <div xid="div1" style="z-index:2;margin:20px auto;position:absolute;height:122px;width:60%;left:57px;top:0;" class="text-center">
   <h4 xid="h47" class="pull-right fontColor" style="position:relative;height:88px;width:114px;left:20%;top:50px;">我的剩余积分</h4>
   <img src="" alt="" xid="image6" class="pull-left text-center" style="position:absolute;width:30px;left:-6px;top:54px;" bind-attr-src="$model.getImageUrl('./img/icons/iconfont-wodejifenw.png')" height="30px"></img>
   <h1 xid="h12" class="pull-right fontColor" style="position:absolute;height:51px;width:80px;left:-12px;top:95px;" bind-text="pointsData.ref('cumuPoints')"><![CDATA[]]></h1></div><div xid="div2" class="text-center" style="z-index:2;background-color:#00c160;height:150px;"></div><div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="jifenRow" style="width:100%;background-color:#E8E8E8">
   <div class="col col-xs-12" xid="col10" style="height:40px;background-color:#fafafa;">
    <span xid="span15">
     <h5 xid="h51" style="position:absolute;left:4%;top:7%;color:#C0C0C0;">积分变动明细</h5></span> </div> </div><div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="pointsList" data="pointsDtlData" limit="8" autoLoad="false">
     <ul class="x-list-template list-group" xid="pointsDetaillistTemplateUl1">
      <li xid="li1" class="list-group-item">
       <div class="media" xid="pointsDiv">
        
   
  <div xid="div4"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2">
   <div class="col col-xs-1" xid="col9"><img bind-attr-src="$model.getImageUrl('./img/icons/kapian.png')" alt="" xid="image1" height="30"></img></div>
  <div class="col col-xs-11" xid="col11"><div component="$UI/system/components/justep/output/output" class="x-output list-group-item-heading" xid="output1" bind-ref="ref('cardNoLastFour')" style="font-size:14px;font-weight:bold;padding-top:5px;"></div></div></div></div><div xid="div7" style="margin-bottom:-15px;">
         
          
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row8">
   
   <div class="x-col " xid="col23" style="color:#6DCF4B">
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row9">
   <div class="x-col" xid="col27"><label xid="label3" dir="rtl"><![CDATA[:收入]]></label></div>
   <div class="x-col" xid="col22" style="padding-top:3px;margin-left:-20px;"><div component="$UI/system/components/justep/output/output" class="fontColor1 x-output list-group-item-text" xid="output14" style="font-weight:bold;height:auto;" bind-ref="ref('cumuIncPoints')"></div></div></div></div>
  <div class="x-col " xid="col31" style="color:#FF5A00">
   <div component="$UI/system/components/justep/row/row" class="x-row" xid="row10">
    <div class="x-col" xid="col30">
     <label xid="label6" dir="rtl"><![CDATA[:支出]]></label></div> 
    <div class="x-col" xid="col32" style="padding-top:3px;margin-left:-20px;">
     <div component="$UI/system/components/justep/output/output" class="fontColor1 x-output list-group-item-text" xid="output17" style="font-weight:bold;height:auto;" bind-ref="ref('cumuRedPoints')"></div></div> </div> </div>
  <div class="x-col " xid="col34" style="color:orange">
   <div component="$UI/system/components/justep/row/row" class="x-row" xid="row11">
    <div class="x-col" xid="col33">
     <label xid="label7" dir="rtl"><![CDATA[:剩余]]></label></div> 
    <div class="x-col" xid="col35" style="padding-top:3px;margin-left:-20px;">
     <div component="$UI/system/components/justep/output/output" class="fontColor1 x-output list-group-item-text" xid="output18" style="font-weight:bold;height:auto;" bind-ref="ref('cumuPoints')"></div></div> </div> </div></div></div>
  </div> </li> </ul> </div>
  <div xid="nodataDiv" class="text-center" style="display:none">
   <img src="" alt="" xid="image2" class="image-wall img1 img-responsive" style="width:100%;background-color:#E8E8E8" bind-attr-src="$model.getImageUrl('./img/pointsNodata.png')" height="80%"></img></div></div> 
   <div class="x-content-center x-pull-up" xid="div6">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i12" /> 
    <span class="x-pull-up-label" xid="span5">加载更多...</span></div> 
  </div></div>  
    </div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="myPointsReceiver" style="left:61px;top:11px;" onReceive="myPointsReceiverReceive"></span></div>
