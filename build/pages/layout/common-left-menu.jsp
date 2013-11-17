<%@ page language="java" %><%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %><%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %><%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %><%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %><%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %><%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%-- set the value of the display style for the category and brand list depending upon whether  there was a brand search or category search or whether this is some other mode of entry (first time, keyword search etc) into the page --%><%-- Uncomment this section for collapsable menus  <logic:present name="categorySearch">      <bean:define id="catDisplay" value="block"/>  </logic:present>  <logic:notPresent name="categorySearch">      <bean:define id="catDisplay" value="none"/>  </logic:notPresent>  <logic:present name="brandSearch">      <bean:define id="brandDisplay" value="block"/>  </logic:present>  <logic:notPresent name="brandSearch">      <bean:define id="brandDisplay" value="none"/>  </logic:notPresent>--%><%-- comment out the next two lines for collapsable menus --%>    <bean:define id="catDisplay" value="block"/>    <bean:define id="brandDisplay" value="block"/><table class="LeftMenuLink" height="100%" border="0" cellpadding="0" cellspacing="0">  <tr><td>      <%-- create the keyword search box --%>      <html:form action="/catalog/KeywordSearch">        <input type="text" name="text" length="20"/><br/><html:submit styleClass="SearchButton" property="Search">Search</html:submit>           </html:form>
  </td></tr>  <%--  <tr><td>      <br>               <a href="#" onclick="return showMenu('catMenu');"><span id="expCat">+</span></a>        <a href="#" onclick="return showMenu('catMenu');"><STRONG>Categories</STRONG></a>     </td>  </tr>   --%>  <tr><td>            <%--<table id="catMenu" class="LeftMenuLink" style="display:<bean:write name='catDisplay'/>"> --%>    <table id="catMenu" class="LeftMenuLink" style="display:block">      <logic:present name="categories" scope="session">        <logic:notEmpty name="categories" property="topLevelCategories">          <bean:define id="topCats" name="categories" property="topLevelCategories"/>          <% int tCount=0; %>          <c:forEach var="element" items="${topCats}" varStatus="loop">                 <% String tId = "tCat"+ (++tCount); %>    
             <%-- Display the top level category --%>
             <bean:define id="topCat" name="element" property="value"/>                  
             <tr>
               <td>
                <%-- <a href="#" onclick="return showMenu('<%= tId %>');">+</a> --%>
                 <a href="<bean:write name='categoryBaseUrl'/><bean:write name='topCat' property='id'/>"><span style="font-size:14px;font-weight:bold"><bean:write name="topCat" property="name"/><span></a>
               </td>
               </tr> 
             
             <logic:notEmpty name="topCat" property="subCategories">
             <%-- set the display value of the category the user is browsing --%>
             <logic:present name="categorySearch">
               <bean:define id="catSearch" name="categorySearch" scope="session" />
             </logic:present>
             <logic:notPresent name="categorySearch">               <%-- make this value="none" to turn on collapsable menus" --%>
               <bean:define id="catSearch" value="none" />
             </logic:notPresent>

               <c:if test="${catSearch == topCat.name}">         
                 <c:set var="subCatDisplay" value="block"/>
               </c:if>
               
               <c:if test="${catSearch != topCat.name}">                     <%-- make this value="none" to turn on collapsable menus" --%>            
                 <c:set var="subCatDisplay" value="block"/>
               </c:if>

               <bean:define id="subCats" name="topCat" property="subCategories"/>
               <tr><td>
               <table id="<%=tId%>" class="LeftMenuLink" style="display:<c:out value='${subCatDisplay}'/>">
               <c:forEach var="subElement" items="${subCats}" varStatus="subLoop">  
       
                 <bean:define id="subCat" name="subElement" property="value"/>             
                 <%-- check if we need to makethis table visible by comparing the search keyword to the sub category name --%>
                 <c:if test="${catSearch == subCat.name}">  
                   <script language="javascript">       
                     showMenu('<%= tId %>');
                   </script>
                 </c:if>
                                                   
                 <tr>
                   <td>&nbsp;&nbsp;&nbsp;<a href="<bean:write name='categoryBaseUrl'/><bean:write name='subCat' property='id'/>"><bean:write name="subCat" property="name"/></a>
                   </td>
                 </tr>
               </c:forEach>
               </table></td</tr>
             </logic:notEmpty>
  
          </c:forEach>
        </logic:notEmpty>
      </logic:present> 
    </table>
    </td></tr>
    <tr><td><br/></td></tr>
    <tr><td>    <%--    &nbsp;<span style="color:#664499;font-size:14px;font-weight:bold;text-decoration:underline">Brands</span>
       <a href="#" onclick="return showMenu('brandMenu');"><span id="expCat">+</span></a>    --%>
       <a href="#" onclick="return showMenu('brandMenu');"><STRONG>Brands</STRONG></a>
    </td></tr>  
    <tr><td>
     <table id="brandMenu" class="LeftMenuLink" style="display:<bean:write name='brandDisplay'/>">          
        <logic:present name="brands" scope="session">
          <logic:notEmpty name="brands">
            <bean:define id="brands" name="brands"/>
            <c:forEach var="element" items="${brands}" varStatus="loop">
              <bean:define id="brand" name="element" property="value"/>                           
               <tr>
                 <td>
                   &nbsp;&nbsp;&nbsp;<a href="<bean:write name='brandBaseUrl'/><bean:write name='brand' property='id'/>"><bean:write name="brand" property="name"/></a>
                 </td>
               </tr>
            </c:forEach>
          </logic:notEmpty>
        </logic:present>     
      </table>
    </td></tr>
    <tr>      <td>        <br><br>                     <jsp:include page="/pages/inc/common/alphabeticLinks.jsp" flush="true">            <jsp:param name="href" value="/ifaru/catalog/ItemList.do"/>         </jsp:include>        <br><br><br><br><br>      </td>    </tr>    
</table>