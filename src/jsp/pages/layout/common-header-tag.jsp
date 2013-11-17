<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<script language="JavaScript1.1"> 
<!--
var debug = true; 
function protectRightClick(e) { 
  if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2)) {
    return false; 
  }
  else if (navigator.appName == 'Microsoft Internet Explorer' && (event.button == 2 || event.button == 3)) { 
    alert('The content on this site is protected by the iFaru User Agreement!'); 
    return false; 
  } 
    return true; 
  } 
  document.onmousedown=protectRightClick; 
  if (document.layers) {
     window.captureEvents(Event.MOUSEDOWN); 
     window.onmousedown=protectRightClick; 
  }
 }  
  
//-->
</script>

 
  <link rel="stylesheet" type="text/css" href="/ifaru/css/niftyCorners.css">
  <link rel="stylesheet" type="text/css" href="/ifaru/css/niftyPrint.css" media="print">
  
<script type="text/javascript" src="/ifaru/css/niftycube.js"></script>

<script type="text/javascript">
<!--
  window.onload=function(){
<%---    Nifty("div#navigation", "transparent"); --%>    
    Nifty("div#container");       
    Nifty("div#header,div#footer","small");  
    Nifty("div#content,div#navigation,div#rightbar","same-height small");
    Nifty("div#brandmenu","transparent"); 
    Nifty("div#searchbar","transparent");     
    Nifty("div#chequebox","transparent");     
    Nifty("tr#nav a","small transparent");    
    Nifty("tr#cat a","small transparent");  
    Nifty("tr#bat a","small transparent");      
       
  }
  

//-->
</script>      


<script type="text/javascript">
<!--
  function showMenu(id) {
    <%-- comment out the next two lines if you want collapsable menus --%>
    document.getElementById(id).style.display = "block";
    return true;
    
    <bean:define id="menufolded" value="true" toScope="session"/>
    if (document.getElementById) {     
      if (document.getElementById(id).style.display == "none") {
        document.getElementById(id).style.display = "block";
      } else {
        <%-- set the display value of the category the user is browsing --%>
        document.getElementById(id).style.display = "none";
      }     
      return false;
    } else {
      return true;
    }
  } 
  //-->   
</script> 

<script language = "Javascript">
/**
 * DHTML email validation script. Courtesy of SmartWebby.com (http://www.smartwebby.com/dhtml/)
 */

function echeck(str) {

    var at="@";
    var dot=".";
    var lat=str.indexOf(at);
    var lstr=str.length;
    var ldot=str.indexOf(dot);
    var msg="E-mail ID must be like: acb@xyz.com";
    if (str.indexOf(at)==-1){
       alert(msg);
       return false;
    }

    if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
       alert(msg);
       return false;
    }

    if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
        alert(msg);
        return false;
    }

     if (str.indexOf(at,(lat+1))!=-1){
        alert(msg);
        return false;
     }

     if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
        alert(msg);
        return false;
     }

     if (str.indexOf(dot,(lat+2))==-1){
        alert(msg);
        return false;
     }
    
     if (str.indexOf(" ")!=-1){
        alert(msg);
        return false;
     }

     return true          
  }

function emailIfValid(form, emailElement){
  var origVal = emailElement.value;
  if ((emailElement.value==null)||(emailElement.value=="")){
    alert("Please Enter your Email ID");
    emailElement.focus();
    return false;
  }
  if (echeck(emailElement.value)==false){
    emailElement.value=origVal;
    emailElement.focus();
    return false;
  }
 }
</script>  

<script>

   function disableShipping(checkBox, form) {
     if (checkBox.value == "ON")
     {
     alert(form.name);
        document.getElementByName('shipTitle').readonly="true";
        document.getElementByName('shipFirstName').readonly="true";
        document.getElementByName('shipLastName').readonly="true";
        document.getElementByName('shipAddrLine1').readonly="true";
        document.getElementByName('shipAddrLine2').readonly="true";
        document.getElementByName('shipAddrLine3').readonly="true";
        document.getElementByName('shipCity').readonly="true";
        document.getElementByName('shipPostCode').readonly="true";
        document.getElementByName('shipCounty').readonly="true";
        document.getElementByName('shipCountry').readonly="true";
        document.getElementByName('shipEmail').readonly="true";
        document.getElementByName('shipHomePhone').readonly="true";
        document.getElementByName('shipWorkPhone').readonly="true";
        document.getElementByName('shipMobilePhone').readonly="true";       
     } else {
        document.getElementByName('shipTitle').readonly="false";
        document.getElementByName('shipFirstName').readonly="false";
        document.getElementByName('shipLastName').readonly="false";
        document.getElementByName('shipAddrLine1').readonly="false";
        document.getElementByName('shipAddrLine2').readonly="false";
        document.getElementByName('shipAddrLine3').readonly="false";
        document.getElementByName('shipCity').readonly="false";
        document.getElementByName('shipPostCode').readonly="false";
        document.getElementByName('shipCounty').readonly="false";
        document.getElementByName('shipCountry').readonly="false";
        document.getElementByName('shipEmail').readonly="false";
        document.getElementByName('shipHomePhone').readonly="false";
        document.getElementByName('shipWorkPhone').readonly="false";
        document.getElementByName('shipMobilePhone').readonly="false";     
     }
     return true;
   }

</script>

 <jsp:include page="/pages/inc/common/table/header.jsp" flush="true" />
    
        