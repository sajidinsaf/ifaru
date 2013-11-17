<%@ page language="java"%>
<%@page import='com.ifaru.gallery.*'%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %> 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<td colspan=11>
  
<br>
<br>
  <table>
    <session:existsAttribute name="galleryKey">
       <jsp:useBean id="tr" scope="page" class="com.ifaru.html.util.ConditionalHtmlTableRow"/>
       <jsp:setProperty name="tr" property="count" value="7"/>
       <jsp:setProperty name="tr" property="hAlign" value="center"/>
       <logic:iterate id="picture" name="galleryKey" property="pictures" type="com.ifaru.gallery.Picture">
          <jsp:getProperty name="tr" property="startTableRowTag"/>
            <td>
               <html:link forward="galleryPicture" paramId="id" paramName="picture" paramProperty="id">
                 <bean:define id="thSrc" name="picture" property="image.thumbnail" type="java.lang.String"/>
                 <html:img src="<%= thSrc %>" height="100" width="110" border="1"/> 
               </html:link>
            </td>
          <jsp:getProperty name="tr" property="endTableRowTag"/>
       </logic:iterate>
    </session:existsAttribute>
  </table>
</td>