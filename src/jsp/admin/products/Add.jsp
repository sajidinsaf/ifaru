<%@ page import='java.util.*,ifaru.cart.categories.*,ifaru.cart.products.*,ifaru.cart.users.*'%>
<%

	User user = (User) session.getAttribute("User");
	if(user==null || (!user.isAdmin()))
	{
		User.adminLogin(request,response);
		return;
	}
	
%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite">
	<%website.init(application.getRealPath("/ifaru/"));%>
</jsp:useBean>

<%

	String result = null;
	String action = "Add.jsp";
	String title = "Add Product - " + website.shopName;
	Product object = null;
	int nID=0;
			
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		object = new Product(request);
		result = website.products.insert(object);
		if(result == null)
		{
		
			website.categories.updateProducts(object,request.getParameter("aryCatIDs"));
		
			response.sendRedirect("List.jsp");
			return;
		}
	}
	else
	{
		object = Product.defaultObject;
	}
%><%@ include file='Form.htm'%>
