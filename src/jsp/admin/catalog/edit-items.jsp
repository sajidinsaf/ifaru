<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/curtag.tld" prefix="set" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>


  <logic:notPresent name="adminCatalogKey" scope="session">
     <span style="color:red">This is an invalid entry path. <br> Please click <a href="/ifaru/admin/Welcome.do">here</a> to go to the login page</span>
  </logic:notPresent>
  
  <session:existsAttribute name="adminCatalogKey">
     <br>
		<span style="text-align:center;font-size:14px;font-family:Arial;font-weight:bold">Welcome Administrator. Edit Items</span>
     <br>
     <jsp:include page="/admin/catalog/display-edit-items.jsp" flush="true"/>
  </session:existsAttribute>
