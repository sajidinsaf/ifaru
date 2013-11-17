<%@page import='ifaru.cart.users.*,ifaru.cart.*,ifaru.cart.products.*,ifaru.cart.orders.*,java.util.*'%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/"));%></jsp:useBean>
<%
	int nProductID = website.getRequestParameter(request,"nProductID",-1);
	if(nProductID==-1)
	{
		response.sendRedirect("/");
		return;
	}
	Product product = website.products.get(nProductID);
	response.sendRedirect(product.txtBuyNowUrl);
%>