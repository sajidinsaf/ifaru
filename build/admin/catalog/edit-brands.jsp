<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
    
     <logic:notPresent name="adminCatalogKey" scope="session">
     <span style="color:red">This is an invalid entry path. <br> Please click <a href="/ifaru/admin/Welcome.do">here</a> to go to the login page</span>
  </logic:notPresent>
       
   <session:existsAttribute name="adminCatalogKey">

      <logic:notEmpty name="adminCatalogKey" property="items">
      
        <jsp:useBean id="adminCatalogKey" scope="session" class="com.ifaru.catalog.CatalogItems"/>
        <bean:define id="items" name="adminCatalogKey" property="brands" type="java.util.ArrayList"/>
        <bean:size id="listSize" name="items"/>           
        <bean:parameter id="pageSize" name="pageSize" value="10000"/>     
        <bean:parameter id="pageBeginParam" name="pageBegin" value="0"/>
        <c:set var="pageSize" value="${pageSize}"/>
        <c:set var="pageBegin" value="${pageBeginParam}"/>
        <c:set var="pageEnd" value="${pageBegin + pageSize - 1}"/> 

            <table class="CatalogTable" border="0" cellpadding="0" cellspacing="1">
               <th class="CatalogTableHeader">Id</th>            
               <th class="CatalogTableHeader">Name</th>
               <th class="CatalogTableHeader">Keywords(Separate With Comma)</th>
               <th class="CatalogTableHeader"></th>
               <% int count=-1; %>
               <c:forEach var="item" items="${items}" varStatus="loop" begin="${pageBegin}" end="${pageEnd}">
                  <html:form action="/admin/EditBrand">
                     <bean:define id="trclass" value="#DDDDDD"/>
                     <c:if test="${loop.count % 2 == 0}">
                       <bean:define id="trclass" value="#FFFFFF"/>
                     </c:if>
                     <tr style="background-color: <bean:write name='trclass'/>">
                       <td style="padding:0px 2px 0px 4px;font-weight:bold"> 
                         <input type="text" id="id" name="id" value="<bean:write name='item' property='id'/>" size="3"  readonly="true"/>
                       </td>                     
                       <td style="padding:0px 2px 0px 4px;font-weight:bold"> 
                         <input type="text" id="name" name="name" value="<bean:write name='item' property='name'/>" size="18" />
                       </td>
                       <td style="padding: 2px 2px 2px 2px;">
                         <input type="text" id="keywords" name="keywords" value="<bean:write name='item' property='keywords'/>" size="100" />
                       </td>

                      <td>
                         <html:submit styleClass="AddToCartButton" property="save" value="Save" alt="Save"/>
                       </td>                
                     </tr>
                 </html:form>
              </c:forEach>                 
            
            </table>

   
        <br/>     
      </logic:notEmpty>
   </session:existsAttribute>
