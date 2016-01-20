<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:409px;top:283px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="programs" idColumn="programsID"><column label="ID" name="programsID" type="Integer" xid="xid1"></column>
  <column label="项目名称" name="programsName" type="String" xid="xid2"></column></div></div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver1" onReceive="windowReceiver1Receive"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full  x-scroll-view" xid="panel1">
   <div class="x-panel-top" xid="top1">
  <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" title="wei民风采" xid="titleBar4">
   <div class="x-titlebar-left text-muted" xid="div10">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="搜索" xid="button6" icon="icon-chevron-left" onClick="backBtnClick">
     <i xid="i6" class="icon-chevron-left"></i>
     <span xid="span6">搜索</span></a> </div> 
   <div class="x-titlebar-title" xid="div11">wei民风采</div>
   <div class="x-titlebar-right reverse" xid="div12"></div></div></div>
   <div class="x-panel-content" xid="content1" style="background-color:#fafafa;">
  
  <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1">
   
   <div class="x-content-center x-pull-down container" xid="div1">
   <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"></i>
   <span class="x-pull-down-label" xid="span1">下拉刷新...</span></div><div class="x-scroll-content" xid="div3">
  <div xid="div2" class="dImg">
   <img alt="" xid="image1" class="img-responsive" bind-attr-src="$model.getImageUrl('./img/fbg.jpg')" style="width:100%;background-color:transparent;" align="middle"></img></div><div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card panel-body" xid="panel2" style="width:100%;">
   <h4 xid="h41" class=" text-black" style="text-align:center;">一盏灯，</h4>
   <h4 xid="h42" class=" text-black" style="text-align:center;">温暖你寒冷;</h4>
   <h4 xid="h43" class=" text-black" style="text-align:center;">一座城，</h4>
   <h4 xid="h44" class=" text-black" style="text-align:center;">呵护你一生;</h4></div><div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card" xid="panel3">
   
    
  <div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="projectlist">
   <ul class="x-list-template x-min-height list-group" xid="projectlistTemplateUl1" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl1">
    <li xid="li1" class="x-min-height list-group-item" componentname="li(html)" id="undefined_li1"><img src="" alt="" xid="image2" bind-attr-src="$model.getImageUrl('./img/program3.jpg')" height="100%" style="height:198px;width:100%;" dir="ltr"></img>
  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col" xid="col4" style="text-align:center;"><span xid="span7" style="font-size:large;">圆梦贵州山区的渴望</span></div>
   </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="background-color:#f8f6f7;height:30px;;">
   <div class="x-col" xid="col1" style="text-align:center;font-weight:bolder;color:#74CC4E;"><span xid="span8"><![CDATA[356人]]></span></div>
   <div class="x-col" xid="col2" style="text-align:center;font-weight:bolder;"><span xid="span9" style="font-weight:bolder;color:orange;"><![CDATA[12132元]]></span></div>
   <div class="x-col" xid="col3" style="text-align:center;font-weight:bolder;"><span xid="span10" style="margin-left:10px;color:#FF5A00;"><![CDATA[3天]]></span></div></div><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="true" xid="buttonGroup1" style="margin-top:-10px;"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top" label="参与人数" xid="button1" icon="icon-ios7-people" style="color:#74CC4E;padding-top:0px;">
   <i xid="i2" class="icon-ios7-people"></i>
   <span xid="span3">参与人数</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top" label="已募善款" xid="button2" icon="icon-heart" style="color:orange;">
   <i xid="i3" class="icon-heart"></i>
   <span xid="span4">已募善款</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top" label="剩余时间" xid="button3" icon="icon-android-data" style="color:#FF5A00;">
   <i xid="i4" class="icon-android-data"></i>
   <span xid="span5">剩余时间</span></a></div>
  </li></ul> </div></div></div>
   <div class="x-content-center x-pull-up" xid="div4">
    <span class="x-pull-up-label" xid="span2">加载更多...</span></div> </div></div>
   </div></div>