<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<table height=400 width=645 STYLE="background-image: url('/ifaru/images/pages/trade/attar/peachroseBackground.jpg'); border: 2 ridge #800000">
  <tr>
    <td align="center">
      <span align="center" class="sectionheader" style="color: #7D053F;">~ iFaru Perfume Galleries ~</span><br><br><br>
    </td>
  </tr>
  <tr>
    <td>
     <span class="gentext" style="color: #5F5A59;">
       iFaru Galleries are designed to give you a better 'picture' of what's on offer at iFaru. <br>
       Each link below represents a gallery and opens the gallery in a new window. 
     </span>
    <td>
  </tr>
  <tr>
    <td>
      <span class="gentext" style="color: #5F5A59;">
        <html:link href="http://www.ifaru.co.uk/oudh/gallery/agarwood.html" target="_blank">Agarwood</html:link><br>
        <html:link href="http://www.ifaru.co.uk/oudh/gallery/attar.html" target="_blank">Production Process Of Attar</html:link><br>
        <!-- paramId is used in GalleryAction and the paramName points to the gallery descriptor defined by the servlet init parameter in web.xml -->
        <jsp:useBean id="perfumeBottles" class="com.ifaru.util.RequestParamBean" scope="request"/> 
        <jsp:setProperty name="perfumeBottles" property="value" value="perfumeBottlesGallery"/>
        <html:link forward="gallery" paramId="galleryName" paramName="perfumeBottles" paramProperty="value" target="_blank">
          Perfume Bottles
        </html:link><br>
      </span>
    </td>
  </tr>
  
</table>