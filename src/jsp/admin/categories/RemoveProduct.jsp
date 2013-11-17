<%@ page import='java.util.*,ifaru.cart.categories.*,ifaru.cart.products.*,ifaru.cart.users.*'%>
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

	
	String nStart = request.getParameter("nStart");
	String nSize  = request.getParameter("nSize");

	int nCategoryID = website.getRequestParameter(request,"nCategoryID",0);	
	Category category = website.categories.get(nCategoryID);

	int nProductID = website.getRequestParameter(request,"nProductID",0);
	Product product = website.products.get(nProductID);
	
	website.categories.deleteProduct(category,product);
	
	response.sendRedirect("List.jsp?nParentID="+String.valueOf(nCategoryID)+"&nStart="+nStart+"&nSize="+nSize);
	
%>
