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
	
	int		nParentID = website.getRequestParameter(request,"nParentID",0);	
	
	String result = null;
	String title = "Add Category" + website.shopName;
	String action = "Add.jsp";
	Category object = null;
			
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		object = new Category(request);
		result = website.categories.insert(object);
		if(result == null)
		{
			response.sendRedirect("List.jsp?nStart="+nStart+"&nSize="+nSize+"&nParentID="+String.valueOf(nParentID));
			return;
		}
	}
	else
	{
		object = new Category();
		object.nParentID = nParentID;
	}
%><%@ include file='Form.htm'%>
