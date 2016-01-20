<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:450px;top:162px;"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="data1" autoNew="true" idColumn="id"><column label="用户名" name="username" type="String" xid="xid1"></column>
  <column label="密码" name="password" type="String" xid="xid2"></column>
  <column label="手机号" name="phone" type="String" xid="xid3"></column>
  <master data="data1" xid="default2"></master>
  <data xid="default1">[{&quot;username&quot;:&quot;胡珍洋&quot;,&quot;password&quot;:&quot;1111&quot;,&quot;phone&quot;:&quot;11111&quot;}]</data>
  <column name="id" type="String" xid="xid4"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="标题"
          class="x-titlebar">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">标题</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col" xid="col1"><input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="data1.ref('username')" xid="username"></input></div>
   <div class="x-col" xid="col2"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="data1.ref('password')"></input></div>
   <div class="x-col" xid="col3"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="data1.ref('phone')"></input></div></div>
  
  <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1"></textarea><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="jquery新增" xid="jqueryAdd" onClick="jqueryAddClick">
   <i xid="i3"></i>
   <span xid="span3">jquery新增</span></a>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col" xid="col4">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="outTime"></div></div>
   <div class="x-col" xid="col5"></div>
   <div class="x-col" xid="col6"></div></div>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" xid="lastTime" label="发送验证码" onClick="lastTimeClick" style="width:100px;">
   <i xid="i1"></i>
   <span xid="span1">发送验证码</span></a></div>
  </div> 
</div>