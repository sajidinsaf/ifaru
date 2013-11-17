<%@ page import='java.util.*,ifaru.cart.variables.*,ifaru.cart.users.*'%>
<%

	User user = (User) session.getAttribute("User");
	if(user==null)
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
	Variable object = null;
			
	String txtName = request.getParameter("txtName");
	object = website.variables.get(txtName);
	result = website.variables.delete(object);
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
