<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:96px;top:242px;" onLoad="modelLoad">
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="registerData" idColumn="fID" autoNew="false" confirmRefresh="true" onCustomRefresh="registerDataCustomRefresh"><column label="fID" name="fID" type="String" xid="xid5"></column>
  <column label="手机号" name="tel" type="String" xid="xid1"></column>
  <column label="银行卡号后4位" name="cardNoLastFour" type="String" xid="xid2"></column>
  <column label="验证码" name="checkNum" type="String" xid="xid3"></column></div>
  </div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="loginBindReceiver" onReceive="loginBindReceiverReceive" style="left:50px;top:12px;"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1">
   <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" title="会员注册" xid="titleBar1">
    <div class="x-titlebar-left text-muted" xid="div2">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="搜索" xid="backBtn" icon="icon-chevron-left" onClick="backBtnClick">
      <i xid="i6" class="icon-chevron-left"></i>
      <span xid="span6">搜索</span></a> </div> 
    <div class="x-titlebar-title" xid="div5">会员注册</div>
    <div class="x-titlebar-right reverse" xid="div6"></div></div> </div><div class="x-panel-content x-cards"><div class="panel panel-default x-card" xid="div1">
   
   <div class="modal-body" xid="div3">
    <form class="form-horizontal" xid="form1">
     <div class="form-group" xid="formGroup1">
      <label class="col-xs-3 control-label" style="word-spacing:20px;padding-top: 12px;" xid="controlLabel1"><![CDATA[手机号]]></label>
      <div class="col-xs-9" xid="col1">
       <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="telInput" placeHolder="请输入11位手机号码" bind-ref="registerData.ref('tel')" onChange="telInputChange"></input></div> </div> 
     <div class="form-group" xid="formGroup2">
      <label class="col-xs-3 control-label" style="word-spacing:20px;padding-top: 12px;" xid="controlLabel2"><![CDATA[卡后4位]]></label>
      <div class="col-xs-9" xid="col2">
       <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input8" bind-ref="registerData.ref('cardNoLastFour')" placeHolder="请输入后4位银行卡号"></input></div> </div> 
     <div class="form-group" xid="formGroup3">
      <label class="col-xs-3 control-label" style="word-spacing:20px;padding-top: 12px;" xid="controlLabel3"><![CDATA[验证码]]></label>
      <div class="col-xs-9" xid="col3">
       <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup2">
        <input type="text" class="form-control" component="$UI/system/components/justep/input/input" xid="input5" bind-ref="registerData.ref('checkNum')" placeHolder="请输入验证码" onChange="input5Change"></input>
        <div class="input-group-btn" xid="div14">
         
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="获取验证码" xid="checkButton" onClick="checkButtonClick" style="width:95px;">
   <i xid="i4"></i>
   <span xid="span4">获取验证码</span></a>
  </div> </div> </div> </div> </form> </div> 
   <div class="panel-footer clearfix" xid="div4">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="注   册" xid="saveUserBtn" style="width:95px;float: right;width:100px;" onClick="saveUserBtnClick">
     <i xid="i3"></i>
     <span xid="span1">注   册</span></a> </div> 
  </div>
  </div>
   </div></div>