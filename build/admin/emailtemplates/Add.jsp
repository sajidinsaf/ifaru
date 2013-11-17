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
	String title = "Add EmailTemplate" + website.shopName;
	String action = "Add.jsp";
	EmailTemplate object = null;
			
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		object = new EmailTemplate(request);
		result = website.emailtemplates.insert(object);
		if(result == null)
		{
			response.sendRedirect("List.jsp?nStart="+nStart+"&nSize="+nSize);
			return;
		}
	}
	else
	{
		object = EmailTemplate.defaultObject;
	}
%><%@ include file='Form.htm'%>
