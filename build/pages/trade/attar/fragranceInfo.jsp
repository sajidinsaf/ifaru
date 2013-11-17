<%@ page language="java" %>
<%@page import='ifaru.cart.*'%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>


<html>
  <head>
	 <jsp:include page="/pages/layout/common-header-tag.jsp" flush="true" />
  </head>
  <body STYLE="background-image: url('/ifaru/images/pages/trade/attar/peachroseBackground.jpg'); border: 2 ridge #800000" border=0>
    <session:existsAttribute name="fragrance">
      <table>
        <tr><td align="center"><h2><span align="center" style="font:27px/30px Verdana; font-weight: bold; text-transform: capitalize; text-decoration: underline; color:#7D053F;"><bean:write name="fragrance" property="name"/></span><h2></td></tr>
        <tr>
          <td align="center">    
      	       <bean:define id="iSrc" name="fragrance" property="image.src" type="java.lang.String"/>
               <html:img src="<%= iSrc %>" height="150" width="170" border="1"/>             
          </td>
        </tr>
        <logic:notEmpty name="fragrance" property="information">
          <logic:notEmpty name="fragrance" property="information.infoLines">

            <logic:iterate id="line" name="fragrance" property="information.infoLines" type="com.ifaru.data.xml.fragrance.InfoLine">
              <tr>
                <td><span style="<%= line.getStyle() %>"><bean:write name="line" property="text"/></span></td>
              </tr>
            </logic:iterate>
          </logic:notEmpty>
        </logic:notEmpty>    
  
	      <logic:notEmpty name="fragrance" property="information">
	        <logic:empty name="fragrance" property="information.infoLines">  
	          <br> <br>
	          <tr>
	            <td>
	              <span class="gentext"> 
	                For more information about this fragrance please write to <html:link styleClass="gentext" href="mailto:contact@ifaru.com">contact@ifaru.com</html:link> <br>
	              </span>
	            </td>
	          </tr>
	        </logic:empty>
	      </logic:notEmpty>

	      <logic:empty name="fragrance" property="information"> 
	        <br>
	        <br>
	        <tr><td><span class="gentext"> For more information about this fragrance please write to <html:link styleClass="gentext" href="mailto:contact@ifaru.com">contact@ifaru.com</html:link><br></span></td></tr>
	      </logic:empty>  
     </table>  
    </session:existsAttribute>
  </body>
</html>