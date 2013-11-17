<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<table width="620" STYLE="font-size:12px;font-family:Arial, Verdana, Courier New;background-image: url('/ifaru/images/pages/trade/attar/peachroseBackground.jpg')">
  <tr>
    <td align="center">
      <span style="color: #7D053F;font-size:18px;">Card Making Embellishments</span><br>
      <hr style="color: #f00; background-color: #f00; height: 2px;  width: 70%;  "/>      
    </td>  
  </tr>
  <tr>
    <td>
	<p align=left>
	  <!-- paramId is used in GalleryAction and the paramName points to the gallery descriptor defined by the servlet init parameter in web.xml -->
	  <jsp:useBean id="bindiSamples" class="com.ifaru.util.RequestParamBean" scope="request"/> 
	  <jsp:setProperty name="bindiSamples" property="value" value="bindiGallery"/>
	</p>
	

	  <img src="/ifaru/images/pages/trade/bindi.jpg" ALT="embellishment" ALIGN=RIGHT border=0>

	<p align=left><span class="gentext">
	At iFaru.com we recognise your need as a card maker to provide customers with the most innovative and attractive products at competitive rates.
	
	<br><br>Since 2004 iFaru has been supplying exquisite card embellishments at perhaps the lowest rates in the market.
	
	<br><br>The embellishments are delicate, beautiful and self-adhesive ornaments finished to a very high standard. These are made of exquisite materials such as crystals and beads of various colours and designs.<br><br>
	
	Please write to us at <a style="color:brown" HREF="mailto:contact@ifaru.com">contact@ifaru.com</a> to request samples of our collection. Please mention your business name and contact details when writing to us.
	
	Rates are based on complexity of the design, materials used and size of the orders and will be provided on request.
	</span></p>
  
</table>
