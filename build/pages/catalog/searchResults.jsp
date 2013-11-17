<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<span class="EmptyListMessage">
  <logic:notEmpty name="catalogItemsKey" property="items">
    <jsp:useBean id="catalogItemsKey" scope="session" class="com.ifaru.catalog.CatalogItems"/>
    <bean:define id="items" name="catalogItemsKey" property="items" type="java.util.ArrayList"/>
    <bean:size id="listSize" name="items"/>   
  </logic:notEmpty>     

   <session:existsAttribute name="brandSearch">
     <bean:define id="brandName" name="brandSearch" scope="session"/>
     
     <logic:empty name="catalogItemsKey" property="items">
         Your search for brand <STRONG><bean:write name="brandName"/></STRONG> returned <STRONG>no</STRONG> items
     </logic:empty> 
     
     <logic:notEmpty name="catalogItemsKey" property="items">
       Your search for brand <STRONG><bean:write name="brandName"/></STRONG> returned <STRONG><bean:write name="listSize"/></STRONG> items     
     </logic:notEmpty>                
   </session:existsAttribute> 
   
   <session:existsAttribute name="categorySearch">
     <bean:define id="categoryName" name="categorySearch"/>
     <logic:empty name="catalogItemsKey" property="items">
         Your search for category <STRONG><bean:write name="categoryName"/></STRONG> returned <STRONG>no</STRONG> items
     </logic:empty> 
     
     <logic:notEmpty name="catalogItemsKey" property="items">
       Your search for category <STRONG><bean:write name="categoryName"/></STRONG> returned <STRONG><bean:write name="listSize"/></STRONG> items     
     </logic:notEmpty>             
   </session:existsAttribute>
   
   <session:existsAttribute name="keywordSearch">
     <bean:define id="keywords" name="keywordSearch"/>
     <logic:empty name="catalogItemsKey" property="items">
         Your search for <STRONG><bean:write name="keywords"/></STRONG> returned <STRONG>no</STRONG> items
     </logic:empty> 
     
     <logic:notEmpty name="catalogItemsKey" property="items">
       Your search for <STRONG><bean:write name="keywords"/></STRONG> returned <STRONG><bean:write name="listSize"/></STRONG> items     
     </logic:notEmpty>         
   </session:existsAttribute>    
     
   <logic:present parameter="startsWithAlphabet">
     <bean:parameter id="alphabet" name="startsWithAlphabet"/>
     <logic:notEqual name="alphabet" value="All">
       <logic:empty name="catalogItemsKey" property="items">
           Your search for item names starting with <STRONG><bean:write name="alphabet"/></STRONG> returned <STRONG>no</STRONG> items
       </logic:empty> 
       
       <logic:notEmpty name="catalogItemsKey" property="items">
         Your search for item names starting with <STRONG><bean:write name="alphabet"/></STRONG> returned <STRONG><bean:write name="listSize"/></STRONG> items     
       </logic:notEmpty>     
     </logic:notEqual>     
   </logic:present>         
  
</span>