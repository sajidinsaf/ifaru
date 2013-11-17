<%@ page language="java" %>
<%@page import='ifaru.cart.*'%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<html>
  <head>

    <jsp:include page="/pages/layout/common-header-tag.jsp" flush="true" />
  </head>
<body link=#66CC99 alink=olive vlink=olive>
        <div align="center">
        <jsp:include page="/pages/layout/common-page-header.jsp" flush="true" />
        <jsp:include page="/pages/inc/common/table/header.jsp" flush="true" />

          <table>
          <jsp:include page="/pages/inc/common/alphabeticLinks.jsp" flush="true">
            <jsp:param name="href" value="/ifaru/FragranceList.do"/>
          </jsp:include>
          </table>

       
        <session:existsAttribute name="fragrancesKey">
           <logic:notEmpty name="fragrancesKey" property="fragrances">

        	<display:table pagesize="5" name="sessionScope.fragrancesKey.fragrances" id="fragrance">
      	       <display:column title="">
      	         <bean:define id="thSrc" name="fragrance" property="image.thumbnail" type="java.lang.String"/>
      	         <html:link action="/FragranceInfo" target="_blank" paramId="fragranceId" paramName="fragrance" paramProperty="id">
                   <html:img src="<%= thSrc %>" align="center" height="70" width="80" border="1"/> 
                 </html:link>
      	       </display:column>
        	   <display:column property="name" headerClass="GenTextCapitalise" class="GenTextCapitalise" sortable="true"/> 
        	   <bean:define id="grades" name="fragrance" property="grades" type="java.util.List"/> 
        	   <display:column title="">
        	     <display:table id="grade" name="pageScope.grades"> 	             	  	    
        	        <logic:notEqual name="grade" property="id" value="0">
        	         <display:column property="id" title="Grade" class="textRed"  sortable="true"/>
        	         <display:column property="name" title="Scent" class="textRed" />
        	       </logic:notEqual>
        	       <display:column property="currency" />        	       
        	       <display:column property="rate" />
                   <display:column property="rateUnit" title="Rate Unit"/>        	       
        	        <logic:notEqual name="grade" property="rateQuantity" value="any">
        	         <display:column property="rateQuantity" title="Rate Quantity" class="textRed" />
        	       </logic:notEqual>        	       
        	       <logic:equal name="grade" property="id" value="0">
        	         <display:column title="" />
        	         <display:column title="" />
        	       </logic:equal>
                 </display:table>
              
               </display:column>
               <display:column property="category" headerClass="GenTextCapitalise" class="GenTextCapitalise" sortable="true"/>
               <display:column property="gender" headerClass="GenTextCapitalise" class="GenTextCapitalise" sortable="true"/>
        	   <display:column title="">
        	        <html:link action="/FragranceInfo" target="_blank" paramId="fragranceId" paramName="fragrance" paramProperty="id">More Info</html:link>
        	   </display:column> 
              <display:footer>
                <tr>
                  <a href="#top"><span style="text-decoration: underline;" class="Gentextcapitalise">Back to the Top</span></a>
                </tr>
              </display:footer>  
                     			 
            </display:table>

           </logic:notEmpty>
           <logic:empty name="fragrancesKey" property="fragrances">

                   <logic:present parameter="startsWithAlphabet">
                     <bean:parameter id="alphabet" name="startsWithAlphabet"/>
                     <br><br><span class="gentext">No fragrances found starting with <bean:write name="alphabet"/></span>
                   </logic:present>

           </logic:empty>
        </session:existsAttribute>
   </div>
</body>
</html>