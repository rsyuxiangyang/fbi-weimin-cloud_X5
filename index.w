<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window takeout" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:243px;top:291px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="gmGoodsInfoData" idColumn="pkid" confirmDelete="true" limit="7" confirmRefresh="false" onCustomRefresh="gmGoodsInfoDataCustomRefresh"> 
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
  <column label="points" name="points" type="String" xid="xid15"></column>
  <rule xid="rule2">
   <col name="calcPriceText" xid="ruleCol2">
    <calculate xid="calculate2">
     <expr xid="default30">val('price') + '积分'</expr></calculate> </col> 
   <col name="calcImageURL" xid="ruleCol7">
    <calculate xid="calculate7">
     <expr xid="default35">js:$model.transURL('./img/'+val('image'))</expr></calculate> </col> </rule>
  <column label="calcPriceText" name="calcPriceText" type="String" xid="default23"></column>
  <column label="calcImageURL" name="calcImageURL" type="String" xid="default24"></column></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="bpCustsData" idColumn="pkid" autoNew="false" onCustomRefresh="bpCustsDataCustomRefresh">
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
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="ownContentData" idColumn="userId" autoNew="false" onCustomRefresh="ownContentDataCustomRefresh">
   <column label="用户ID" name="userId" type="String" xid="default15"></column>
  <column label="电话" name="tel" type="String" xid="default11"></column>
  <column label="积分" name="points" type="Decimal" xid="default10"></column>
  <column label="星级" name="star" type="String" xid="xid12"></column>
  <column label="优惠券" name="cashvoucher" type="String" xid="xid13"></column>
  <column label="custName" name="custName" type="String" xid="xid14"></column></div></div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="mapDialog"
    style="left:12px;top:13px;" routable="true" src="$UI/takeout/mapActivity.w"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="goodsDetailDialog" src="$UI/takeout/detail.w" routable="true"></span><span component="$UI/system/components/justep/windowDialog/windowDialog" xid="loginBindDialog" src="$UI/takeout/registration.w" style="left:9px;top:11px;" onReceive="loginBindDialogReceive" routable="true"></span>
  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="myPointsDialog" src="$UI/takeout/myPoints.w" style="left:9px;top:10px;" routable="true"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="registrationCheckDialog" src="$UI/takeout/registrationCheck.w" routable="true"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="fencaiDialog" src="$UI/takeout/weiDemeanour.w" routable="true"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="myDonationDialog" routable="true" src="$UI/takeout/myDonation.w"></span><span component="$UI/system/components/justep/windowDialog/windowDialog" xid="personInfoDialog" src="$UI/takeout/personInfo.w" routable="true"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents" slidable="false" swipe="true" onActiveChange="contentsActiveChange"> 
        <div class="x-contents-content active x-scroll-view" xid="goodsContent"> 
          <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
            xid="scrollView2"> 
            <div class="x-content-center x-pull-down container" xid="div4"> 
              <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"/>  
              <span class="x-pull-down-label" xid="span2">下拉刷新...</span> 
            </div>  
            <div class="x-scroll-content" xid="div5"> 
              <div component="$UI/system/components/justep/list/list" class="x-list x-cards"
                xid="foodList" data="gmGoodsInfoData" limit="7">
                <ul class="x-list-template list-group" xid="foodDetaillistTemplateUl1"> 
                  <li xid="li1" class="list-group-item"> 
                    <div class="media" xid="goodsDiv" bind-click="goodsDivClick"> 
                      <div class="media-left" > 
                        <img alt="" xid="image1" style="width:110px;height:110px;max-width:110px;max-height:110px;"
                          class="img-rounded media-object" bind-attr-src="val('calcImageURL')"/> 
                      </div>  
                      <div class="media-body"> 
                          
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output list-group-item-heading" xid="output1" bind-ref="ref('goodsName')" style="font-size:14px;font-weight:bold"/>  
                        <div component="$UI/system/components/justep/output/output" class="x-output list-group-item-text" xid="output2" bind-ref="ref('description')"></div><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row13">
   <div class="col col-xs-6" xid="col18"><div component="$UI/system/components/justep/output/output" class="fontColor1 x-output list-group-item-text" xid="output3" bind-ref="ref('calcPriceText')" style="font-weight: bold;" /></div>
   <div class="col col-xs-6" xid="col19"><img src="" alt="" xid="image8" class="pull-right x-card" bind-attr-src="$model.getImageUrl('./img/icons/goodsBranch.png')" style="width:25px;"></img></div>
   </div>
  </div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="x-content-center x-pull-up" xid="div6"> 
              <span class="x-pull-up-label" xid="span5">加载更多...</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content  x-cards" xid="serviceContent"> 
          <div xid="div8">
    
    
  <div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="jifenRow" style="width:100%;background-color:white;" bind-click="jifenRowClick">
    <div class="col col-xs-12" xid="col10" style="height:60px;">
     <span xid="span15">
      <span xid="span16" class="pull-left">
       <div xid="div10" class="text text-center">
        <img src="" alt="" xid="image5" class="pull-left text-center" style="width:30px;position: absolute;top:25%;" bind-attr-src="$model.getImageUrl('./img/icons/wodejifen.png')" height="30px"></img>
        <h4 xid="h45" class="pull-right fontColor2" style="position: absolute;top:20%;left:20%;"><![CDATA[我的积分]]></h4></div> </span> 
      <span xid="span17" class="pull-right"></span></span> </div> </div><div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="myDonationRow" style="width:100%;background-color:white;" bind-click="myDonationRowClick">
   <div class="col col-xs-12" xid="col7" style="height:60px;">
    <span xid="span4">
     <span xid="span3" class="pull-left">
      <div xid="div24" class="text text-center">
       <img src="" alt="" xid="image13" class="pull-left text-center" style="width:30px;position: absolute;top:25%;" bind-attr-src="$model.getImageUrl('./img/icons/wodejuanzeng.png')" height="30px"></img>
       <h4 xid="h42" class="pull-right fontColor2" style="position: absolute;top:20%;left:20%;"><![CDATA[我的捐赠]]></h4></div> </span> 
     <span xid="span7" class="pull-right"></span></span> </div> </div><div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="aixinjuanzengRow" style="width:100%;background-color:white;" bind-click="aixinjuanzengRowClick">
    <div class="col col-xs-12" xid="col12" style="height:60px;">
     <span xid="span25">
      <span xid="span19" class="pull-left">
       <div xid="div18" class="text text-center">
        <img src="" alt="" xid="image6" class="pull-left text-center" style="width:30px;position: absolute;top:25%;" bind-attr-src="$model.getImageUrl('./img/icons/aixin.png')" height="30px"></img>
        <h4 xid="h48" class="pull-right fontColor2" style="position: absolute;top:20%;left:20%;"><![CDATA[爱心捐赠]]></h4></div> </span> 
      <span xid="span28" class="pull-right"></span></span> </div> </div>
  <div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="huiyuanzhuceRow" style="width:100%;background-color:white;" bind-click="huiyuanzhuceRowClick">
   <div class="col col-xs-12" xid="col17" style="height:60px;">
    <span xid="span32">
     <span xid="span34" class="pull-left">
      <div xid="div17" class="text text-center">
       <img src="" alt="" xid="image7" class="pull-left text-center" style="width:30px;position: absolute;top:25%;" bind-attr-src="$model.getImageUrl('./img/icons/huiyuanzhuce.png')" height="30px"></img>
       <h4 xid="h410" class="pull-right fontColor2" style="position: absolute;top:20%;left:20%;"><![CDATA[会员注册]]></h4></div> </span> </span> </div> </div>
  <div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="gerenxinxiRow" style="width:100%;background-color:white;" bind-click="gerenxinxiRowClick">
    <div class="col col-xs-12" xid="col5" style="height:60px;">
     <span xid="span1">
      <span xid="span14" class="pull-left">
       <div xid="div9" class="text text-center">
        <img src="" alt="" xid="image5" class="pull-left text-center" style="position: absolute;width:30px;top:25%;" bind-attr-src="$model.getImageUrl('./img/icons/zuixinhuodong.png')" height="30px"></img>
        <h4 xid="h46" class="pull-right fontColor2" style="position: absolute;top:20%;left:20%;"><![CDATA[最新活动]]></h4></div> </span> </span> </div> </div><div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="weiminfengcaiRow" style="width:100%;background-color:white;" bind-click="weiminfengcaiRowClick">
   <div class="col col-xs-12" xid="col13" style="height:60px;">
    <span xid="span35">
     <span xid="span31" class="pull-left">
      <div xid="div19" class="text text-center">
       <img src="" alt="" xid="image7" class="pull-left text-center" style="width:30px;position: absolute;top:25%;" bind-attr-src="$model.getImageUrl('./img/icons/weiminfengcai.png')" height="30px"></img>
       <h4 xid="h49" class="pull-right fontColor2" style="position: absolute;top:20%;left:20%;"><![CDATA[微民风采]]></h4></div> </span> 
     <span xid="span33" class="pull-right"></span></span> </div> </div>
  </div>
  </div>  
        <div class="x-contents-content" xid="ownContent"> 
          <div xid="photoDiv" style="display:none;height:100px;width:100px;border-radius:100px;overflow:hidden;margin:10px auto;position:absolute;left:35%;"> 
            <img alt="" xid="photoImage" height="100%" style="width:100%;" /> 
          <h4 xid="h41" class="text-center " style="color:white;display:none" bind-text="ownContentData.ref('custName')"><![CDATA[]]></h4></div><div xid="div2" class="text-center"><img src="" alt="" xid="image2" class="image-wall img1 img-responsive" style="width:100%;" bind-attr-src="$model.getImageUrl('./img/bg.jpg')"></img></div>  
          <div xid="div1"><div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="row2" style="width:100%;">
   <div class="col col-xs-6 col-spliter-right" xid="jifenCol"><div xid="div12" class="text text-center">
   <img src="" alt="" xid="image9" class="pull-left text-center" style="width:20px;position: absolute;top:10%;left:15%" bind-attr-src="$model.getImageUrl('./img/icons/wodejifen.png')" height="20px"></img><h5 xid="h54" class="fontColor2"><![CDATA[可用积分]]></h5>
  </div>
  <div xid="div11" class="text text-center">
   <h5 xid="h53" class="fontColor3" bind-text="bpCustsData.ref('cumuPoints')"><![CDATA[]]></h5></div></div>
   <div class="col col-xs-6" xid="col3"><div xid="div15" class="text text-center">
   <img src="" alt="" xid="image10" class="pull-left text-center" style="width:20px;position: absolute;top:10%;left:15%" bind-attr-src="$model.getImageUrl('./img/icons/wodejuanzeng.png')" height="20px"></img><h5 xid="h56" class="fontColor2"><![CDATA[已捐赠积分]]></h5>
  </div>
  <div xid="div13" class="text text-center">
   <h5 xid="h55" class="fontColor3" bind-text="bpCustsData.ref('cumuRedPoints')"><![CDATA[]]></h5></div></div></div>
  <div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="row3" style="width:100%;" bind-click="row3Click">
   <div class="col col-xs-12" xid="col4"><span xid="span21">
   <span xid="span20" class="pull-left">
    <div xid="div20" class="text text-left">
     <h5 xid="h59" class="fontColor2" bind-text="bpCustsData.ref('displayName')"><![CDATA[]]></h5></div> 
    <div xid="div21" class="text text-left">
     <h5 xid="h510" class="fontColor3"><![CDATA[点击查看会员个人信息]]></h5></div> </span> 
   <span xid="span18" class="pull-right">
    <div xid="div22" class="text text-center">
     <img src="" alt="" xid="image4" class="text-center" style="width:30px;position: absolute;top:25%;right:5%" bind-attr-src="$model.getImageUrl('./img/icons/erweima.png')" height="30px"></img></div> </span> </span></div>
   </div></div><div xid="div45">
   <div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="rongyuRow" style="width:100%;" bind-click="rongyuRowClick">
    <div class="col col-xs-12" xid="col22" style="height:60px;">
     <span xid="span24">
      <span xid="span22" class="pull-left">
       <div xid="div16" class="text text-center">
        <img src="" alt="" xid="image3" class="pull-left text-center" style="width:30px;position: absolute;top:25%;" bind-attr-src="$model.getImageUrl('./img/icons/rongyuzhengshu.png')" height="30px"></img>
        <h4 xid="h44" class="pull-right fontColor2" style="position: absolute;top:20%;left:20%;"><![CDATA[荣誉证书]]></h4></div> </span> 
      <span xid="span23" class="pull-right"></span></span> </div> </div> 
   <div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="xingjiRow" style="width:100%;background-color:white;" bind-click="xingjiRowClick">
   <div class="col col-xs-12" xid="col11" style="height:60px;">
    <span xid="span30">
     <span xid="span26" class="pull-left">
      <div xid="div14" class="text text-center">
       <img src="" alt="" xid="image12" class="pull-left text-center" style="width:30px;position: absolute;top:25%;" bind-attr-src="$model.getImageUrl('./img/icons/wodejuanzeng.png')" height="30px"></img>
       <h4 xid="h47" class="pull-right fontColor2" style="position: absolute;top:20%;left:20%;"><![CDATA[我的捐赠]]></h4></div> </span> </span> </div> </div><div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="personInfoRow" style="width:100%;" bind-click="personInfoRowClick">
    <div class="col col-xs-12" xid="col6" style="height:60px;">
     <span xid="span29">
      <span xid="span27" class="pull-left">
       <div xid="div23" class="text text-center">
        <img src="" alt="" xid="image3" class="pull-left text-center" style="width:30px;position: absolute;top:25%;" bind-attr-src="$model.getImageUrl('./img/icons/gerenxinxi.png')" height="30px"></img>
        <h4 xid="h43" class="pull-right fontColor2" style="position: absolute;top:20%;left:20%;"><![CDATA[ WEI民卡金融功能]]></h4></div> </span> </span> </div> </div> 
  </div></div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified"
        tabbed="true" xid="buttonGroup1" selected="foodBtn"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top"
          label="爱心捐赠" xid="foodBtn" icon="icon-heart" target="goodsContent"> 
          <i xid="i5" class="icon-beer icon-heart"/>  
          <span xid="span6">爱心捐赠</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top"
          label="服务" xid="orderBtn" icon="icon-grid" target="serviceContent" onClick="orderBtnClick"> 
          <i xid="i7" class="icon-grid"/>  
          <span xid="span8">服务</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top"
          label="WEI民会员" xid="ownBtn" icon="icon-android-contacts" target="ownContent" onClick="ownBtnClick"> 
          <i xid="i8" class="icon-android-contacts"/>  
          <span xid="span9">WEI民会员</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
