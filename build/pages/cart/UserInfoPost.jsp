<%@page import='ifaru.cart.users.*,ifaru.cart.*,ifaru.cart.products.*,ifaru.cart.userinfo.*,java.util.*'%><%
	User user = (User) session.getAttribute("User");
	if(user==null)
	{
		User.doLogin(request,response);
		return;
	}
	
	if(!request.getMethod().equalsIgnoreCase("POST"))
	{
		response.sendRedirect("UserInfo.jsp");
		return;
	}
	
%><jsp:useBean id="order" scope="session" class="ifaru.cart.orders.Order" /><%
	
	order.setUserInfo(request);
	response.sendRedirect("Checkout.jsp");
	return;
%>