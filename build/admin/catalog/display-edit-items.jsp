<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
        
   <session:existsAttribute name="adminCatalogKey">

      <logic:notEmpty name="adminCatalogKey" property="items">
      
        <jsp:useBean id="adminCatalogKey" scope="session" class="com.ifaru.catalog.CatalogItems"/>
        <bean:define id="items" name="adminCatalogKey" property="items" type="java.util.ArrayList"/>
        <bean:size id="listSize" name="items"/>           
        <bean:parameter id="pageSize" name="pageSize" value="10000"/>     
        <bean:parameter id="pageBeginParam" name="pageBegin" value="0"/>
        <c:set var="pageSize" value="${pageSize}"/>
        <c:set var="pageBegin" value="${pageBeginParam}"/>
        <c:set var="pageEnd" value="${pageBegin + pageSize - 1}"/> 

            <table class="CatalogTable" border="0" cellpadding="0" cellspacing="1">
               <th class="CatalogTableHeader">Id</th>            
               <th class="CatalogTableHeader">Name</th>
               <th class="CatalogTableHeader">Description</th>
               <th class="CatalogTableHeader">Main Image</th>
               <th class="CatalogTableHeader">Thumbnail</th>
               <th class="CatalogTableHeader">Info URL</th>               
               <th class="CatalogTableHeader">Size</th>
               <th class="CatalogTableHeader">Stock</th>
               <th class="CatalogTableHeader">Price</th>  
               <th class="CatalogTableHeader">SizeMU</th>   
                        
               <th class="CatalogTableHeader">CategoryId</th>
               <th class="CatalogTableHeader">BrandId</th>
               <th class="CatalogTableHeader">Status</th>
               <th class="CatalogTableHeader">Gender</th>
               <th class="CatalogTableHeader">ItemMU</th>
               <th class="CatalogTableHeader">Quantity</th>
               <th class="CatalogTableHeader"></th>
               <% int count=-1; %>
               <c:forEach var="item" items="${items}" varStatus="loop" begin="${pageBegin}" end="${pageEnd}">
                  <html:form action="/admin/EditItem">
                     <bean:define id="trclass" value="#DDDDDD"/>
                     <c:if test="${loop.count % 2 == 0}">
                       <bean:define id="trclass" value="#FFFFFF"/>
                     </c:if>
                     <tr style="background-color: <bean:write name='trclass'/>">
                       <td style="padding:0px 2px 0px 4px;font-weight:bold"> 
                         <input type="text" id="id" name="id" value="<bean:write name='item' property='id'/>" size="12"  readonly="true"/>
                       </td>                     
                       <td style="padding:0px 2px 0px 4px;font-weight:bold"> 
                         <input type="text" id="name" name="name" value="<bean:write name='item' property='name'/>" size="18" />
                       </td>
                       <td style="padding:0px 2px 0px 5px;">
                          <input type="text" id="description" name="description" value="<bean:write name='item' property='description'/>" size="25" />
                       </td>
                       <td style="padding: 2px 2px 2px 2px;">
                         <input type="text" id="image_src" name="image_src" value="<bean:write name='item' property='image.src'/>" size="25" />
                       </td>
                       <td style="padding: 2px 2px 2px 2px;">
                         <input type="text" id="image_thumbnail" name="image_thumbnail" value="<bean:write name='item' property='image.thumbnail'/>" size="25" />                       
                       </td>
                       <td style="padding: 2px 2px 2px 2px;">
                         <input type="text" id="information_url" name="information_url" value="<bean:write name='item' property='information.url'/>" size="25" />
                       </td>
                       
                       <bean:define id="sizes" name="item" property="sizes" type="java.util.List"/>
                       <bean:define id="size" name="item" property="sizes[0]"/>
                        <td>     
                          <input type="text" id="size_size" name="size_size" value="<bean:write name='size' property='size'/>" size="3" />
                        </td>
                        <td>
                          <input type="text" id="size_stock" name="size_stock" value="<bean:write name='size' property='stock'/>" size="3" />
                        </td>
                        <td> 
                          <input type="text" id="size_salePrice" name="size_salePrice" value="<bean:write name='size' property='salePrice'/>" size="5" />
                        </td>
                        <td> 
                          <input type="text" id="size_measurementUnit" name="size_measurementUnit" value="<bean:write name='size' property='measurementUnit'/>" size="5" />
                        </td>    
                        <td> 
                          <input type="text" id="categoryIds" name="categoryIds" value="<bean:write name='item' property='categoryIds'/>" size="10" />
                        </td> 
                        <td> 
                          <input type="text" id="brandId" name="brandId" value="<bean:write name='item' property='brandId'/>" size="5" />
                        </td>                        
                        <td> 
                          <input type="text" id="status" name="status" value="<bean:write name='item' property='status'/>" size="7" />
                        </td> 
                        <td> 
                          <input type="text" id="gender" name="gender" value="<bean:write name='item' property='gender'/>" size="5" />
                        </td> 
                        <td> 
                          <input type="text" id="measurementUnit" name="measurementUnit" value="<bean:write name='item' property='measurementUnit'/>" size="3" />
                        </td>
                        <td> 
                          <input type="text" id="quantityAvailable" name="quantityAvailable" value="<bean:write name='item' property='quantityAvailable'/>" size="3" />
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
