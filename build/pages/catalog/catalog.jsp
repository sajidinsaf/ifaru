<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
        
   <session:existsAttribute name="catalogItemsKey">

      <jsp:include page="/pages/catalog/searchResults.jsp" flush="true"/>
     
      <logic:notEmpty name="catalogItemsKey" property="items">
      
        <jsp:useBean id="catalogItemsKey" scope="session" class="com.ifaru.catalog.CatalogItems"/>
        <bean:define id="items" name="catalogItemsKey" property="items" type="java.util.ArrayList"/>
        <bean:size id="listSize" name="items"/>           
        <bean:parameter id="pageSize" name="pageSize" value="10"/>     
        <bean:parameter id="pageBeginParam" name="pageBegin" value="0"/>
        <c:set var="pageSize" value="${pageSize}"/>
        <c:set var="pageBegin" value="${pageBeginParam}"/>
        <c:set var="pageEnd" value="${pageBegin + pageSize - 1}"/> 

            <table class="CatalogTable" border="0" cellpadding="0" cellspacing="1">
               <th class="CatalogTableHeader"></th>
               <th class="CatalogTableHeader">Name</th>
               <th class="CatalogTableHeader">Description</th>
               <th class="CatalogTableHeader">Size</th>
               <th class="CatalogTableHeader">Price(GBP)</th>
               <th class="CatalogTableHeader">Quantity</th>             
               <th class="CatalogTableHeader"></th>
               <th class="CatalogTableHeader"></th>
               <% int count=-1; %>
               <c:forEach var="item" items="${items}" varStatus="loop" begin="${pageBegin}" end="${pageEnd}">
               <%-- No need to check whether the item is enabled. This page expects that those items will not be passed to it in the first place --%>
                  <% ++count; %>
                  <html:form action="/catalog/AddToCart">
                     <bean:define id="trclass" value="#DDDDDD"/>
                     <c:if test="${loop.count % 2 == 0}">
                       <bean:define id="trclass" value="#FFFFFF"/>
                     </c:if>
                     <html:hidden name="item" property="id"/>
                     <tr style="background-color: <bean:write name='trclass'/>">
                        <bean:define id="thSrc" name="item" property="image.thumbnail" type="java.lang.String"/>
                        <bean:define id="infoUrl" name="item" property="information.url" type="java.lang.String"/>
                       <td style="padding: 2px 2px 2px 2px;">
                                              
                       <a href="<c:url value='/catalog/GetItem.do'><c:param name='itemHtmlInfoUrl' value='${infoUrl}'/><c:param name='itemPriceFieldId' value='${item.priceFieldId}'/><c:param name="pageSize" value='${pageSize}'/><c:param name='pageEnd' value='${pageEnd}'/><c:param name='pageBegin' value='${pageBegin}'/></c:url>">
                         <image src="<%= thSrc %>" align="center" border="1"/> 
                       </a>
                       </td>                     
                       
                       <td style="padding:0px 2px 0px 4px;font-weight:bold"> 
                        <a style="text-decoration:none" href="<c:url value='/catalog/GetItem.do'><c:param name='itemHtmlInfoUrl' value='${infoUrl}'/><c:param name='itemPriceFieldId' value='${item.priceFieldId}'/><c:param name="pageSize" value='${pageSize}'/><c:param name='pageEnd' value='${pageEnd}'/><c:param name='pageBegin' value='${pageBegin}'/></c:url>">
                          <c:out value="${item.name}"/> 
                        </a>
                       </td>
                       
                       <td style="padding:0px 2px 0px 5px;">
                         <a style="text-decoration:none" href="<c:url value='/catalog/GetItem.do'><c:param name='itemHtmlInfoUrl' value='${infoUrl}'/><c:param name='itemPriceFieldId' value='${item.priceFieldId}'/><c:param name="pageSize" value='${pageSize}'/><c:param name='pageEnd' value='${pageEnd}'/><c:param name='pageBegin' value='${pageBegin}'/></c:url>">                       
                           <c:out value="${item.description}"/> 
                         </a>
                       </td>

                       <bean:define id="sizes" name="item" property="sizes" type="java.util.List"/>
                       <bean:size id="numberOfSizes" name="sizes"/>
                       <td> 
                          <logic:greaterThan name="numberOfSizes" value="1">
                            <select name="size" onchange="setSalePrice(this);" id="<bean:write name='item' property='id'/>">
                              <logic:iterate id="size" name="sizes">
                                 <option value="<bean:write name='size' property='size'/>"><bean:write name="size" property="sizeLabel"/></option>
                              </logic:iterate>
                            </select>
                          </logic:greaterThan>
                          <logic:equal name="numberOfSizes" value="1">
                            <bean:define id="size" name="item" property="sizes[0]"/>
                            <input name="size" size="6" type="text" value="<bean:write name='size' property='sizeLabel'/>" readonly="true"/>
                          </logic:equal>
                       </td>    
                       
                       <td align="right">
                         </%-- The priceFieldId is worked out by the javascript in the header tag for this page 
                           This id is used to determine selected the size of the item.
                         --%>
                         <input type="text" id="<bean:write name='item' property='priceFieldId'/>" name="<bean:write name='item' property='priceFieldId'/>" value="<bean:write name='item' property='sizes[0].salePriceAsCurrency'/>" readonly="true" size="3" style="text-align:right"/>                     
                       </td>
                       <td align="right">
                          <select name="quantity">
                            <c:forEach var="n" begin="1" end="5" >
                              <option value="<c:out value='${n}'/>"><c:out value="${n}"/></option> 
                            </c:forEach>
                          </select>
                       </td>
                       <td>
                         <html:submit styleClass="AddToCartButton" property="addtocart" value="Add To Cart" alt="Add To Cart"/>
                       </td>
                       <td style="padding:0px 2px 0px 4px;">
                        <a href="<c:url value='/catalog/GetItem.do'><c:param name='itemHtmlInfoUrl' value='${infoUrl}'/><c:param name='itemPriceFieldId' value='${item.priceFieldId}'/><c:param name="pageSize" value='${pageSize}'/><c:param name='pageEnd' value='${pageEnd}'/><c:param name='pageBegin' value='${pageBegin}'/></c:url>">
                           More Info 
                         </a> 
                        <br>
                       </td>                
                     </tr>
                 </html:form>
              </c:forEach>                 
            
            </table>
  
        <table>
          <tr>
          <td>
            <span style="font-family:Arial;font-size:10pt;font-weight:bold">Items per page:</span>
            <form method="POST" name="selectPageSize" action="/ifaru/catalog/ItemList.do">
              <input type="hidden" name="pageBegin" value="<c:out value='${pageBegin}'/>"/>
              <input type="hidden" name="pageEnd" value="<c:out value='${pageEnd}'/>"/>        
              <select name="pageSize" onchange="document.selectPageSize.submit();">
                <logic:equal name="pageSize" value="10">
                  <option selected="true" value="10">10</option>
                </logic:equal>
                <logic:notEqual name="pageSize" value="10">
                  <option value="10">10</option>
                </logic:notEqual>      
                <logic:equal name="pageSize" value="25">
                  <option selected="true" value="25">25</option>
                </logic:equal>
                <logic:notEqual name="pageSize" value="25">
                  <option value="25">25</option>
                </logic:notEqual>   
                <logic:equal name="pageSize" value="50">
                  <option selected="true" value="50">50</option>
                </logic:equal>
                <logic:notEqual name="pageSize" value="50">
                  <option value="50">50</option>
                </logic:notEqual> 
                <logic:equal name="pageSize" value="100">
                  <option selected="true" value="100">100</option>
                </logic:equal>
                <logic:notEqual name="pageSize" value="100">
                  <option value="100">100</option>
                </logic:notEqual>  
              </select>
            </form>
        </td>
        
        <td style="padding-left:300">   
            <c:if test="${pageBegin gt 0}">
              <a href="<c:url value="/catalog/ItemList.do"><c:param name="pageSize" value="${pageSize}"/><c:param name="pageEnd" value="${pageEnd}"/> <c:param name="pageBegin" value="${pageBegin - pageSize}"/></c:url>"><span class="CommonServicesButton">Previous</span></a>
            </c:if>
            &nbsp;
            <c:if test="${pageEnd lt (listSize-1)}">
               <a href="<c:url value="/catalog/ItemList.do"><c:param name="pageSize" value="${pageSize}"/><c:param name="pageEnd" value="${pageEnd}"/><c:param name="pageBegin" value="${pageBegin + pageSize}"/></c:url>"><span class="CommonServicesButton">Next</span></a>
            </c:if>
         </td>
            
        </tr>
        </table>
  
   
        <br/>     
      </logic:notEmpty>
   </session:existsAttribute>
