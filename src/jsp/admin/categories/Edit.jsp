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
	
	String nParentID = request.getParameter("nParentID");
	
	String result = null;
	String title = "Edit Category" + website.shopName;
	String action = "Edit.jsp";
	Category object = null;
			
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		object = new Category(request);
		result = website.categories.edit(object);
		if(result == null)
		{
			response.sendRedirect("List.jsp?nStart="+nStart+"&nSize="+nSize+"&nParentID="+nParentID);
			return;
		}
	}
	else
	{
		int nID = Integer.parseInt(request.getParameter("nID"));
		object = website.categories.get(nID);
	}
%><%@ include file='Form.htm'%>
