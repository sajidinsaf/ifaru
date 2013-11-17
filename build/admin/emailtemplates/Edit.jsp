<%@ page import='java.util.*,ifaru.cart.emails.*,ifaru.cart.users.*'%>
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
	String title = "Edit EmailTemplate" + website.shopName;
	String action = "Edit.jsp";
	EmailTemplate object = null;
			
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		object = new EmailTemplate(request);
		result = website.emailtemplates.edit(object);
		if(result == null)
		{
			response.sendRedirect("List.jsp?nStart="+nStart+"&nSize="+nSize);
			return;
		}
	}
	else
	{
		String txtName = request.getParameter("txtName");
		object = website.emailtemplates.get(txtName);
	}
%><%@ include file='Form.htm'%>
