<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>


  <logic:present name="shoppingCart" scope="session">
    <logic:notEmpty name="shoppingCart" property="items">
     <html:form action="/user/UserAction">    
       <html:image src="/ifaru/images/pages/layout/tn_cart.jpg" styleClass="CartButton" border="0" property="" value="viewCart" alt="Cart" title="View Shopping Cart"></html:image>
     </html:form>     
    </logic:notEmpty>     
  </logic:present>
<%--  
  <html:form action="/user/UserAction">
    <html:submit property="login" value="Login/Register" title="Login/Regsiter at iFaru"></html:submit>
  </html:form>    
--%>
