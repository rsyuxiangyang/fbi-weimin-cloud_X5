<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad" style="height:auto;left:172px;top:401px;"><div component="$UI/system/components/justep/data/data" autoLoad="false" xid="personBpCustsData" idColumn="pkid" autoNew="false" onCustomRefresh="personBpCustsDataCustomRefresh">
   <column label="pkid" name="pkid" type="String" xid="xid7"></column>
   <column label="userId" name="userId" type="String" xid="column1"></column>
   <column label="custNo" name="custNo" type="String" xid="column4"></column>
   <column label="custName" name="custName" type="String" xid="column3"></column>
   <column label="bindState" name="bindState" type="String" xid="column2"></column>
   <column label="tel" name="tel" type="String" xid="xid1"></column>
   <column label="cardNoLastFour" name="cardNoLastFour" type="String" xid="xid8"></column>
   <column label="cumuPoints" name="cumuPoints" type="Decimal" xid="xid9"></column>
   <column label="cumuIncPoints" name="cumuIncPoints" type="Decimal" xid="xid10"></column>
   <column label="cumuRedPoints" name="cumuRedPoints" type="Decimal" xid="xid11"></column>
   <column label="isValid" name="isValid" type="String" xid="xid16"></column>
   <column label="displayName" name="displayName" type="String" xid="xid17"></column></div>
  </div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="personInfoReceiver" style="left:130px;top:13px;" onReceive="personInfoReceiverReceive"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel2">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar  text-center" title="个人信息" xid="titleBar1">
   <div class="x-titlebar-left " xid="div2">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="搜索" xid="backBtn" icon="icon-chevron-left" onClick="backBtnClick">
     <i xid="i6" class="icon-chevron-left"></i>
     <span xid="span6">搜索</span></a> </div> 
   <div class="x-titlebar-title" xid="div4">个人信息</div>
   <div class="x-titlebar-right reverse" xid="div5"></div></div></div>
   <div class="x-panel-content " xid="content2"><div xid="photoDiv" style="height:100px;width:100px;margin:5px auto;border-radius:100px;overflow:hidden;">
   <img alt="" xid="photoImage" height="100%" style="width:100%;"></img>
  </div>
  <input component="$UI/system/components/justep/input/input" class="form-control text-center" xid="nickNameInput" style="color:black;border:0px;background-color:white" readonly="true"></input><div class="text-center panel panel-default x-card" xid="div1">
   <div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block" xid="row1">
   
   <div class="col col-xs-6  text-right" xid="col2"><label xid="label1" style="position:relative;top:8px"><![CDATA[手机号:]]></label></div>
  <div class="col col-xs-6 text-right" xid="col1">
   <input component="$UI/system/components/justep/input/input" class="form-control text-left" xid="telInput" style="position:relative;left:-10px;color:black;border:0px;background-color:white" readonly="true" bind-ref="personBpCustsData.ref('tel')"></input></div></div>
  <div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block" xid="row2">
   <div class="col col-xs-6 text-right" xid="col3"><label xid="label2" style="position:relative;top:8px"><![CDATA[银行卡号:]]></label></div>
   <div class="col col-xs-6  text-left" xid="col4"><input component="$UI/system/components/justep/input/input" class="form-control text-left" xid="cardNoInput" bind-ref="personBpCustsData.ref('cardNoLastFour')" readonly="true" style="position:relative;left:-10px;color:black;border:0px;background-color:white"></input></div></div></div></div>
   </div></div>