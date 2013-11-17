<%@ page import='java.lang.reflect.*,java.util.*,ifaru.cart.orders.*,ifaru.cart.users.*,ifaru.cart.preferences.*'%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/ifaru/"));%></jsp:useBean><%

	String txtName = request.getParameter("txtName");

	User user = (User) session.getAttribute("User");
	if(user==null || (!user.isAdmin()))
	{
		User.adminLogin(request,response);
		return;
	}
	
	Page prefpage = website.preferences.getPage(txtName);
	
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		prefpage.loadPage(request);
		prefpage.save();
		response.sendRedirect("List.jsp");
		return;
	}
%><%@ include file='EditForm.html'%>