<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model"/> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-content x-cards" xid="content1"><div xid="photoDiv" style="height:128px;width:128px;margin:5px auto;">
   <img alt="" xid="photoImage" height="100%" style="width:100%;"></img></div>
  <div class="panel panel-default x-card" xid="div1">
   <div class="panel-heading clearfix" xid="div2">
    <h3 class="panel-title pull-left" xid="h31">默认联系方式</h3></div> 
   <div class="modal-body" xid="div3">
    <form class="form-horizontal" xid="form1">
     <div class="form-group" xid="formGroup1">
      <label class="col-xs-3 control-label" style="word-spacing:20px;padding-top: 12px;" xid="controlLabel1">姓名</label>
      <div class="col-xs-9" xid="col1">
       <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input9" bind-ref="userData.ref('fName')"></input></div> </div> 
     <div class="form-group" xid="formGroup2">
      <label class="col-xs-3 control-label" style="word-spacing:20px;padding-top: 12px;" xid="controlLabel2">电话</label>
      <div class="col-xs-9" xid="col2">
       <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input8" bind-ref="userData.ref('fPhoneNumber')"></input></div> </div> 
     <div class="form-group" xid="formGroup3">
      <label class="col-xs-3 control-label" style="word-spacing:20px;padding-top: 12px;" xid="controlLabel3">地址</label>
      <div class="col-xs-9" xid="col3">
       <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup2">
        <input type="text" class="form-control" component="$UI/system/components/justep/input/input" xid="input5" bind-ref="userData.ref('fAddress')"></input>
        <div class="input-group-btn" xid="div14">
         <a component="$UI/system/components/justep/button/button" class="btn btn-link" label=" 定位" xid="location" onClick="locationClick" icon="icon-android-location">
          <i xid="i13" class="icon-android-location"></i>
          <span xid="span19">定位</span></a> </div> </div> </div> </div> </form> </div> 
   <div class="panel-footer clearfix" xid="div4">
    <a component="$UI/system/components/justep/button/button" class="btn btn-success btn-sm" label="保存用户信息" xid="saveUserBtn" onClick="saveUserBtnClick" style="float: right;width:100px;">
     <i xid="i2"></i>
     <span xid="span1">保存用户信息</span></a> </div> </div></div>
   </div></div>