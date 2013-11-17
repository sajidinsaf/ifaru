<%@ page import='java.util.*,ifaru.cart.userinfo.*,ifaru.cart.users.*'%>
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
	String title = "Edit UserInfoQuestion" + website.shopName;
	String action = "Edit.jsp";
	UserInfoQuestion object = null;
			
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		object = new UserInfoQuestion(request);
		result = website.userinfoquestions.edit(object);
		if(result == null)
		{
			response.sendRedirect("List.jsp?nStart="+nStart+"&nSize="+nSize);
			return;
		}
	}
	else
	{
		int nID = Integer.parseInt(request.getParameter("nID"));
		object = website.userinfoquestions.get(nID);
	}
%><%@ include file='Form.htm'%>
