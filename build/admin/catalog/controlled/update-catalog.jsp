<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/curtag.tld" prefix="set" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<div style="margin-left:10%" id="chequebox">

<logic:present name="catalogUpdateFailure" scope="session">
  <span style="color:red">Catalog update failed: <bean:write name="catalogUpdateFailure"/></span>
</logic:present>
<logic:present name="catalogUpdateSuccess" scope="session">
  <span style="color:green">Catalog update succeeded: <bean:write name="catalogUpdateSuccess"/></span>
</logic:present>

</div>
