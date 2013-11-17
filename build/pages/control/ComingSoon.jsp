<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>

<td colspan=11>
  <div class="pageheader">
    <session:existsAttribute name="coming.soon" value="true">
      <session:attribute name="coming.soon"/><br/>
      <session:removeAttribute name="coming.soon"/>
    </session:existsAttribute>
  </div>
  <div class="bodytext">
    This feature is coming soon.<br><br>
    Please write to contact@ifaru.com for more information.
  </div>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>  
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>   
</td>