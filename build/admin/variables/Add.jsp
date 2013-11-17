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
	String title = "Edit Variable" + website.shopName;
	String action = "Add.jsp";
	Variable object = null;
			
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		object = new Variable(request);
		result = website.variables.insert(object);
		if(result == null)
		{
			response.sendRedirect("List.jsp?nStart="+nStart+"&nSize="+nSize);
			return;
		}
	}
	else
	{
		object = Variable.defaultObject;
	}
%><%@ include file='Form.htm'%>
