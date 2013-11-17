<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %> 

<%--
    <html:link forward="home"><img class="NavigationImage" src="/ifaru/images/pages/layout/spacer.jpg" border=0></html:link> 
      <html:link styleClass="HeaderLink" forward="home">Home</html:link>
    <html:link forward="catalog"><img class="NavigationImage" src="/ifaru/images/pages/layout/spacera.jpg" border=0></html:link> 
      <html:link styleClass="HeaderLink" forward="catalog">Shop</html:link>
    <html:link forward="trade"><img class="NavigationImage" src="/ifaru/images/pages/layout/spacerb.jpg" border=0></html:link> 
      <html:link styleClass="HeaderLink" forward="trade">Trade</html:link>
    <html:link forward="about"> <img class="NavigationImage" src="/ifaru/images/pages/layout/spacerc.jpg" border=0></html:link> 
      <html:link styleClass="HeaderLink" forward="about">About</html:link>
    <html:link forward="contact"><img class="NavigationImage" src="/ifaru/images/pages/layout/spacerd.jpg" border=0></html:link> 
      <html:link styleClass="HeaderLink" forward="contact">Contact</html:link>

      --%>
      

    <table>  
      <tr id="nav">
        <td id="home"><html:link forward="home">Home</html:link></td>
        <td id="shop"><html:link forward="catalog">Shop</html:link></td>
        <td id="trade"><html:link forward="trade">Products</html:link></td>
        <td id="about"><html:link forward="about">About</html:link></td> 
        <td id="contact"><html:link forward="contact">Contact</html:link></td> 
     </tr> 
    </table>     
