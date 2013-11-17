<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>          
          
          
          
  <logic:notEmpty name="fragrancesKey" property="fragrances">
    <jsp:useBean id="fragrancesKey" scope="session" class="com.ifaru.catalog.fragrance.Fragrances"/>

    <bean:define id="fragrances" name="fragrancesKey" property="fragrances" type="java.util.List"/>      
    <bean:size id="listSize" name="fragrances"/>     
<%--      <bean:parameter id="pageSize" name="pageSize" value="10"/>     
      <bean:parameter id="pageBegin" name="pageBegin" value="0"/>
      <bean:define id="pageEnd" value="10"/> --%>
    <c:set var="pageSize" value="10"/>
    <c:set var="pageBegin" value="${param.pageBegin}"/>
    <c:set var="pageEnd" value="${pageBegin + pageSize - 1}"/>  
      <c:if test="${(pageBegin - pageSize) ge 0}">
        <a href="<c:url value="/catalog/FragranceList.do"><c:param name="pageEnd" value="${pageEnd}"/> <c:param name="pageBegin" value="${pageBegin - pageSize}"/></c:url>">Previous</a>
      </c:if>
      &nbsp;
      <c:if test="${(listSize gt pageSize) and (pageEnd lt listSize)}">
         <a href="<c:url value="/catalog/FragranceList.do"><c:param name="pageEnd" value="${pageEnd}"/><c:param name="pageBegin" value="${pageBegin + pageSize}"/></c:url>">Next</a>
      </c:if>

  </logic:notEmpty>