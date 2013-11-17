<%@ page import='java.util.*,ifaru.cart.categories.*,ifaru.cart.users.*'%>
<%

	User user = (User) session.getAttribute("User");
	if(user==null || (!user.isAdmin()))
	{
		User.adminLogin(request,response);
		return;
	}
%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/ifaru/"));%></jsp:useBean>

<%

	String nStart = website.getRequestParameter(request,"nStart");
	String nSize  = website.getRequestParameter(request,"nSize");
	
	String result = null;
	Category object = null;
			
	int nID = Integer.parseInt(request.getParameter("nID"));
	object = website.categories.get(nID);
	result = website.categories.delete(object);
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
