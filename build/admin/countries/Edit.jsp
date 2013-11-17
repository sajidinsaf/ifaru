<%@ page import='java.util.*,ifaru.cart.countries.*,ifaru.cart.users.*'%>
<%

	User user = (User) session.getAttribute("User");
	if(user==null || (!user.isAdmin()))
	{
		User.doLogin(request,response);
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
	String title = "Add Country" + website.shopName;
	String action = "Edit.jsp";
	Country object = null;
			
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		object = new Country(request);
		result = website.countries.edit(object);
		if(result == null)
		{
			response.sendRedirect("List.jsp?nStart="+nStart+"&nSize="+nSize);
			return;
		}
	}
	else
	{
		object = website.countries.get(request.getParameter("txtID"));
	}
%><%@ include file='Form.htm'%>
