<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="gmGoodsDtlInfoData" idColumn="pkid" confirmDelete="true" limit="2" confirmRefresh="false">
   <column label="pkid" name="pkid" type="String" xid="default1"></column>
   <column label="goodsId" name="goodsId" type="String" xid="default2"></column>
   <column label="goodsName" name="goodsName" type="Float" xid="default3"></column>
   <column label="image" name="image" type="String" xid="default4"></column>
   <column label="unit" name="unit" type="String" xid="default5"></column>
   <column label="storeQty" name="storeQty" type="String" xid="xid2"></column>
   <column label="price" name="price" type="String" xid="xid3"></column>
   <data xid="default6">[]</data>
   <column label="amt" name="amt" type="String" xid="xid4"></column>
   <column label="createTime" name="createTime" type="String" xid="xid5"></column>
   <column label="description" name="description" type="String" xid="xid6"></column>
   <column label="calcPriceText" name="calcPriceText" type="String" xid="default23"></column>
   <rule xid="rule2">
    <col name="calcPriceText" xid="ruleCol2">
     <calculate xid="calculate2">
      <expr xid="default30">val('price') + '积分'</expr></calculate> </col> 
    <col name="calcImageURL" xid="ruleCol7">
     <calculate xid="calculate7">
      <expr xid="default35">js:$model.transURL('./img/'+val('image'))</expr></calculate> </col> </rule> 
   <column label="calcImageURL" name="calcImageURL" type="String" xid="default24"></column></div></div> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-content" xid="content1"><div class="media" xid="goodsDiv" bind-click="goodsDivClick" style="position:absolute;left:5%;margin:10px auto;">
   <div class="media-left" xid="div1">
    <img alt="" xid="image1" style="width:60px;" class="img-rounded media-object" bind-attr-src="$model.getImageUrl('./img/17.jpg')" height="60px"></img></div> 
   <div class="media-body" xid="div3">
   <h5 xid="h51" class="fontColor2"><![CDATA[WEI民公益 微会员]]></h5></div></div><div xid="div4" style="position:absolute;left:25%;margin:60px auto;" class="text-center"><h4 xid="h41" class="fontColor2"><![CDATA[学生便携式台灯]]></h4>
  <h5 xid="h52" class="fontColor2"><![CDATA[便携式台灯,送充电宝]]></h5>
  <h5 xid="h53" class="fontColor2"><![CDATA[有效期:2016-01-01至2016-01-31]]></h5></div><div xid="div2" class="text-center">
   <img src="" alt="" xid="image2" class="image-wall img1 img-responsive" style="width:100%;" bind-attr-src="$model.getImageUrl('./img/bg.jpg')"></img></div>
  </div>
   <div class="x-panel-bottom" xid="bottom1"></div></div></div>