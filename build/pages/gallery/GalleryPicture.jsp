<%@ page language="java"%>
<%@page import='com.ifaru.gallery.*'%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %> 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<td colspan=11>
  <br><br>
  <session:existsAttribute name="galleryPictureKey">
    <jsp:useBean id="galleryPictureKey" scope="session" class="com.ifaru.gallery.Picture"/>
    <table>
      <table>
        <tr>
          <td>
            <bean:define id="imgSrc" name="galleryPictureKey" property="image.src" type="java.lang.String"/>
            <html:img src="<%= imgSrc %>" />
          </td>
        </tr>
        <tr align="center">
          <td>
               <span style="text-transform : uppercase; font-family : verdana; font-weight: bold; text-decoration : underline; text-align : center; font-size : 16pt; color : #9933ff; background-color : #FFFFFF;">
                 <bean:write name="galleryPictureKey" property="title" />
               </span>
          </td>      
        </tr>
        <tr>
          <td>
             <span style="font-weight: bold; font-family : verdana; text-decoration : bold; text-align : center; font-size : 11pt; color : #9933ff; background-color : #FFFFFF;">
               <bean:write name="galleryPictureKey" property="description"/>
             </span>
          </td>      
        </tr>
      </table>
      <br>
      <table>
        <tr>
          <session:existsAttribute name="galleryPicturePreviousKey">
            <td>
              <html:link forward="galleryPicture" paramId="id" paramName="galleryPicturePreviousKey" paramProperty="id">Previous</html:link>
            </td>
            <td/><td/>
          </session:existsAttribute>
          <td>
            <html:link forward="gallery">Back to Gallery</html:link>
          </td>
          <session:existsAttribute name="galleryPictureNextKey">
            <td/><td/>
            <td>
              <html:link forward="galleryPicture" paramId="id" paramName="galleryPictureNextKey" paramProperty="id">Next</html:link>
            </td>
          </session:existsAttribute>
        </tr>
      </table>
    </table>
  </session:existsAttribute>
</td>
<br><br>