<%@ page language="java"%>
<%@page import='ifaru.cart.*'%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/"));%></jsp:useBean>

<logic:forward name="trade"/>
