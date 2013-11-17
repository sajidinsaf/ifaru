
<jsp:include page="/pages/layout/common-header-tag.jsp" flush=true />
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import='java.util.*,ifaru.cart.categories.*,ifaru.cart.users.*,ifaru.cart.products.*'%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>


  <logic:notEmpty name="parent">
    <jsp:useBean id="parent" scope="session" class="ifaru.cart.categories.Category"/>
    <META name="reply-to"    CONTENT="<%=parent.txtMetaReplyTo%>">
    <META name="language"    CONTENT="<%=parent.txtMetaLanguage%>">
    <META name="distribution"  CONTENT="<%=parent.txtMetaDistribution%>">
    <META name="copyright"    CONTENT="<%=parent.txtMetaCopyright%>">
    <META name="classification" CONTENT="<%=parent.txtMetaClassification%>">
    <META name="author"      CONTENT="<%=parent.txtMetaAuthor%>">
    <META name="revisit-after"  CONTENT="<%=parent.txtMetaRevisitAfter%>">
    <META name="description"  CONTENT="<%=parent.txtMetaDescription%>">
    <META name="robots"      CONTENT="<%=parent.txtMetaRobots%>">
    <META name="keywords"    CONTENT="<%=parent.txtMetaKeywords%>">
  </logic:notEmpty>

