<%@page import='ifaru.cart.users.*,ifaru.cart.*,ifaru.cart.orders.*,java.util.*'%>
<%
	User user = (User) session.getAttribute("User");
	if(user==null)
	{
		User.doLogin(request,response);
		return;
	}
%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/"));%></jsp:useBean>
<%

	Users	users = website.users;
	Orders	orders = website.orders;
	
	int nOrderID = website.getRequestParameter(request,"nOrderID",0);
	
	String nStart = website.getRequestParameter(request,"nStart","0");
	String nSize = website.getRequestParameter(request,"nSize","20");
	
	Order order = orders.get(nOrderID);
	
	if(!user.isAdmin())
	{
		if(!order.txtEmailAddress.equals(user.txtUsername))
		{
			response.sendError(response.SC_UNAUTHORIZED);
			return;
		}
	}
	
	orders.delete(order);
	
	response.sendRedirect("MyOrders.jsp?nStart="+nStart+"&nSize="+nSize);
	
%>