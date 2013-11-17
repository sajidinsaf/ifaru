<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglibs-session.tld" prefix="session" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/curtag.tld" prefix="set" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<logic:notEqual name="GetShippingAddress" value="true" scope="session">
<form name="addressForm" action="/ifaru/checkout/AddressCapture.do">
  <input type="hidden" name="type" value="0"/> <%-- 0 is the type for billing address. See Address.java --%>
  <p align="left">
    <span style="font-family:Arial; font-size:10pt;font-style:italic">
      Please enter your billing and shipping address. Fields marked with an asterisk (*) are mandatory
    </span>
  </p>
  <p align="left">
    &nbsp;&nbsp; 
    <span style="font-family:Verdana; font-size:10pt; font-weight:bold; font-style:underline">
      Billing Address
    </span>
  </p>

  &nbsp;
  <table border="0" cellspacing="0" style="border-collapse: collapse; font-family: Arial; font-size: 8pt" bordercolor="#111111" width="69%" id="AutoNumber1" height="179">
      <tr>
        <td width="30%" height="22">
          <span style="font-family:Verdana; font-size:8pt">
            &nbsp;&nbsp;&nbsp; Title 
          </span>
        </td>
        <td width="73%" height="22">
          <span style="font-family:Verdana; font-size:8pt">
            <select size="1" name="title">
              <option value="Mr">Mr</option>
              <option value="Mrs">Mrs</option>
              <option value="Miss">Miss</option>
              <option value="Dr">Dr</option>
              <option value="Master">Master</option>
            </select>
          </span>
        </td>
      </tr>
      <tr>
        <td width="30%" height="21">
          <span style="font-family:Verdana; font-size:8pt">
            &nbsp;&nbsp;&nbsp;&nbsp;First Name
          </span>
        </td>
        <td width="73%" height="21">
          <input type="text" name="firstName" size="19" style="border-style: inset; border-width: 1; font-family:Verdana; font-size:8pt">
             &nbsp;
          <span style="font-family:Verdana; font-size:8pt;color:#FF0000">
            *
          </span>
        </td>
      </tr>
      <tr>
        <td width="30%" height="21">
          <span style="font-family:Verdana; font-size:8pt">
            &nbsp;&nbsp;&nbsp;&nbsp;Last Name
          </span>
        </td>
        <td width="73%" height="21">
           <input type="text" name="lastName" size="19" style="font-family:Verdana; font-size:8pt;border-style: inset; border-width: 1">&nbsp;
           <span style="font-family:Verdana; font-size:8pt;color:#FF0000">
             *
           </span>
        </td>
      </tr>
      <tr>
        <td width="30%" height="14">
          <span style="font-family:Verdana; font-size:8pt">
            &nbsp;&nbsp;&nbsp;&nbsp;Address Line 1
          </span>
        </td>
        <td width="73%" height="14">
          <span style="font-family:Verdana; font-size:8pt">
            <input type="text" name="addrLine1" size="50" style="border-style: inset; border-width: 1">
            <span style="color:#FF0000">
              *
            </span>
          </span>
        </td>
      </tr>
      <tr>
        <td width="30%" height="14">
          <span style="font-family:Verdana; font-size:8pt">
            &nbsp;&nbsp;&nbsp;&nbsp;Address Line 2
          </span>
        </td>
        <td width="73%" height="14">
          <span style="font-family:Verdana; font-size:8pt">
           <input type="text" name="addrLine2" size="50" style="border-style: inset; border-width: 1">
          </span>
        </td>
      </tr>
      <tr>
        <td width="30%" height="14"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
        Address Line 3</span></td>
        <td width="73%" height="14"><span style="font-family:Verdana; font-size:8pt">
  <input type="text" name="addrLine3" size="50" style="border-style: inset; border-width: 1">&nbsp;
  </span>
        </td>
      </tr>
      <tr>
        <td width="30%" height="14"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
        City</span></td>
        <td width="73%" height="14">
          <span style="font-family:Verdana; font-size:8pt">
           <input type="text" name="city" size="18" style="border-style: inset; border-width: 1">
           <span style="color:#FF0000">*</span>
          </span>
        </td>
      </tr>
      <tr>
        <td width="30%" height="15"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
        Post Code </span></td>
        <td width="73%" height="15"><span style="font-family:Verdana; font-size:8pt">
            <input type="text" name="postCode" size="18" style="border-style: inset; border-width: 1">
        </td>
      </tr>
      <tr>
        <td width="30%" height="14">
          <span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
           County/State
        </span></td>
        <td width="73%" height="14"><span style="font-family:Verdana; font-size:8pt">
          <input type="text" name="county" size="19" style="border-style: inset; border-width: 1">
          <span style="color:#FF0000">*</span></span>
        </td>
      </tr>
      <tr>
        <td width="30%" height="14"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
        Country </span>
        </td>
        <td width="73%" height="14">
          <span style="font-family:Verdana; font-size:8pt">
              <select size="1" name="country" style="border-style: inset; border-width: 1">
                  <option value="AF">Afghanistan</option>
                  <option value="AL">Albania</option>
                  <option value="DZ">Algeria</option>
                  <option value="AS">American Samoa</option>
                  <option value="AD">Andorra</option>
                  <option value="AO">Angola</option>
                  <option value="AI">Anguilla</option>
                  <option value="AQ">Antarctica</option>
                  <option value="AG">Antigua and Barbuda</option>
                  <option value="AR">Argentina</option>
                  <option value="AM">Armenia</option>
                  <option value="AW">Aruba</option>
                  <option value="AU">Australia</option>
                  <option value="AT">Austria</option>
                  <option value="AZ">Azerbaidjan</option>
                  <option value="BS">Bahamas</option>
                  <option value="BH">Bahrain</option>
                  <option value="BD">Banglades</option>
                  <option value="BB">Barbados</option>
                  <option value="BY">Belarus</option>
                  <option value="BE">Belgium</option>
                  <option value="BZ">Belize</option>
                  <option value="BJ">Benin</option>
                  <option value="BM">Bermuda</option>
                  <option value="BT">Bhutan</option>
                  <option value="BO">Bolivia</option>
                  <option value="BA">Bosnia-Herzegovina</option>
                  <option value="BW">Botswana</option>
                  <option value="BV">Bouvet Island</option>
                  <option value="BR">Brazil</option>
                  <option value="IO">British Indian O. Terr.</option>
                  <option value="BN">Brunei Darussalam</option>
                  <option value="BG">Bulgaria</option>
                  <option value="BF">Burkina Faso</option>
                  <option value="BI">Burundi</option>
                  <option value="KH">Cambodia</option>
                  <option value="CM">Cameroon</option>
                  <option value="CA">Canada</option>
                  <option value="CV">Cape Verde</option>
                  <option value="KY">Cayman Islands</option>
                  <option value="CF">Central African Rep.</option>
                  <option value="TD">Chad</option>
                  <option value="CL">Chile</option>
                  <option value="CN">China</option>
                  <option value="CX">Christmas Island</option>
                  <option value="CC">Cocos (Keeling) Isl.</option>
                  <option value="CO">Colombia</option>
                  <option value="KM">Comoros</option>
                  <option value="CG">Congo</option>
                  <option value="CK">Cook Islands</option>
                  <option value="CR">Costa Rica</option>
                  <option value="HR">Croatia</option>
                  <option value="CU">Cuba</option>
                  <option value="CY">Cyprus</option>
                  <option value="CZ">Czech Republic</option>
                  <option value="CS">Czechoslovakia</option>
                  <option value="DK">Denmark</option>
                  <option value="DJ">Djibouti</option>
                  <option value="DM">Dominica</option>
                  <option value="DO">Dominican Republi</option>
                  <option value="TP">East Timor</option>
                  <option value="EC">Ecuador</option>
                  <option value="EG">Egypt</option>
                  <option value="SV">El Salvador</option>
                  <option value="GQ">Equatorial Guinea</option>
                  <option value="EE">Estonia</option>
                  <option value="ET">Ethiopia</option>
                  <option value="FK">Falkland Isl.(Malvinas)</option>
                  <option value="FO">Faroe Islands</option>
                  <option value="FJ">Fiji</option>
                  <option value="FI">Finland</option>
                  <option value="FR">France</option>
                  <option value="FX">France (European Ter.)</option>
                  <option value="TF">French Southern Terr.</option>
                  <option value="GA">Gabon</option>
                  <option value="GM">Gambia</option>
                  <option value="GE">Georgia</option>
                  <option value="DE">Germany</option>
                  <option value="GH">Ghana</option>
                  <option value="GI">Gibraltar</option>
                  <option value="GB">Great Britain (UK)</option>
                  <option value="GR">Greece</option>
                  <option value="GL">Greenland</option>
                  <option value="GD">Grenada</option>
                  <option value="GP">Guadeloupe (Fr.)</option>
                  <option value="GU">Guam (US)</option>
                  <option value="GT">Guatemala</option>
                  <option value="GF">Guiana (Fr.)</option>
                  <option value="GN">Guinea</option>
                  <option value="GW">Guinea Bissau</option>
                  <option value="GY">Guyana</option>
                  <option value="HT">Haiti</option>
                  <option value="HM">Heard and McDonald Isl.</option>
                  <option value="HN">Honduras</option>
                  <option value="HK">Hong Kong</option>
                  <option value="HU">Hungary</option>
                  <option value="IS">Iceland</option>
                  <option value="IN">India</option>
                  <option value="ID">Indonesia</option>
                  <option value="IR">Iran</option>
                  <option value="IQ">Iraq</option>
                  <option value="IE">Ireland</option>
                  <option value="IL">Israel</option>
                  <option value="IT">Italy</option>
                  <option value="CI">Ivory Coast</option>
                  <option value="JM">Jamaica</option>
                  <option value="JP">Japan</option>
                  <option value="JO">Jordan</option>
                  <option value="KZ">Kazachstan</option>
                  <option value="KE">Kenya</option>
                  <option value="KI">Kiribati</option>
                  <option value="KP">Korea (North)</option>
                  <option value="KR">Korea (South)</option>
                  <option value="KW">Kuwait</option>
                  <option value="KG">Kyrgistan</option>
                  <option value="LA">Laos</option>
                  <option value="LV">Latvia</option>
                  <option value="LB">Lebanon</option>
                  <option value="LS">Lesotho</option>
                  <option value="LR">Liberia</option>
                  <option value="LY">Libya</option>
                  <option value="LI">Liechtenstein</option>
                  <option value="LT">Lithuania</option>
                  <option value="LU">Luxembourg</option>
                  <option value="MO">Macau</option>
                  <option value="MK">Macedonia</option>
                  <option value="MG">Madagascar</option>
                  <option value="MW">Malawi</option>
                  <option value="MY">Malaysia</option>
                  <option value="MV">Maldives</option>
                  <option value="ML">Mali</option>
                  <option value="MT">Malta</option>
                  <option value="MH">Marshall Islands</option>
                  <option value="MQ">Martinique (Fr.)</option>
                  <option value="MR">Mauritania</option>
                  <option value="MU">Mauritius</option>
                  <option value="MX">Mexico</option>
                  <option value="FM">Micronesia</option>
                  <option value="MD">Moldavia</option>
                  <option value="MC">Monaco</option>
                  <option value="MN">Mongolia</option>
                  <option value="MS">Montserrat</option>
                  <option value="MA">Morocco</option>
                  <option value="MZ">Mozambique</option>
                  <option value="MM">Myanmar</option>
                  <option value="NA">Namibia</option>
                  <option value="NR">Nauru</option>
                  <option value="NP">Nepal</option>
                  <option value="AN">Netherland Antilles</option>
                  <option value="NL">Netherlands</option>
                  <option value="NT">Neutral Zone</option>
                  <option value="NC">New Caledonia (Fr.)</option>
                  <option value="NZ">New Zealand</option>
                  <option value="NI">Nicaragua</option>
                  <option value="NE">Niger</option>
                  <option value="NG">Nigeria</option>
                  <option value="NU">Niue</option>
                  <option value="NF">Norfolk Island</option>
                  <option value="MP">Northern Mariana Isl.</option>
                  <option value="NO">Norway</option>
                  <option value="OM">Oman</option>
                  <option value="PK">Pakistan</option>
                  <option value="PW">Palau</option>
                  <option value="PA">Panama</option>
                  <option value="PG">Papua New</option>
                  <option value="PY">Paraguay</option>
                  <option value="PE">Peru</option>
                  <option value="PH">Philippines</option>
                  <option value="PN">Pitcairn</option>
                  <option value="PL">Poland</option>
                  <option value="PF">Polynesia (Fr.)</option>
                  <option value="PT">Portugal</option>
                  <option value="PR">Puerto Rico (US)</option>
                  <option value="QA">Qatar</option>
                  <option value="RE">Reunion (Fr.)</option>
                  <option value="RO">Romania</option>
                  <option value="RU">Russian Federation</option>
                  <option value="RW">Rwanda</option>
                  <option value="LC">Saint Lucia</option>
                  <option value="WS">Samoa</option>
                  <option value="SM">San Marino</option>
                  <option value="SA">Saudi Arabia</option>
                  <option value="SN">Senegal</option>
                  <option value="SC">Seychelles</option>
                  <option value="SL">Sierra Leone</option>
                  <option value="SG">Singapore</option>
                  <option value="SK">Slovak Republic</option>
                  <option value="SI">Slovenia</option>
                  <option value="SB">Solomon Islands</option>
                  <option value="SO">Somalia</option>
                  <option value="ZA">South Africa</option>
                  <option value="ES">Spain</option>
                  <option value="LK">Sri Lanka</option>
                  <option value="SH">St. Helena</option>
                  <option value="PM">St. Pierre and Miquelon</option>
                  <option value="ST">St. Tome and Principe</option>
                  <option value="KN">St.Kitts Nevis Anguilla</option>
                  <option value="VC">St.Vincent and Grenadines</option>
                  <option value="SD">Sudan</option>
                  <option value="SR">Suriname</option>
                  <option value="SJ">Svalbard and Jan Mayen Is</option>
                  <option value="SZ">Swaziland</option>
                  <option value="SE">Sweden</option>
                  <option value="CH">Switzerland</option>
                  <option value="SY">Syria</option>
                  <option value="TJ">Tadjikistan</option>
                  <option value="TW">Taiwan</option>
                  <option value="TZ">Tanzania</option>
                  <option value="TH">Thailand</option>
                  <option value="TG">Togo</option>
                  <option value="TK">Tokelau</option>
                  <option value="TO">Tonga</option>
                  <option value="TT">Trinidad and Tobago</option>
                  <option value="TN">Tunisia</option>
                  <option value="TR">Turkey</option>
                  <option value="TM">Turkmenistan</option>
                  <option value="TC">Turks and Caicos Islands</option>
                  <option value="TV">Tuvalu</option>
                  <option value="UG">Uganda</option>
                  <option value="UK">Ukraine</option>
                  <option value="AE">United Arab Emirates</option>
                  <option value="US">United States</option>
                  <option value="UY">Uruguay</option>
                  <option value="UM">US Minor outlying Isl.</option>
                  <option value="UZ">Uzbekistan</option>
                  <option value="VU">Vanuatu</option>
                  <option value="VA">Vatican City State</option>
                  <option value="VE">Venezuela</option>
                  <option value="VN">Vietnam</option>
                  <option value="VG">Virgin Islands (British)</option>
                  <option value="VI">Virgin Islands (US)</option>
                  <option value="WF">Wallis and Futuna Islands</option>
                  <option value="EH">Western Sahara</option>
                  <option value="YE">Yemen</option>
                  <option value="YU">Yugoslavia</option>
                  <option value="ZR">Zaire</option>
                  <option value="ZM">Zambia</option>
                  <option value="ZW">Zimbabwe</option>
              </select>
            <span style="color:#FF0000">*</span>
          </span>
        </td>
      </tr>
      <tr>
        <td width="30%" height="14">
          <span style="font-family:Verdana; font-size:8pt">
            &nbsp;&nbsp;&nbsp; Email 
         </span>
      </td>
      <td width="73%" height="14"><span style="font-family:Verdana; font-size:8pt">
         <input type="text" name="email" size="18" style="border-style: inset; border-width: 1">
         <span style="color:#FF0000">*</span></span></td>
      </tr>
      <tr>
        <td width="30%" height="14"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
          Home Phone</span>
        </td>
        <td width="73%" height="14"><span style="font-family:Verdana; font-size:8pt">
          <input type="text" name="homePhone" size="25" style="border-style: inset; border-width: 1">
          </span>
        </td>
      </tr>
      <tr>
        <td width="30%" height="14"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
        Work Phone</span></td>
        <td width="73%" height="14"><span style="font-family:Verdana; font-size:8pt">
          <input type="text" name="workPhone" size="25" style="border-style: inset; border-width: 1">
          </span>
        </td>
      </tr>
      <tr>
        <td width="30%" height="14"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
        Mobile Phone</span></td>
        <td width="73%" height="14"><span style="font-family:Verdana; font-size:8pt">
  <input type="text" name="mobilePhone" size="25" style="border-style: inset; border-width: 1"></span></td>
      </tr>
    </table>

  <hr color="#99CC00">
  <p style="margin-top: 0; margin-bottom: 1" align="left"><b><span style="font-family:Verdana; font-size:10pt">&nbsp;&nbsp; <u>Shipping Address</u></span></b></p>
  <p style="margin-top: 0; margin-bottom: 1">&nbsp;</p>
  <p style="margin-top: 0; margin-bottom: 1">&nbsp;
  
  <span style="font-family:Verdana; font-size:10pt">&nbsp;<span style="color:#0000FF">My shipping address is same as my billing 
  address</span>&nbsp; 
  <input type="checkbox" name="shipToBill" value="ON"/></span></p>
  <br>
  <p>
    <input type="submit" value="Submit" name="submit" style="color: #336600">&nbsp;&nbsp;&nbsp;
    <input type="reset" value="Reset" name="reset" style="color: #800080">
  </p>
  </form>
