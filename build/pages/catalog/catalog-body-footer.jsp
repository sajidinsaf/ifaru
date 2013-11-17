<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>


   <jsp:include page="/pages/inc/common/alphabeticLinks.jsp" flush="true">
      <jsp:param name="href" value="/ifaru/catalog/FragranceList.do"/>
   </jsp:include>
        
   <session:existsAttribute name="fragrancesKey">
          
          <jsp:include page="/pages/catalog/page-control.jsp" flush="true">
          </jsp:include>
      
   </session:existsAttribute>     