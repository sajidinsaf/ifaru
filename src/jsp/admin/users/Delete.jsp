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
	UserProfile object = null;
			
	object = website.users.getProfile(request.getParameter("txtEmailAddress"));
	result = website.users.delete(object);
	if(result == null)
	{
		response.sendRedirect("List.jsp");
		return;
	}
%><HTML>
<BODY>
	Error : <%=result%>
</BODY>
</HTML>
