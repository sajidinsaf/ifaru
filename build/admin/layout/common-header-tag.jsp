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

<style type="text/css" media="all">     
      @import url("/ifaru/CommonAdmin.css");
</style>
        