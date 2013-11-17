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
	Product object = null;
			
	int nID = Integer.parseInt(request.getParameter("nID"));
	object = website.products.get(nID);
	result = website.products.delete(object);
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
