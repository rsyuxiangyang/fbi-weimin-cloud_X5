<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:m;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:250px;top:343px;"><div component="$UI/system/components/justep/data/data" autoLoad="false" xid="donationDtlData" idColumn="txnSn" limit="100" onCustomRefresh="donationDtlDataCustomRefresh">
   <column label="txnSn" name="txnSn" type="String" xid="column4"></column>
  <column label="createTime" name="createTime" type="String" xid="column5"></column>
  <column label="billNo" name="billNo" type="String" xid="column1"></column>
  <column label="goodsId" name="goodsId" type="String" xid="column2"></column>
  <column label="goodsName" name="goodsName" type="String" xid="column3"></column>
  <column label="points" name="points" type="String" xid="xid6"></column>
  <column label="qty" name="qty" type="String" xid="xid7"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        title="我的捐赠"> 
        <div class="x-titlebar-left text-muted"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="搜索" xid="backBtn" icon="icon-chevron-left" onClick="backBtnClick"> 
            <i xid="i6" class="icon-chevron-left"/>  
            <span xid="span6">搜索</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title">我的捐赠</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards x-scroll-view" style="bottom: 0px;" xid="C6EB65157F20000133E0EA73F9D75430"> 
      
  
  
  <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView2">
    <div class="x-content-center x-pull-down container" xid="div3">
   <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"></i>
   <span class="x-pull-down-label" xid="span2">下拉刷新...</span></div><div class="x-scroll-content" xid="div5">
    <div component="$UI/system/components/bootstrap/row/row" class="row clearfix center-block  table-bordered x-fill" xid="jifenRow" style="width:100%;background-color:#00c160;display:none">
   <div class="col col-xs-12" xid="col10" style="height:60px;">
    
  
  <div xid="div2" style="position:relative;top:20px" class="pull-left"><img src="" alt="" xid="image3" height="30px" style="width:30px;"></img><span xid="span1" style="font-size:20px;color:white"><![CDATA[累计捐赠次数]]></span></div>
  <div xid="div4" style="width:50%;" class="pull-right"><h1 xid="h11" style="font-size:40px;position:relative;top:0px"><![CDATA[]]></h1></div></div> 
  </div><div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="donationList" data="donationDtlData" limit="100" autoLoad="true">
     <ul class="x-list-template list-group" xid="pointsDetaillistTemplateUl1">
      <li xid="li1" class="list-group-item">
       
  <div class="media" xid="donationDiv">
   
   <div class="media-body" xid="div15">
    <div component="$UI/system/components/justep/output/output" class="x-output list-group-item-heading" xid="output1" bind-ref="ref('goodsName')" style="font-size:18px;font-weight:bold；position:relative;left:2px;top:1px"></div><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-7" xid="col2">
    <h5 xid="h54" class="pull-left" style="color:black"><![CDATA[捐赠数量:]]></h5><div component="$UI/system/components/justep/output/output" class="x-output pull-right list-group-item-text" xid="output7" bind-ref="ref('qty')" style="position:relative;top:5px"></div>
  </div> 
   <div class="col col-xs-5" xid="col1">
    <h5 xid="h55" class="pull-left" style="color:black"><![CDATA[所扣积分:]]></h5><div component="$UI/system/components/justep/output/output" class="x-output pull-right list-group-item-text" xid="output6" bind-ref="ref('points')" style="position:relative;top:5px"></div>
  </div> </div><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row13">
     <div class="col col-xs-12" xid="col18">
      <h5 xid="h56" class="pull-left" style="color:black"><![CDATA[捐赠时间:]]></h5><div component="$UI/system/components/justep/output/output" class="x-output list-group-item-text" xid="output5" bind-ref="ref('createTime')" style="position:relative;top:5px"></div>
  </div> 
     </div> 
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2">
   
   <div class="col col-xs-12 " xid="col3">
    <h5 xid="h52" class="pull-left text-right" style="color:black"><![CDATA[流水号:]]></h5>
    <div component="$UI/system/components/justep/output/output" class="x-output list-group-item-text" xid="output2" bind-ref="ref('billNo')" style="position:relative;top:5px"></div></div> </div></div> </div></li> </ul> </div>
  <div xid="nodataDiv" class="text-center" style="display:none">
   <img src="" alt="" xid="image2" class="image-wall img1 img-responsive" style="width:100%;background-color:#E8E8E8" bind-attr-src="$model.getImageUrl('./img/donationNodata.png')"></img></div>
  
  
  </div> 
   <div class="x-content-center x-pull-up" xid="div6">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i12" /> 
    <span class="x-pull-up-label" xid="span5">加载更多...</span></div> 
  </div></div>  
    </div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="myDonationReceiver" style="left:61px;top:11px;" onReceive="myDonationReceiverReceive"></span></div>
