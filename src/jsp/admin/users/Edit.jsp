<%@ page import='java.util.*,ifaru.cart.users.*,ifaru.cart.users.*'%>
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
	String title = "Add User" + website.shopName;
	String action = "Edit.jsp";
	UserProfile object = null;
			
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		object = new UserProfile(request);
		result = website.users.edit(object);
		if(result == null)
		{
			response.sendRedirect("List.jsp");
			return;
		}
	}
	else
	{
		object = website.users.getProfile(request.getParameter("txtEmailAddress"));
	}
%><%@ include file='Form.htm'%>
