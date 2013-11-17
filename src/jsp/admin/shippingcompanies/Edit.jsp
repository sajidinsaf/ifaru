<%@ page import='java.util.*,ifaru.cart.shipping.*,ifaru.cart.users.*'%>
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

	String nStart = website.getRequestParameter(request,"nStart");
	String nSize  = website.getRequestParameter(request,"nSize");
	
	String result = null;
	String title = "Add ShippingCompany" + website.shopName;
	String action = "Edit.jsp";
	ShippingCompany object = null;
			
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		object = new ShippingCompany(request);
		result = website.shippingcompanies.edit(object);
		if(result == null)
		{
			response.sendRedirect("List.jsp?nStart="+nStart+"&nSize="+nSize);
			return;
		}
	}
	else
	{
		int nID = Integer.parseInt(request.getParameter("nID"));
		object = website.shippingcompanies.get(nID);
	}
%><%@ include file='Form.htm'%>
