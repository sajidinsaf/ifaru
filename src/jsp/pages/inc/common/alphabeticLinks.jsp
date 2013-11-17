<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

  <jsp:useBean id="aLinks" class="com.ifaru.html.util.AlphabeticLinks"/>
  <jsp:setProperty name="aLinks" property="href"/>
          <span style="font-family:Arial,Verdana,Courier New;font-size:12px;font-weight:bold">iFaru: A to Z<span>:<br>
       <logic:iterate id="tag" name="aLinks" property="alphabetsLink" type="com.ifaru.html.util.HtmlAnchorTag">
         <span style="font-family:Arial,Verdana,Courier New;font-size:11px;font-weight:normal;color:#333333"> <jsp:getProperty name="tag" property="html"/></span>
       </logic:iterate>
       