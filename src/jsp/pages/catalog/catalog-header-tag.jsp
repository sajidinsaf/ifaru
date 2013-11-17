<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
    
 <jsp:include page="/pages/layout/common-header-tag.jsp" flush="true" />

 <script language="Javascript1.1">
<!--
   <session:existsAttribute name="catalogItemsKey">
 
     <logic:notEmpty name="catalogItemsKey" property="items">
       <jsp:useBean id="catalogItemsKey" scope="session" class="com.ifaru.catalog.CatalogItems"/>

       <bean:define id="items" name="catalogItemsKey" property="items" type="java.util.ArrayList"/>
       <bean:size id="listSize" name="items"/>
       
       sizeIdToPriceIdMapping = new Array(<bean:write name="listSize"/>);
       priceIdToPriceList = new Array();
       
       <logic:iterate id="item" name="items" indexId="ctr">
          sizeIdToPriceIdMapping["<bean:write name='item' property='id'/>"] = ["<bean:write name='item' property='priceFieldId'/>"];
          priceIdToPriceList["<bean:write name='item' property='priceFieldId'/>"] = [<logic:iterate id="size" name="item" property="sizes" indexId="pCtr"><logic:notEqual name="pCtr" value="0">,</logic:notEqual>"<bean:write name='size' property='salePriceAsCurrency'/>"</logic:iterate>];
       </logic:iterate>       
       
        function setSalePrice(size) {
          selectedId = size.id;       
          priceIdArray = sizeIdToPriceIdMapping[selectedId];           
          var priceId = priceIdArray[0];
          pList = priceIdToPriceList[priceId];        
          idx = size.selectedIndex;          
          price = pList[idx];
          priceField = document.getElementById(priceId);    
          priceField.value = price;
        }     

     </logic:notEmpty>
   </session:existsAttribute>
 
//-->
</script>     

  