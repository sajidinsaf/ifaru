<%@ page import='java.util.*,ifaru.cart.orders.*,ifaru.cart.users.*'%>
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
	Order object = null;
			
	int nID = website.getRequestParameter(request,"nID",0);
	object = website.orders.get(nID);
	result = website.orders.delete(object);
	if(result == null)
	{
			response.sendRedirect("List.jsp?nStart="+nStart+"&nSize="+nSize);
		return;
	}
%><HTML>
<BODY>
	Error : <%=result%>
</BODY>
</HTML>
