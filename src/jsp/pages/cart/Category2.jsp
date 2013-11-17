<%@ page import='java.util.*,ifaru.cart.categories.*,ifaru.cart.users.*,ifaru.cart.products.*'%>
<jsp:useBean id="website" scope="application" class="ifaru.cart.WebSite"><%website.init(application.getRealPath("/"));%></jsp:useBean>
<%

	
	int nParentID = website.getRequestParameter(request,"nParentID",0);
	
	Category parent = null;
	Vector items = null;
	if(nParentID != 0)
	{
		parent = website.categories.get(nParentID);
		items = parent.childCategories;
	}
	else
	{
		items = website.categories.getAll(nParentID,0,-1);
	}
	
	Enumeration enum = items.elements();
	
	
	String txtTitle = "";
	String txtHeader = "";
	String txtFooter = "";
	String txtMeta = "";
	
	if(parent == null)
	{
		txtTitle = website.preferences.categoryPage.txtTitle;
	}
	else
	{
		if(parent.txtTitle==null || parent.txtTitle.length()==0)
			txtTitle = website.preferences.categoryPage.txtTitle;
		else
			txtTitle = parent.txtTitle;
			
		if(parent.txtHeader==null || parent.txtHeader.length()==0)
			txtHeader = website.preferences.categoryPage.txtHeader;
		else
			txtHeader = parent.txtHeader;
			
		if(parent.txtFooter==null || parent.txtFooter.length()==0)
			txtFooter = website.preferences.categoryPage.txtFooter;
		else
			txtFooter = parent.txtFooter;
			
		txtMeta = parent.txtMeta;
	}
	
	
%>
<HTML>
<HEAD>
<%=txtMeta%>
<%
	if(parent!=null)
	{
%>
		<META name="reply-to"		CONTENT="<%=parent.txtMetaReplyTo%>">
		<META name="language"		CONTENT="<%=parent.txtMetaLanguage%>">
		<META name="distribution"	CONTENT="<%=parent.txtMetaDistribution%>">
		<META name="copyright"		CONTENT="<%=parent.txtMetaCopyright%>">
		<META name="classification" CONTENT="<%=parent.txtMetaClassification%>">
		<META name="author"			CONTENT="<%=parent.txtMetaAuthor%>">
		<META name="revisit-after"	CONTENT="<%=parent.txtMetaRevisitAfter%>">
		<META name="description"	CONTENT="<%=parent.txtMetaDescription%>">
		<META name="robots"			CONTENT="<%=parent.txtMetaRobots%>">
		<META name="keywords"		CONTENT="<%=parent.txtMetaKeywords%>">
<%
	}
%>
<TITLE><%=txtTitle%></TITLE>

<LINK href="/ifaru/Common.css" rel=stylesheet>
</HEAD>

<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginwidth="0" marginheight="0" onLoad="">
<%=website.preferences.globalPage.txtHeader%>
<%=txtHeader%>
					
						<TABLE class=Data cellspacing=1 width=100%>
							<TR>
								<TD align=left><A href="Category2.jsp"><%=website.shopName%></A> > 
								<%=( (parent!=null) ? parent.getHierarchy(" > ","","Category2.jsp") : "" )%>
								</TD>
							</TR>
						</TABLE>
						<BR>
					
						<%
							if(items.size()>0)
							{
						%>
						
							<TABLE class='Data' width=100%>
								<TR>
									<TH valign="top" colspan=2>Categories Under <%=((parent==null)?( website.shopName ):(parent.txtName))%></TH>
								</TR>
								<%
									
									while(enum.hasMoreElements())
									{
										Category c = (Category)enum.nextElement();
										%>
								<TR>
									<TD colspan=2><A href="Category2.jsp?nParentID=<%=c.nID%>"><STRONG><%=c.txtName%></STRONG></A></TD>
								</TR>
								
								<%
									if(c.childCategories.size()>0)
									{
								%>
								
											<TR>
												<TD width=14>&nbsp;</TD>
												<TD>
													<%
														Enumeration e2 = c.childCategories.elements();
														while(e2.hasMoreElements())
														{
															Category c2 = (Category) e2.nextElement();
													%><A href="Category2.jsp?nParentID=<%=c2.nID%>&txtName=<%=c2.txtName%>"><STRONG><%=c2.txtName%></STRONG></A>,
													<%
														}
													%>
												</TD>
											</TR>
								<%
										}
									}
								%>
							</TABLE>
						
						<%
							}
						%>
						
						<BR>
						<%if(parent != null){
								Vector products = parent.products;
								if(products.size()>0)
								{
							%>
									<TABLE cellspacing=1 cellpadding=2 class=Data width=100%>
										<TR>
											<TH> Product </TH>
											<TH> Pcs/Pack </TH>
											<TH> General Price </TH>
											<TH> Our Price </TH>
											<TH> Buy Now </TH>
										</TR>
									<%
										enum = products.elements();
										while(enum.hasMoreElements())
										{
											Product product = (Product) enum.nextElement();
											
											if(product.bActive==0)
												continue;
												
											if(product.txtBuyNowUrl==null)
											{
									%>
									<TR>
										<TD valign=top><a href="Product.jsp?nID=<%=product.nID%>&nCategoryID=<%=parent.nID%>"><STRONG><%=product.txtName%></STRONG></A><BR><%=product.txtDescription%></TD>
										<TD valign=top><%=(int)product.dblQtyPerPack%></TD>
										<TD valign=top align=right><font color=red style="TEXT-DECORATION: line-through"><%=product.dblDummyPrice%> GBP</font></TD>
										<TD valign=top align=right><font color=blue><STRONG><%=product.dblPrice%> GBP</STRONG></font></TD>
										<FORM action="/ifaru/pages/cart/Cart.jsp" id=form1 name=form1>
											<input type=hidden name='nID' value='<%=product.nID%>'>
											<input type=hidden name='txtCommand' value='Add'>
											<TD valign=top>
												<select name='nQuantity'>
													<option value='1'>1 Pack</option>
													<option value='2'>2 Packs</option>
													<option value='3'>3 Packs</option>
													<option value='4'>4 Packs</option>
													<option value='5'>5 Packs</option>
												</select><BR>
												<input type=submit class='SmallButton' value='Add To Cart' id=submit1 name=submit1>
												</TD>
										</FORM>
									</TR>
									<%
											}
											else
											{
											
											// Goto Product Description Now
									%>
									<TR>
										<TD valign=top><a href="Product.jsp?nID=<%=product.nID%>&nCategoryID=<%=parent.nID%>"><STRONG><%=product.txtName%></STRONG></A><BR><%=product.txtDescription%></TD>
										<TD valign=top><%=(int)product.dblQtyPerPack%></TD>
										<TD valign=top align=right><font color=red style="TEXT-DECORATION: line-through"><%=product.dblDummyPrice%> GBP</font></TD>
										<TD valign=top align=right><font color=blue><STRONG><%=product.dblPrice%> GBP</STRONG></font></TD>
										<TD valign=top align=right><input type=button class='SmallButton' value='Buy Now' onclick="location.href='Goto.jsp?nProductID=<%=product.nID%>'" id=button1 name=button1></TD>
									</TR>
									<%
											}
										}
									%>
								</TABLE>
								<BR>
							<%
								}
							%>
						
						<%}%>

						
					<!---------   End of Data Area ------------>
					

<%=txtFooter%>
<%=website.preferences.globalPage.txtFooter%>
</BODY>
</HTML>
