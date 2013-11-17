<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
    
 <jsp:include page="/pages/layout/common-header-tag.jsp" flush="true" />

<SCRIPT language="JavaScript">
  <!--

  function IsGreaterThanFive(strString) {
     //  check for valid numeric strings  
  
     var strValidChars = "0123456789-";
     var strChar;
     var blnResult = true;
  
     if (strString.length == 0) return false;
  
     //  test strString consists of valid characters listed above
     for (i = 0; i < strString.length && blnResult == true; i++) {
        strChar = strString.charAt(i);
        if (strValidChars.indexOf(strChar) == -1) {
           blnResult = false;
        }
     }
     if (strString > 5) {
       blnResult = false;
     }
     return blnResult;
  }
   
  function validateQuantity(qtyField, name) {
     if (qtyField.value.length == 0) {
       alert("Please enter a value for " + name);
     } else if (IsGreaterThanFive(qtyField.value) == false) {
       alert(qtyField.value + " is invalid. Please enter a value from 0 to 5 without any decimals.");
     }
   }
   
  // -->
</SCRIPT>

        