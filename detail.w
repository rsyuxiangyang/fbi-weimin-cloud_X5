<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:m;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"><div component="$UI/system/components/justep/data/data" autoLoad="false" xid="gmGoodsDtlInfoData" idColumn="pkid" confirmDelete="true" limit="2" confirmRefresh="false" onCustomRefresh="gmGoodsDtlInfoDataCustomRefresh">
   
   <column label="pkid" name="pkid" type="String" xid="default1"></column>
  <column label="goodsId" name="goodsId" type="String" xid="default2"></column>
  <column label="goodsName" name="goodsName" type="String" xid="default3"></column>
  <column label="image" name="image" type="String" xid="default4"></column>
  <column label="unit" name="unit" type="String" xid="default5"></column>
  <column label="storeQty" name="storeQty" type="String" xid="xid2"></column>
  <column label="price" name="price" type="String" xid="xid3"></column>
  <data xid="default6">[]</data>
  <column label="amt" name="amt" type="String" xid="xid4"></column>
  <column label="createTime" name="createTime" type="String" xid="xid5"></column>
  <column label="description" name="description" type="String" xid="xid6"></column>
  <column label="points" name="points" type="String" xid="xid1"></column>
  <rule xid="rule2">
   <col name="calcPriceText" xid="ruleCol2">
    <calculate xid="calculate2">
     <expr xid="default30">val('price') + '积分'</expr></calculate> </col> 
   <col name="calcImageURL" xid="ruleCol7">
    <calculate xid="calculate7">
     <expr xid="default35">js:$model.transURL('./img/'+val('image'))</expr></calculate> </col> </rule>
  <column label="calcPriceText" name="calcPriceText" type="String" xid="default23"></column>
  <column label="calcImageURL" name="calcImageURL" type="String" xid="default24"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="qtyModelData" onCustomRefresh="qtyModelDataCustomRefresh" idColumn="fID" autoNew="true"><column label="fID" name="fID" type="String" xid="xid7"></column>
  <column label="qtyDataTemp" name="qtyDataTemp" type="String" xid="xid8"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        title="物品详情"> 
        <div class="x-titlebar-left text-muted"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="搜索" xid="backBtn" icon="icon-chevron-left" onClick="backBtnClick"> 
            <i xid="i6" class="icon-chevron-left"/>  
            <span xid="span6">搜索</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title">物品详情</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards"> 
      <div xid="div1" style="z-index:2;margin:20px auto;position:absolute;height:122px;width:80%;left:40px;top:0;" class="text-center">
   <h4 xid="h47" class="pull-right fontColor" style="position:absolute;height:20px;width:120px;top:30px;right:1px;color:white"><![CDATA[物品所需积分]]></h4>
   <img src="" alt="" xid="image6" class="pull-right" style="position:absolute;left:5px;width:110px;top:20px;" bind-attr-src=' $model.gmGoodsDtlInfoData.val("calcImageURL")' height="110px"></img>
   <h1 xid="h12" class="pull-right fontColor" style="position:absolute;width:80px;top:70px;right:1px;color:white;height:80px;" bind-text="gmGoodsDtlInfoData.ref('points')"><![CDATA[]]></h1>
  <img src="" alt="" xid="image1" class="pull-right text-center" style="position:absolute;width:30px;top:95px;right:85px;color:white;height:30px;" bind-attr-src="$model.getImageUrl('./img/icons/iconfont-wodejifenw.png')" height="30px"></img></div><div xid="div1" class="text-center" style="z-index:2;background-color:#00c160;height:200px;"></div><div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card panel-body"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-6" xid="col1"><h4 xid="h41" class="pull-left text-black" bind-text="gmGoodsDtlInfoData.ref('goodsName')"><![CDATA[]]></h4></div>
   <div class="col col-xs-6" xid="col2"><h5 xid="h52" class="pull-left" style="position:relative;left:50%;color:#00c160;"><![CDATA[库存:]]></h5><h4 xid="h43" class="pull-right text-black" bind-text="gmGoodsDtlInfoData.ref('storeQty')"><![CDATA[]]></h4></div>
   </div>  
        </div>  
      <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card"> 
        <div class="panel-heading x-noborder"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon btnImg"
            label="button" xid="button12" icon="icon-android-download" style="background-color:#00c160;"> 
            <i xid="i24" class="icon-android-download"/>  
            <span xid="span29"/> 
          </a>  
          <span xid="span30"><![CDATA[物品描述]]></span> 
        </div>  
        <div xid="div33" class="panel-body features trip"> 
          <div> 
            <div class="media-left"> 
              </div>  
            <div class="media-body"> 
              <span xid="span1" bind-text="gmGoodsDtlInfoData.ref('description')"></span></div> 
          </div>          
        </div>  
        </div>  
      
  </div>  
    <div class="x-panel-bottom" xid="bottom1">
   <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4">
   <div xid="col11" style="width:25%"><h5 xid="h53" class="pull-left" style="color:#00c160;font-size:16px"><![CDATA[捐赠数量:]]></h5></div>
   <div xid="col12" style="padding-top:10px;width:40%;" class="text-center">
  <div xid="div2" style="position:relative;bottom:4px"><a component="$UI/system/components/justep/button/button" class="btn btn-xs btn-only-icon" label="button" xid="reduceCountBtn" icon="icon-android-remove" onClick="reduceCountBtnClick" style="color:white;background-color:#00c160;">
   <i xid="i3" class="icon-android-remove"></i>
   <span xid="span3"></span></a><input component="$UI/system/components/justep/input/input" xid="qtyInput" bind-ref="qtyModelData.ref('qtyDataTemp')" style="text-align:center;width:50px"></input><a component="$UI/system/components/justep/button/button" class="btn btn-xs btn-only-icon" label="button" xid="addCountBtn" icon="icon-android-add" onClick="addCountBtnClick" style="color:white;background-color:#00c160;">
   <i xid="i4" class="icon-android-add"></i>
   <span xid="span4"></span></a></div>
  
  </div>
   <div xid="col13" style="width:35%"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup2"> 
             
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-icon-left" label="捐赠" xid="shoppingCartBtn" icon="icon-ios7-cart-outline" onClick="shoppingCartBtnClick" style="font-size:20px;background-color:#00c160;color:#FFFFFF;height:100%;"> 
              <i xid="i8" class="icon icon-ios7-cart-outline" />  
              <span xid="span7">捐赠</span> 
            </a></div></div></div></div></div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="goodsDetailReceiver" onReceive="goodsDetailReceiverReceive" style="left:61px;top:11px;"></span></div>
