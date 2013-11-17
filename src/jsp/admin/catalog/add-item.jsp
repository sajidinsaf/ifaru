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
          
  <logic:present name="adminCatalogKey" scope="session">

      <logic:notEmpty name="adminCatalogKey" property="items">
        <logic:present name="Success" scope="session">
          <logic:present name="alreadyExists" scope="session">
            <span style="color:amber"><bean:write name="alreadyExists"/></span><br><br>
          </logic:present>  
          <logic:notPresent name="alreadyExists">
            <span style="color:green">Item Added Successfully</span><br><br>
          </logic:notPresent>
        </logic:present>

          <html:form action="/admin/AddItem">
            <table class="CatalogTable" border="0" cellpadding="0" cellspacing="1">
               <tr><td class="CatalogTableHeader">Id</td>  
                   <td> 
                      <input type="text" id="id" name="id" value="<bean:write name='lastItem' property='id' ignore='true' />"/>
                   </td>  
               </tr>            
               <tr><td class="CatalogTableHeader">Name</td>  
                   <td> 
                     <input type="text" id="name" name="name" value="<bean:write name='lastItem' property='name' ignore='true' />" />
                   </td>
               </tr>             
               <tr><td class="CatalogTableHeader">Size</td>  
                    <td>     
                      <input type="text" id="size_size" name="size_size" value="<bean:write name='lastItem' property='sizes[0].size' ignore='true' />" />
                    </td>
               </tr>
               <tr><td class="CatalogTableHeader">Stock</td>  
                    <td>
                      <input type="text" id="size_stock" name="size_stock" value="<bean:write name='lastItem' property='sizes[0].stock' ignore='true' />" />
                    </td>
               </tr>
               <tr><td class="CatalogTableHeader">Price</td>  
                    <td> 
                      <input type="text" id="size_salePrice" name="size_salePrice" value="<bean:write name='lastItem' property='sizes[0].salePrice' ignore='true' />" />
                    </td>
               </tr>  
               <tr><td class="CatalogTableHeader">SizeMU</td>  
                    <td> 
                      <input type="text" id="size_measurementUnit" name="size_measurementUnit" value="<bean:write name='lastItem' property='sizes[0].measurementUnit' ignore='true' />" />
                    </td> 
               </tr>   
                        
               <tr><td class="CatalogTableHeader">CategoryId</td>     
                    <td> 
                      <input type="text" id="categoryIds" name="categoryIds" value="<bean:write name='lastItem' property='categoryIds' ignore='true' />" />
                    </td> 
               </tr>
               <tr><td class="CatalogTableHeader">BrandId</td>  
                    <td> 
                      <input type="text" id="brandId" name="brandId" value="<bean:write name='lastItem' property='brandId' ignore='true' />" />
                    </td> 
               </tr>
               <tr><td class="CatalogTableHeader">Status</td>                         
                    <td> 
                      <input type="text" id="status" name="status" value="<bean:write name='lastItem' property='status' ignore='true' />" />
                    </td> 
 
               </tr>
               <tr><td class="CatalogTableHeader">Gender</td>                 
                    <td>
                      <input type="text" id="gender" name="gender" value="<bean:write name='lastItem' property='gender' ignore='true' />" />
                    </td> 
               </tr>
               <tr><td class="CatalogTableHeader">ItemMU</td>  
                    <td> 
                      <input type="text" id="measurementUnit" name="measurementUnit" value="<bean:write name='lastItem' property='measurementUnit' ignore='true' />" />
                    </td>
               </tr>
               <tr><td class="CatalogTableHeader">Quantity</td>  
                    <td> 
                      <input type="text" id="quantityAvailable" name="quantityAvailable" value="<bean:write name='lastItem' property='quantityAvailable' ignore='true' />" />
                    </td>
               </tr>
               <tr><td class="CatalogTableHeader">Description</td>  
                   <td>
                      <input type="text" id="description" name="description" value="<bean:write name='lastItem' property='description' ignore='true' />" size="100" />
                   </td>
               </tr>
               <tr><td class="CatalogTableHeader">Main Image</td>  
                   <td>
                     <input type="text" id="image_src" name="image_src" value="<bean:write name='lastItem' property='image.src' ignore='true' />" size="100"/>
                   </td>
               </tr>
               <tr><td class="CatalogTableHeader">Thumbnail</td>  
                   <td>
                     <input type="text" id="image_thumbnail" name="image_thumbnail" value="<bean:write name='lastItem' property='image.thumbnail' ignore='true' />" size="100" />                       
                   </td>
               </tr>
               <tr><td class="CatalogTableHeader">Info URL</td>  
                   <td>
                     <input type="text" id="information_url" name="information_url" value="<bean:write name='lastItem' property='information.url' ignore='true' />" size="100" />
                   </td>
               </tr>                 
               <tr><td/>  
                   <td>
                     <html:submit styleClass="AddToCartButton" property="save" value="Save" alt="Save"/>
                   </td>  
               </tr>
               <input type="hidden" id="add" name="add" value="true"/>
            </table>
          </html:form>
 
      </logic:notEmpty>
  </logic:present>
