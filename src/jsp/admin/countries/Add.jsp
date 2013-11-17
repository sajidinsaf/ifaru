<%@ page import='java.util.*,ifaru.cart.countries.*,ifaru.cart.users.*'%>
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
	String title = "Edit Country" + website.shopName;
	String action = "Add.jsp";
	Country object = null;
			
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		object = new Country(request);
		result = website.countries.insert(object);
		if(result == null)
		{
			response.sendRedirect("List.jsp?nStart="+nStart+"&nSize="+nSize);
			return;
		}
	}
	else
	{
		object = Country.defaultObject;
	}
%><%@ include file='Form.htm'%>
