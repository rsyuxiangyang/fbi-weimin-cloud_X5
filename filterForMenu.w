<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"/> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="myPointsDialog" src="$UI/takeout/myPointsForMenu.w"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="myDonationDialog" src="$UI/takeout/myDonationForMenu.w"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="loginBindDialog" src="$UI/takeout/registrationForMenu.w" onReceive="loginBindDialogReceive"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="registrationCheckDialog" src="$UI/takeout/registrationCheckForMenu.w"></span></div>