</logic:notEqual>
<logic:equal name="GetShippingAddress" value="true" scope="session">
 <form name="addressForm" action="/ifaru/checkout/AddressCapture.do">
 
 <input type="hidden" name="type" value="0"/> <%-- 0 is the type for billing address. See Address.java --%>
  <table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="75%" id="AutoNumber2" height="280">
    <tr>
      <td width="30%" height="22"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
      Title </span></td>
      <td width="76%" height="22"><span style="font-family:Verdana; font-size:8pt">
  <select size="1" name="title">
  <option value="Mr">Mr</option>
  <option value="Mrs">Mrs</option>
  <option value="Miss">Miss</option>
  <option value="Dr">Dr</option>
  <option value="Master">Master</option>
  </select></span></td>
    </tr>
      <tr>
        <td width="30%" height="21">
          <span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
            First Name
          </span>
        </td>
        <td width="73%" height="21"><span style="font-family:Verdana; font-size:8pt">
          <input type="text" name="firstName" size="19" style="border-style: inset; border-width: 1">&nbsp;
          <span style="color:#FF0000">*&nbsp; </span></span>
        </td>
      </tr>
      <tr>
        <td width="30%" height="21">
          <span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
           Last Name
          </span>
        </td>
        <td>
           <input type="text" name="lastName" size="19" style="border-style: inset; border-width: 1">&nbsp;
           <span style="font-family:Verdana; font-size:8pt;color:#FF0000">*</span>
        </td>
      </tr>
    <tr>
      <td width="30%" height="20"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
      Address Line 1</span></td>
      <td width="76%" height="20"><span style="font-family:Verdana; font-size:8pt">
  <input type="text" name="addrLine1" size="50" style="border-style: inset; border-width: 1"><span style="color:#FF0000">*</span>&nbsp;
  </span>
      </td>
    </tr>
    <tr>
      <td width="30%" height="20"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
      Address Line 2</span></td>
      <td width="76%" height="20"><span style="font-family:Verdana; font-size:8pt">
  <input type="text" name="addrLine2" size="50" style="border-style: inset; border-width: 1">&nbsp;
  </span>
      </td>
    </tr>
    <tr>
      <td width="30%" height="20"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
      Address Line 3</span></td>
      <td width="76%" height="20"><span style="font-family:Verdana; font-size:8pt">
  <input type="text" name="addrLine3" size="50" style="border-style: inset; border-width: 1">&nbsp;
  </span>
      </td>
    </tr>
    <tr>
      <td width="30%" height="19"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
      City</span>
      </td>
        <td width="76%" height="19"><span style="font-family:Verdana; font-size:8pt">
           <input type="text" name="city" size="18" style="border-style: inset; border-width: 1">
         <span style="color:#FF0000">*</span>
      
       County/State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
      </td>
    </tr>
    <tr>
      <td width="30%" height="19"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
      Post Code </span></td>
      <td width="76%" height="19"><span style="font-family:Verdana; font-size:8pt">
  <input type="text" name="postCode" size="18" style="border-style: inset; border-width: 1"><span style="color:#FF0000">*</span> </span>
      </td>
    </tr>
    <tr>
      <td width="30%" height="19"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
      County/State</span></td>
      <td width="76%" height="19"><span style="font-family:Verdana; font-size:8pt">
  <input type="text" name="county" size="19" style="border-style: inset; border-width: 1"><span style="color:#FF0000">*</span></span></td>
    </tr>
    <tr>
      <td width="30%" height="19"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
      Country </span></td>
      <td width="76%" height="19"><span style="font-family:Verdana; font-size:8pt">
      <select size="1" name="country" style="border-style: inset; border-width: 1">
          <option value="AF">Afghanistan</option>
          <option value="AL">Albania</option>
          <option value="DZ">Algeria</option>
          <option value="AS">American Samoa</option>
          <option value="AD">Andorra</option>
          <option value="AO">Angola</option>
          <option value="AI">Anguilla</option>
          <option value="AQ">Antarctica</option>
          <option value="AG">Antigua and Barbuda</option>
          <option value="AR">Argentina</option>
          <option value="AM">Armenia</option>
          <option value="AW">Aruba</option>
          <option value="AU">Australia</option>
          <option value="AT">Austria</option>
          <option value="AZ">Azerbaidjan</option>
          <option value="BS">Bahamas</option>
          <option value="BH">Bahrain</option>
          <option value="BD">Banglades</option>
          <option value="BB">Barbados</option>
          <option value="BY">Belarus</option>
          <option value="BE">Belgium</option>
          <option value="BZ">Belize</option>
          <option value="BJ">Benin</option>
          <option value="BM">Bermuda</option>
          <option value="BT">Bhutan</option>
          <option value="BO">Bolivia</option>
          <option value="BA">Bosnia-Herzegovina</option>
          <option value="BW">Botswana</option>
          <option value="BV">Bouvet Island</option>
          <option value="BR">Brazil</option>
          <option value="IO">British Indian O. Terr.</option>
          <option value="BN">Brunei Darussalam</option>
          <option value="BG">Bulgaria</option>
          <option value="BF">Burkina Faso</option>
          <option value="BI">Burundi</option>
          <option value="KH">Cambodia</option>
          <option value="CM">Cameroon</option>
          <option value="CA">Canada</option>
          <option value="CV">Cape Verde</option>
          <option value="KY">Cayman Islands</option>
          <option value="CF">Central African Rep.</option>
          <option value="TD">Chad</option>
          <option value="CL">Chile</option>
          <option value="CN">China</option>
          <option value="CX">Christmas Island</option>
          <option value="CC">Cocos (Keeling) Isl.</option>
          <option value="CO">Colombia</option>
          <option value="KM">Comoros</option>
          <option value="CG">Congo</option>
          <option value="CK">Cook Islands</option>
          <option value="CR">Costa Rica</option>
          <option value="HR">Croatia</option>
          <option value="CU">Cuba</option>
          <option value="CY">Cyprus</option>
          <option value="CZ">Czech Republic</option>
          <option value="CS">Czechoslovakia</option>
          <option value="DK">Denmark</option>
          <option value="DJ">Djibouti</option>
          <option value="DM">Dominica</option>
          <option value="DO">Dominican Republi</option>
          <option value="TP">East Timor</option>
          <option value="EC">Ecuador</option>
          <option value="EG">Egypt</option>
          <option value="SV">El Salvador</option>
          <option value="GQ">Equatorial Guinea</option>
          <option value="EE">Estonia</option>
          <option value="ET">Ethiopia</option>
          <option value="FK">Falkland Isl.(Malvinas)</option>
          <option value="FO">Faroe Islands</option>
          <option value="FJ">Fiji</option>
          <option value="FI">Finland</option>
          <option value="FR">France</option>
          <option value="FX">France (European Ter.)</option>
          <option value="TF">French Southern Terr.</option>
          <option value="GA">Gabon</option>
          <option value="GM">Gambia</option>
          <option value="GE">Georgia</option>
          <option value="DE">Germany</option>
          <option value="GH">Ghana</option>
          <option value="GI">Gibraltar</option>
          <option value="GB">Great Britain (UK)</option>
          <option value="GR">Greece</option>
          <option value="GL">Greenland</option>
          <option value="GD">Grenada</option>
          <option value="GP">Guadeloupe (Fr.)</option>
          <option value="GU">Guam (US)</option>
          <option value="GT">Guatemala</option>
          <option value="GF">Guiana (Fr.)</option>
          <option value="GN">Guinea</option>
          <option value="GW">Guinea Bissau</option>
          <option value="GY">Guyana</option>
          <option value="HT">Haiti</option>
          <option value="HM">Heard and McDonald Isl.</option>
          <option value="HN">Honduras</option>
          <option value="HK">Hong Kong</option>
          <option value="HU">Hungary</option>
          <option value="IS">Iceland</option>
          <option value="IN">India</option>
          <option value="ID">Indonesia</option>
          <option value="IR">Iran</option>
          <option value="IQ">Iraq</option>
          <option value="IE">Ireland</option>
          <option value="IL">Israel</option>
          <option value="IT">Italy</option>
          <option value="CI">Ivory Coast</option>
          <option value="JM">Jamaica</option>
          <option value="JP">Japan</option>
          <option value="JO">Jordan</option>
          <option value="KZ">Kazachstan</option>
          <option value="KE">Kenya</option>
          <option value="KI">Kiribati</option>
          <option value="KP">Korea (North)</option>
          <option value="KR">Korea (South)</option>
          <option value="KW">Kuwait</option>
          <option value="KG">Kyrgistan</option>
          <option value="LA">Laos</option>
          <option value="LV">Latvia</option>
          <option value="LB">Lebanon</option>
          <option value="LS">Lesotho</option>
          <option value="LR">Liberia</option>
          <option value="LY">Libya</option>
          <option value="LI">Liechtenstein</option>
          <option value="LT">Lithuania</option>
          <option value="LU">Luxembourg</option>
          <option value="MO">Macau</option>
          <option value="MK">Macedonia</option>
          <option value="MG">Madagascar</option>
          <option value="MW">Malawi</option>
          <option value="MY">Malaysia</option>
          <option value="MV">Maldives</option>
          <option value="ML">Mali</option>
          <option value="MT">Malta</option>
          <option value="MH">Marshall Islands</option>
          <option value="MQ">Martinique (Fr.)</option>
          <option value="MR">Mauritania</option>
          <option value="MU">Mauritius</option>
          <option value="MX">Mexico</option>
          <option value="FM">Micronesia</option>
          <option value="MD">Moldavia</option>
          <option value="MC">Monaco</option>
          <option value="MN">Mongolia</option>
          <option value="MS">Montserrat</option>
          <option value="MA">Morocco</option>
          <option value="MZ">Mozambique</option>
          <option value="MM">Myanmar</option>
          <option value="NA">Namibia</option>
          <option value="NR">Nauru</option>
          <option value="NP">Nepal</option>
          <option value="AN">Netherland Antilles</option>
          <option value="NL">Netherlands</option>
          <option value="NT">Neutral Zone</option>
          <option value="NC">New Caledonia (Fr.)</option>
          <option value="NZ">New Zealand</option>
          <option value="NI">Nicaragua</option>
          <option value="NE">Niger</option>
          <option value="NG">Nigeria</option>
          <option value="NU">Niue</option>
          <option value="NF">Norfolk Island</option>
          <option value="MP">Northern Mariana Isl.</option>
          <option value="NO">Norway</option>
          <option value="OM">Oman</option>
          <option value="PK">Pakistan</option>
          <option value="PW">Palau</option>
          <option value="PA">Panama</option>
          <option value="PG">Papua New</option>
          <option value="PY">Paraguay</option>
          <option value="PE">Peru</option>
          <option value="PH">Philippines</option>
          <option value="PN">Pitcairn</option>
          <option value="PL">Poland</option>
          <option value="PF">Polynesia (Fr.)</option>
          <option value="PT">Portugal</option>
          <option value="PR">Puerto Rico (US)</option>
          <option value="QA">Qatar</option>
          <option value="RE">Reunion (Fr.)</option>
          <option value="RO">Romania</option>
          <option value="RU">Russian Federation</option>
          <option value="RW">Rwanda</option>
          <option value="LC">Saint Lucia</option>
          <option value="WS">Samoa</option>
          <option value="SM">San Marino</option>
          <option value="SA">Saudi Arabia</option>
          <option value="SN">Senegal</option>
          <option value="SC">Seychelles</option>
          <option value="SL">Sierra Leone</option>
          <option value="SG">Singapore</option>
          <option value="SK">Slovak Republic</option>
          <option value="SI">Slovenia</option>
          <option value="SB">Solomon Islands</option>
          <option value="SO">Somalia</option>
          <option value="ZA">South Africa</option>
          <option value="ES">Spain</option>
          <option value="LK">Sri Lanka</option>
          <option value="SH">St. Helena</option>
          <option value="PM">St. Pierre and Miquelon</option>
          <option value="ST">St. Tome and Principe</option>
          <option value="KN">St.Kitts Nevis Anguilla</option>
          <option value="VC">St.Vincent and Grenadines</option>
          <option value="SD">Sudan</option>
          <option value="SR">Suriname</option>
          <option value="SJ">Svalbard and Jan Mayen Is</option>
          <option value="SZ">Swaziland</option>
          <option value="SE">Sweden</option>
          <option value="CH">Switzerland</option>
          <option value="SY">Syria</option>
          <option value="TJ">Tadjikistan</option>
          <option value="TW">Taiwan</option>
          <option value="TZ">Tanzania</option>
          <option value="TH">Thailand</option>
          <option value="TG">Togo</option>
          <option value="TK">Tokelau</option>
          <option value="TO">Tonga</option>
          <option value="TT">Trinidad and Tobago</option>
          <option value="TN">Tunisia</option>
          <option value="TR">Turkey</option>
          <option value="TM">Turkmenistan</option>
          <option value="TC">Turks and Caicos Islands</option>
          <option value="TV">Tuvalu</option>
          <option value="UG">Uganda</option>
          <option value="UK">Ukraine</option>
          <option value="AE">United Arab Emirates</option>
          <option value="US">United States</option>
          <option value="UY">Uruguay</option>
          <option value="UM">US Minor outlying Isl.</option>
          <option value="UZ">Uzbekistan</option>
          <option value="VU">Vanuatu</option>
          <option value="VA">Vatican City State</option>
          <option value="VE">Venezuela</option>
          <option value="VN">Vietnam</option>
          <option value="VG">Virgin Islands (British)</option>
          <option value="VI">Virgin Islands (US)</option>
          <option value="WF">Wallis and Futuna Islands</option>
          <option value="EH">Western Sahara</option>
          <option value="YE">Yemen</option>
          <option value="YU">Yugoslavia</option>
          <option value="ZR">Zaire</option>
          <option value="ZM">Zambia</option>
          <option value="ZW">Zimbabwe</option>
        </select>
      <span style="color:#FF0000">*</span>
      </span>
      </td>
    </tr>
    <tr>
      <td width="30%" height="19"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
      Email </span></td>
      <td width="76%" height="19"><span style="font-family:Verdana; font-size:8pt">
  <input type="text" name="email" size="18" style="border-style: inset; border-width: 1; padding-left:3">
  <span style="color:#FF0000">*</span>&nbsp;&nbsp;
  </span></td>
    </tr>
    <tr>
      <td width="30%" height="19"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
      Home Phone</span></td>
      <td width="76%" height="19"><span style="font-family:Verdana; font-size:8pt">
  <input type="text" name="homePhone" size="25" style="border-style: inset; border-width: 1"></span></td>
    </tr>
    <tr>
      <td width="30%" height="19"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
      Work Phone</span></td>
      <td width="76%" height="19"><span style="font-family:Verdana; font-size:8pt">
  <input type="text" name="workPhone" size="25" style="border-style: inset; border-width: 1"></span></td>
    </tr>
    <tr>
      <td width="30%" height="19"><span style="font-family:Verdana; font-size:8pt">&nbsp;&nbsp;&nbsp; 
      Mobile Phone</span></td>
      <td width="76%" height="19"><span style="font-family:Verdana; font-size:8pt">
  <input type="text" name="mobilePhone" size="25" style="border-style: inset; border-width: 1"></span></td>
    </tr>
  </table>

 
  <p>
  <input type="submit" value="Submit" name="submit" style="color: #336600">&nbsp;&nbsp;&nbsp;
  <input type="reset" value="Reset" name="reset" style="color: #800080">
  </p>
  </logic:equal>
</form>