<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

   <session:existsAttribute name="catalogItemKey">
     <bean:define id="item" name="catalogItemKey" type="com.ifaru.catalog.CatalogItem"/>
     <div style="margin-bottom:4;font-family:Arial, Verdana, Sans serif;font-size:12px;font-style:none;font-weight:normal;border:thin solid #333333">
       <table>
         <tr>
           <td style="text-align:center;padding: 2px 2px 2px 2px;">
             <bean:define id="thSrc" name="item" property="image.src" type="java.lang.String"/>
             <image src="<%= thSrc %>" align="center" border="0"/>
           </td>
           <td style="text-align:center;padding: 2px 2px 2px 40px;">
             <jsp:include page="catalogitem-form.jsp" flush="true"/>
           </td>
         </tr>
       </table>
     </div>
     <bean:parameter id="itemInfoUrl" name="itemHtmlInfoUrl"/>
     <div style="margin-bottom:4;font-family:Arial, Verdana, Sans serif;font-size:12px;font-style:none;font-weight:normal;border:thin solid #333333">
       <jsp:include page="<%= itemInfoUrl %>" flush="true"/>
    </div>   
     <div align="center" style="padding:4 1 4 1;font-family:Arial, Verdana, Sans serif;font-size:12px;font-style:none;font-weight:normal;border:none">
       <%-- <jsp:include page="catalogitem-form.jsp" flush="true"/> --%>   
       
       <span style="margin-left:60%">
         <bean:parameter id="pageSize" name="pageSize"/>
         <bean:parameter id="pageBegin" name="pageBegin"/>   
         <bean:parameter id="pageEnd" name="pageEnd"/>
         <a href="<c:url value="/catalog/ItemList.do"><c:param name="pageSize" value="${pageSize}"/><c:param name="pageEnd" value="${pageEnd}"/> <c:param name="pageBegin" value="${pageBegin}"/></c:url>"><span class="CommonServicesButton">Back To Item List</span></a>
       </span>       
                
     </div>     
   </session:existsAttribute>