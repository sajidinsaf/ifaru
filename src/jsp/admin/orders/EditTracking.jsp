<%@ page import='java.util.*,java.text.*,ifaru.cart.*,ifaru.cart.orders.*,ifaru.cart.products.*,ifaru.cart.users.*,ifaru.cart.shipping.*'%><%

	response.addHeader("expires","0");
	
	User user = (User) session.getAttribute("User");
	if(user==null || (!user.isAdmin()))
	{
		User.adminLogin(request,response);
		return;
	}
	
%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/ifaru/"));%></jsp:useBean>
<%


	// Parameters to Redirect
	
	String nStart = request.getParameter("nStart");
	String nSize  = request.getParameter("nSize");
	String nOrderState = request.getParameter("nOrderState");
	String nEnd_Day = request.getParameter("nEnd_Day");
	String nEnd_Month = request.getParameter("nEnd_Month");
	String nEnd_Year = request.getParameter("nEnd_Year");
	String nStart_Day = request.getParameter("nStart_Day");
	String nStart_Month = request.getParameter("nStart_Month");
	String nStart_Year = request.getParameter("nStart_Year");
	
	String result = null;
	
	Vector pageorders = new Vector();
	
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		String ids [] = request.getParameterValues("Order_nID");
		String states [] = request.getParameterValues("Order_nOrderState");
		String tracking [] = request.getParameterValues("Order_txtTracking");
		String companies [] = request.getParameterValues("Order_txtTrackingCompanyID");
		
		for(int i=0;i<ids.length;i++)
		{
			int nID = Integer.parseInt(ids[i]);
			
			Order order = website.orders.getCompleteOrder(nID);
			order.nOrderState = Integer.parseInt(states[i]);
			order.txtTracking = tracking[i];
			

			nID = Integer.parseInt(companies[i]);
			ShippingCompany sc = website.shippingcompanies.get(nID);
			order.txtTrackingCompany = sc.txtName;
			order.txtTrackingURL = sc.txtTrackingURL;
			
			result = website.orders.edit(order,website.users);
			if(result != null)
			{
				System.out.println("Error:" + result);
				break;
			}
			
			
		}
		
		if(result==null)
		{
			String url = "List.jsp";
			url += "?nStart="  + nStart;
			url += "&nSize=" + nSize;
			url += "&nOrderState=" + nOrderState;
			url += "&nEnd_Day=" + nEnd_Day;
			url += "&nEnd_Month=" + nEnd_Month;
			url += "&nEnd_Year=" + nEnd_Year;
			url += "&nStart_Day=" + nStart_Day;
			url += "&nStart_Month=" + nStart_Month;
			url += "&nStart_Year=" + nStart_Year;

			response.sendRedirect(url);
			return;
		}
	}
	else
	{
		String ids[] = request.getParameterValues("nID");
		if(ids != null)
		{
			pageorders = website.orders.getAll(request.getParameterValues("nID"));
		}
		else
		{
			pageorders.addElement( website.orders.get( website.getRequestParameter(request,"nID",0) ) );
		}
	}
%>
<%@include file='EditTrackingForm.htm'%>