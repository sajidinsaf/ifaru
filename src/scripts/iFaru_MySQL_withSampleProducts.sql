# phpMyAdmin MySQL-Dump
# version 2.3.2
# http://www.phpmyadmin.net/ (download page)
#
# Host: localhost
# Generation Time: Nov 15, 2004 at 02:37 AM
# Server version: 3.23.58
# PHP Version: 4.3.5
# Database : `ifaru02_ifaru`
# --------------------------------------------------------

#
# Table structure for table `Categories`
#

drop table Categories;
drop table CategoryProducts;
drop table countries;
drop table EmailTemplates;
drop table OrderShippingAddress;
drop table OrderUserInfo;
drop table OrderedItems;
drop table Orders;
drop table Preferences;
drop table Products;
drop table ShippingCharges;
drop table ShippingCompanies;
drop table UserInfoQuestions;
drop table users;
drop table variables;
Commit;

CREATE TABLE Categories (
  nID int(11) NOT NULL auto_increment,
  nParentID int(11) NOT NULL default '0',
  txtName varchar(100) default NULL,
  txtDescription text,
  txtTitle text,
  txtMeta text,
  txtHeader text,
  txtFooter text,
  txtMetaReplyTo text,
  txtMetaLanguage text,
  txtMetaDistribution text,
  txtMetaCopyright text,
  txtMetaClassification text,
  txtMetaAuthor text,
  txtMetaRevisitAfter text,
  txtMetaDescription text,
  txtMetaRobots text,
  txtMetaKeywords text,
  PRIMARY KEY  (nID)
) TYPE=MyISAM;

#
# Dumping data for table `Categories`
#

INSERT INTO Categories VALUES (1, 0, 'Fragrances', 'Indian, Arabian and Designer Alternative Perfume Free Fragrances, Incense and Accessories', 'Fragrances', '', '', '', '', 'EN', 'global', '', '', '', '14 days', '', 'all', '');
INSERT INTO Categories VALUES (2, 0, 'Jewellery', 'Ethinic and Costume Jewellery', 'Jewellery', '', '', '', '', 'EN', 'global', '', '', '', '14 days', '', 'all', '');
INSERT INTO Categories VALUES (3, 0, 'Lifestyle', 'Enahnce your lifestyle with iFaru Home Embellishments', 'LifeStyle', '', '', '', '', 'EN', 'global', '', '', '', '14 days', '', 'all', '');
# --------------------------------------------------------

#
# Table structure for table `CategoryProducts`
#

CREATE TABLE CategoryProducts (
  nCategoryID int(11) NOT NULL default '0',
  nProductID int(11) NOT NULL default '0',
  nOrder int(11) NOT NULL default '0'
) TYPE=MyISAM;

#
# Dumping data for table `CategoryProducts`
#

INSERT INTO CategoryProducts VALUES (1, 20, 0);
INSERT INTO CategoryProducts VALUES (1, 19, 0);
INSERT INTO CategoryProducts VALUES (1, 18, 0);
INSERT INTO CategoryProducts VALUES (1, 17, 0);
INSERT INTO CategoryProducts VALUES (1, 16, 0);
INSERT INTO CategoryProducts VALUES (2, 22, 0);
INSERT INTO CategoryProducts VALUES (2, 21, 0);
INSERT INTO CategoryProducts VALUES (3, 23, 0);
# --------------------------------------------------------

#
# Table structure for table `Countries`
#

CREATE TABLE Countries (
  txtID char(2) NOT NULL default '',
  txtName varchar(40) NOT NULL default '',
  dblRegisteredPost double NOT NULL default '15',
  dblExpressCourier double NOT NULL default '20',
  PRIMARY KEY  (txtID)
) TYPE=MyISAM;

#
# Dumping data for table `Countries`
#

INSERT INTO Countries VALUES ('AF', 'Afghanistan', '15', '20');
INSERT INTO Countries VALUES ('AL', 'Albania', '15', '20');
INSERT INTO Countries VALUES ('DZ', 'Algeria', '15', '20');
INSERT INTO Countries VALUES ('AS', 'American Samoa', '15', '20');
INSERT INTO Countries VALUES ('AD', 'Andorra', '15', '20');
INSERT INTO Countries VALUES ('AO', 'Angola', '15', '20');
INSERT INTO Countries VALUES ('AI', 'Anguilla', '15', '20');
INSERT INTO Countries VALUES ('AQ', 'Antarctica', '15', '20');
INSERT INTO Countries VALUES ('AG', 'Antigua and Barbuda', '15', '20');
INSERT INTO Countries VALUES ('AR', 'Argentina', '15', '20');
INSERT INTO Countries VALUES ('AM', 'Armenia', '15', '20');
INSERT INTO Countries VALUES ('AW', 'Aruba', '15', '20');
INSERT INTO Countries VALUES ('AU', 'Australia', '15', '20');
INSERT INTO Countries VALUES ('AT', 'Austria', '15', '20');
INSERT INTO Countries VALUES ('AZ', 'Azerbaidjan', '15', '20');
INSERT INTO Countries VALUES ('BS', 'Bahamas', '15', '20');
INSERT INTO Countries VALUES ('BH', 'Bahrain', '15', '20');
INSERT INTO Countries VALUES ('BD', 'Banglades', '15', '20');
INSERT INTO Countries VALUES ('BB', 'Barbados', '15', '20');
INSERT INTO Countries VALUES ('BY', 'Belarus', '15', '20');
INSERT INTO Countries VALUES ('BE', 'Belgium', '15', '20');
INSERT INTO Countries VALUES ('BZ', 'Belize', '15', '20');
INSERT INTO Countries VALUES ('BJ', 'Benin', '15', '20');
INSERT INTO Countries VALUES ('BM', 'Bermuda', '15', '20');
INSERT INTO Countries VALUES ('BT', 'Bhutan', '15', '20');
INSERT INTO Countries VALUES ('BO', 'Bolivia', '15', '20');
INSERT INTO Countries VALUES ('BA', 'Bosnia-Herzegovina', '15', '20');
INSERT INTO Countries VALUES ('BW', 'Botswana', '15', '20');
INSERT INTO Countries VALUES ('BV', 'Bouvet Island', '15', '20');
INSERT INTO Countries VALUES ('BR', 'Brazil', '15', '20');
INSERT INTO Countries VALUES ('IO', 'British Indian O. Terr.', '15', '20');
INSERT INTO Countries VALUES ('BN', 'Brunei Darussalam', '15', '20');
INSERT INTO Countries VALUES ('BG', 'Bulgaria', '15', '20');
INSERT INTO Countries VALUES ('BF', 'Burkina Faso', '15', '20');
INSERT INTO Countries VALUES ('BI', 'Burundi', '15', '20');
INSERT INTO Countries VALUES ('KH', 'Cambodia', '15', '20');
INSERT INTO Countries VALUES ('CM', 'Cameroon', '15', '20');
INSERT INTO Countries VALUES ('CA', 'Canada', '15', '20');
INSERT INTO Countries VALUES ('CV', 'Cape Verde', '15', '20');
INSERT INTO Countries VALUES ('KY', 'Cayman Islands', '15', '20');
INSERT INTO Countries VALUES ('CF', 'Central African Rep.', '15', '20');
INSERT INTO Countries VALUES ('TD', 'Chad', '15', '20');
INSERT INTO Countries VALUES ('CL', 'Chile', '15', '20');
INSERT INTO Countries VALUES ('CN', 'China', '15', '20');
INSERT INTO Countries VALUES ('CX', 'Christmas Island', '15', '20');
INSERT INTO Countries VALUES ('CC', 'Cocos (Keeling) Isl.', '15', '20');
INSERT INTO Countries VALUES ('CO', 'Colombia', '15', '20');
INSERT INTO Countries VALUES ('KM', 'Comoros', '15', '20');
INSERT INTO Countries VALUES ('CG', 'Congo', '15', '20');
INSERT INTO Countries VALUES ('CK', 'Cook Islands', '15', '20');
INSERT INTO Countries VALUES ('CR', 'Costa Rica', '15', '20');
INSERT INTO Countries VALUES ('HR', 'Croatia', '15', '20');
INSERT INTO Countries VALUES ('CU', 'Cuba', '15', '20');
INSERT INTO Countries VALUES ('CY', 'Cyprus', '15', '20');
INSERT INTO Countries VALUES ('CZ', 'Czech Republic', '15', '20');
INSERT INTO Countries VALUES ('CS', 'Czechoslovakia', '15', '20');
INSERT INTO Countries VALUES ('DK', 'Denmark', '15', '20');
INSERT INTO Countries VALUES ('DJ', 'Djibouti', '15', '20');
INSERT INTO Countries VALUES ('DM', 'Dominica', '15', '20');
INSERT INTO Countries VALUES ('DO', 'Dominican Republi', '15', '20');
INSERT INTO Countries VALUES ('TP', 'East Timor', '15', '20');
INSERT INTO Countries VALUES ('EC', 'Ecuador', '15', '20');
INSERT INTO Countries VALUES ('EG', 'Egypt', '15', '20');
INSERT INTO Countries VALUES ('SV', 'El Salvador', '15', '20');
INSERT INTO Countries VALUES ('GQ', 'Equatorial Guinea', '15', '20');
INSERT INTO Countries VALUES ('EE', 'Estonia', '15', '20');
INSERT INTO Countries VALUES ('ET', 'Ethiopia', '15', '20');
INSERT INTO Countries VALUES ('FK', 'Falkland Isl.(Malvinas)', '15', '20');
INSERT INTO Countries VALUES ('FO', 'Faroe Islands', '15', '20');
INSERT INTO Countries VALUES ('FJ', 'Fiji', '15', '20');
INSERT INTO Countries VALUES ('FI', 'Finland', '15', '20');
INSERT INTO Countries VALUES ('FR', 'France', '15', '20');
INSERT INTO Countries VALUES ('FX', 'France (European Ter.)', '15', '20');
INSERT INTO Countries VALUES ('TF', 'French Southern Terr.', '15', '20');
INSERT INTO Countries VALUES ('GA', 'Gabon', '15', '20');
INSERT INTO Countries VALUES ('GM', 'Gambia', '15', '20');
INSERT INTO Countries VALUES ('GE', 'Georgia', '15', '20');
INSERT INTO Countries VALUES ('DE', 'Germany', '15', '20');
INSERT INTO Countries VALUES ('GH', 'Ghana', '15', '20');
INSERT INTO Countries VALUES ('GI', 'Gibraltar', '15', '20');
INSERT INTO Countries VALUES ('GB', 'Great Britain (UK)', '15', '20');
INSERT INTO Countries VALUES ('GR', 'Greece', '15', '20');
INSERT INTO Countries VALUES ('GL', 'Greenland', '15', '20');
INSERT INTO Countries VALUES ('GD', 'Grenada', '15', '20');
INSERT INTO Countries VALUES ('GP', 'Guadeloupe (Fr.)', '15', '20');
INSERT INTO Countries VALUES ('GU', 'Guam (US)', '15', '20');
INSERT INTO Countries VALUES ('GT', 'Guatemala', '15', '20');
INSERT INTO Countries VALUES ('GF', 'Guiana (Fr.)', '15', '20');
INSERT INTO Countries VALUES ('GN', 'Guinea', '15', '20');
INSERT INTO Countries VALUES ('GW', 'Guinea Bissau', '15', '20');
INSERT INTO Countries VALUES ('GY', 'Guyana', '15', '20');
INSERT INTO Countries VALUES ('HT', 'Haiti', '15', '20');
INSERT INTO Countries VALUES ('HM', 'Heard and McDonald Isl.', '15', '20');
INSERT INTO Countries VALUES ('HN', 'Honduras', '15', '20');
INSERT INTO Countries VALUES ('HK', 'Hong Kong', '15', '20');
INSERT INTO Countries VALUES ('HU', 'Hungary', '15', '20');
INSERT INTO Countries VALUES ('IS', 'Iceland', '15', '20');
INSERT INTO Countries VALUES ('IN', 'India', '15', '20');
INSERT INTO Countries VALUES ('ID', 'Indonesia', '15', '20');
INSERT INTO Countries VALUES ('IR', 'Iran', '15', '20');
INSERT INTO Countries VALUES ('IQ', 'Iraq', '15', '20');
INSERT INTO Countries VALUES ('IE', 'Ireland', '15', '20');
INSERT INTO Countries VALUES ('IL', 'Israel', '15', '20');
INSERT INTO Countries VALUES ('IT', 'Italy', '15', '20');
INSERT INTO Countries VALUES ('CI', 'Ivory Coast', '15', '20');
INSERT INTO Countries VALUES ('JM', 'Jamaica', '15', '20');
INSERT INTO Countries VALUES ('JP', 'Japan', '15', '20');
INSERT INTO Countries VALUES ('JO', 'Jordan', '15', '20');
INSERT INTO Countries VALUES ('KZ', 'Kazachstan', '15', '20');
INSERT INTO Countries VALUES ('KE', 'Kenya', '15', '20');
INSERT INTO Countries VALUES ('KI', 'Kiribati', '15', '20');
INSERT INTO Countries VALUES ('KP', 'Korea (North)', '15', '20');
INSERT INTO Countries VALUES ('KR', 'Korea (South)', '15', '20');
INSERT INTO Countries VALUES ('KW', 'Kuwait', '15', '20');
INSERT INTO Countries VALUES ('KG', 'Kyrgistan', '15', '20');
INSERT INTO Countries VALUES ('LA', 'Laos', '15', '20');
INSERT INTO Countries VALUES ('LV', 'Latvia', '15', '20');
INSERT INTO Countries VALUES ('LB', 'Lebanon', '15', '20');
INSERT INTO Countries VALUES ('LS', 'Lesotho', '15', '20');
INSERT INTO Countries VALUES ('LR', 'Liberia', '15', '20');
INSERT INTO Countries VALUES ('LY', 'Libya', '15', '20');
INSERT INTO Countries VALUES ('LI', 'Liechtenstein', '15', '20');
INSERT INTO Countries VALUES ('LT', 'Lithuania', '15', '20');
INSERT INTO Countries VALUES ('LU', 'Luxembourg', '15', '20');
INSERT INTO Countries VALUES ('MO', 'Macau', '15', '20');
INSERT INTO Countries VALUES ('MK', 'Macedonia', '15', '20');
INSERT INTO Countries VALUES ('MG', 'Madagascar', '15', '20');
INSERT INTO Countries VALUES ('MW', 'Malawi', '15', '20');
INSERT INTO Countries VALUES ('MY', 'Malaysia', '15', '20');
INSERT INTO Countries VALUES ('MV', 'Maldives', '15', '20');
INSERT INTO Countries VALUES ('ML', 'Mali', '15', '20');
INSERT INTO Countries VALUES ('MT', 'Malta', '15', '20');
INSERT INTO Countries VALUES ('MH', 'Marshall Islands', '15', '20');
INSERT INTO Countries VALUES ('MQ', 'Martinique (Fr.)', '15', '20');
INSERT INTO Countries VALUES ('MR', 'Mauritania', '15', '20');
INSERT INTO Countries VALUES ('MU', 'Mauritius', '15', '20');
INSERT INTO Countries VALUES ('MX', 'Mexico', '15', '20');
INSERT INTO Countries VALUES ('FM', 'Micronesia', '15', '20');
INSERT INTO Countries VALUES ('MD', 'Moldavia', '15', '20');
INSERT INTO Countries VALUES ('MC', 'Monaco', '15', '20');
INSERT INTO Countries VALUES ('MN', 'Mongolia', '15', '20');
INSERT INTO Countries VALUES ('MS', 'Montserrat', '15', '20');
INSERT INTO Countries VALUES ('MA', 'Morocco', '15', '20');
INSERT INTO Countries VALUES ('MZ', 'Mozambique', '15', '20');
INSERT INTO Countries VALUES ('MM', 'Myanmar', '15', '20');
INSERT INTO Countries VALUES ('NA', 'Namibia', '15', '20');
INSERT INTO Countries VALUES ('NR', 'Nauru', '15', '20');
INSERT INTO Countries VALUES ('NP', 'Nepal', '15', '20');
INSERT INTO Countries VALUES ('AN', 'Netherland Antilles', '15', '20');
INSERT INTO Countries VALUES ('NL', 'Netherlands', '15', '20');
INSERT INTO Countries VALUES ('NT', 'Neutral Zone', '15', '20');
INSERT INTO Countries VALUES ('NC', 'New Caledonia (Fr.)', '15', '20');
INSERT INTO Countries VALUES ('NZ', 'New Zealand', '15', '20');
INSERT INTO Countries VALUES ('NI', 'Nicaragua', '15', '20');
INSERT INTO Countries VALUES ('NE', 'Niger', '15', '20');
INSERT INTO Countries VALUES ('NG', 'Nigeria', '15', '20');
INSERT INTO Countries VALUES ('NU', 'Niue', '15', '20');
INSERT INTO Countries VALUES ('NF', 'Norfolk Island', '15', '20');
INSERT INTO Countries VALUES ('MP', 'Northern Mariana Isl.', '15', '20');
INSERT INTO Countries VALUES ('NO', 'Norway', '15', '20');
INSERT INTO Countries VALUES ('OM', 'Oman', '15', '20');
INSERT INTO Countries VALUES ('PK', 'Pakistan', '15', '20');
INSERT INTO Countries VALUES ('PW', 'Palau', '15', '20');
INSERT INTO Countries VALUES ('PA', 'Panama', '15', '20');
INSERT INTO Countries VALUES ('PG', 'Papua New', '15', '20');
INSERT INTO Countries VALUES ('PY', 'Paraguay', '15', '20');
INSERT INTO Countries VALUES ('PE', 'Peru', '15', '20');
INSERT INTO Countries VALUES ('PH', 'Philippines', '15', '20');
INSERT INTO Countries VALUES ('PN', 'Pitcairn', '15', '20');
INSERT INTO Countries VALUES ('PL', 'Poland', '15', '20');
INSERT INTO Countries VALUES ('PF', 'Polynesia (Fr.)', '15', '20');
INSERT INTO Countries VALUES ('PT', 'Portugal', '15', '20');
INSERT INTO Countries VALUES ('PR', 'Puerto Rico (US)', '15', '20');
INSERT INTO Countries VALUES ('QA', 'Qatar', '15', '20');
INSERT INTO Countries VALUES ('RE', 'Reunion (Fr.)', '15', '20');
INSERT INTO Countries VALUES ('RO', 'Romania', '15', '20');
INSERT INTO Countries VALUES ('RU', 'Russian Federation', '15', '20');
INSERT INTO Countries VALUES ('RW', 'Rwanda', '15', '20');
INSERT INTO Countries VALUES ('LC', 'Saint Lucia', '15', '20');
INSERT INTO Countries VALUES ('WS', 'Samoa', '15', '20');
INSERT INTO Countries VALUES ('SM', 'San Marino', '15', '20');
INSERT INTO Countries VALUES ('SA', 'Saudi Arabia', '15', '20');
INSERT INTO Countries VALUES ('SN', 'Senegal', '15', '20');
INSERT INTO Countries VALUES ('SC', 'Seychelles', '15', '20');
INSERT INTO Countries VALUES ('SL', 'Sierra Leone', '15', '20');
INSERT INTO Countries VALUES ('SG', 'Singapore', '15', '20');
INSERT INTO Countries VALUES ('SK', 'Slovak Republic', '15', '20');
INSERT INTO Countries VALUES ('SI', 'Slovenia', '15', '20');
INSERT INTO Countries VALUES ('SB', 'Solomon Islands', '15', '20');
INSERT INTO Countries VALUES ('SO', 'Somalia', '15', '20');
INSERT INTO Countries VALUES ('ZA', 'South Africa', '15', '20');
INSERT INTO Countries VALUES ('ES', 'Spain', '15', '20');
INSERT INTO Countries VALUES ('LK', 'Sri Lanka', '15', '20');
INSERT INTO Countries VALUES ('SH', 'St. Helena', '15', '20');
INSERT INTO Countries VALUES ('PM', 'St. Pierre and Miquelon', '15', '20');
INSERT INTO Countries VALUES ('ST', 'St. Tome and Principe', '15', '20');
INSERT INTO Countries VALUES ('KN', 'St.Kitts Nevis Anguilla', '15', '20');
INSERT INTO Countries VALUES ('VC', 'St.Vincent and Grenadines', '15', '20');
INSERT INTO Countries VALUES ('SD', 'Sudan', '15', '20');
INSERT INTO Countries VALUES ('SR', 'Suriname', '15', '20');
INSERT INTO Countries VALUES ('SJ', 'Svalbard and Jan Mayen Is', '15', '20');
INSERT INTO Countries VALUES ('SZ', 'Swaziland', '15', '20');
INSERT INTO Countries VALUES ('SE', 'Sweden', '15', '20');
INSERT INTO Countries VALUES ('CH', 'Switzerland', '15', '20');
INSERT INTO Countries VALUES ('SY', 'Syria', '15', '20');
INSERT INTO Countries VALUES ('TJ', 'Tadjikistan', '15', '20');
INSERT INTO Countries VALUES ('TW', 'Taiwan', '15', '20');
INSERT INTO Countries VALUES ('TZ', 'Tanzania', '15', '20');
INSERT INTO Countries VALUES ('TH', 'Thailand', '15', '20');
INSERT INTO Countries VALUES ('TG', 'Togo', '15', '20');
INSERT INTO Countries VALUES ('TK', 'Tokelau', '15', '20');
INSERT INTO Countries VALUES ('TO', 'Tonga', '15', '20');
INSERT INTO Countries VALUES ('TT', 'Trinidad and Tobago', '15', '20');
INSERT INTO Countries VALUES ('TN', 'Tunisia', '15', '20');
INSERT INTO Countries VALUES ('TR', 'Turkey', '15', '20');
INSERT INTO Countries VALUES ('TM', 'Turkmenistan', '15', '20');
INSERT INTO Countries VALUES ('TC', 'Turks and Caicos Islands', '15', '20');
INSERT INTO Countries VALUES ('TV', 'Tuvalu', '15', '20');
INSERT INTO Countries VALUES ('UG', 'Uganda', '15', '20');
INSERT INTO Countries VALUES ('UK', 'Ukraine', '15', '20');
INSERT INTO Countries VALUES ('AE', 'United Arab Emirates', '15', '20');
INSERT INTO Countries VALUES ('US', 'United States', '15', '20');
INSERT INTO Countries VALUES ('UY', 'Uruguay', '15', '20');
INSERT INTO Countries VALUES ('UM', 'US Minor outlying Isl.', '15', '20');
INSERT INTO Countries VALUES ('UZ', 'Uzbekistan', '15', '20');
INSERT INTO Countries VALUES ('VU', 'Vanuatu', '15', '20');
INSERT INTO Countries VALUES ('VA', 'Vatican City State', '15', '20');
INSERT INTO Countries VALUES ('VE', 'Venezuela', '15', '20');
INSERT INTO Countries VALUES ('VN', 'Vietnam', '15', '20');
INSERT INTO Countries VALUES ('VG', 'Virgin Islands (British)', '15', '20');
INSERT INTO Countries VALUES ('VI', 'Virgin Islands (US)', '15', '20');
INSERT INTO Countries VALUES ('WF', 'Wallis and Futuna Islands', '15', '20');
INSERT INTO Countries VALUES ('EH', 'Western Sahara', '15', '20');
INSERT INTO Countries VALUES ('YE', 'Yemen', '15', '20');
INSERT INTO Countries VALUES ('YU', 'Yugoslavia', '15', '20');
INSERT INTO Countries VALUES ('ZR', 'Zaire', '15', '20');
INSERT INTO Countries VALUES ('ZM', 'Zambia', '15', '20');
INSERT INTO Countries VALUES ('ZW', 'Zimbabwe', '15', '20');
# --------------------------------------------------------

#
# Table structure for table `EmailTemplates`
#

CREATE TABLE EmailTemplates (
  txtName varchar(50) NOT NULL default '',
  txtSubject text NOT NULL,
  txtMessage text NOT NULL,
  txtVariables text NOT NULL,
  PRIMARY KEY  (txtName)
) TYPE=MyISAM;

#
# Dumping data for table `EmailTemplates`
#

INSERT INTO EmailTemplates VALUES ('ForgotPassword', 'Your $SHOPNAME$ Password', 'Dear $USER$<br>,\r\n<br>\r\nYour password is $PASSWORD$.<br>\r\n<br>\r\n- $SHOPCOMPANY$', '$SHOPNAME$,$USER$,$PASSWORD$,$SHOPCOMPANY$');
INSERT INTO EmailTemplates VALUES ('OrderStatus', 'Status of your $SHOPNAME$ - order $ID$', '<font face=verdana size=2>Dear $USER$,\r\n\r\nThis is the status of your ORDER no. $ID$ on $SHOPNAME$.\r\n<BR>\r\n<HR size=1>\r\nOrder ID : $ID$<BR>\r\nDate : $ORDERDATE$<BR>\r\nAmount : $ORDERAMOUNT$<BR>\r\n\r\nStatus : $ORDERSTATUS$<BR>\r\n\r\nRemarks : $REMARKS$<BR>\r\n\r\nTracking : $TRACKING$<BR>\r\n<BR>\r\n<BR>\r\n\r\nFor More details of ORDER please login to your account at $SHOPWEBADDRESS$<BR>\r\n<BR>\r\nThanks,<BR>\r\n$SHOPNAME$ Staff<BR></font>', '$SHOPNAME$,$ORDERID$,$USER$');
INSERT INTO EmailTemplates VALUES ('Signup', 'Thank you for registering at $SHOPNAME$', '<PRE>\r\nDear $USER$,\r\n\r\nThank you for registering at $SHOPNAME$, we will be happy to provide our best services to you at very reasonable costs.\r\n\r\n- $SHOPNAME$ Staff\r\n</PRE>', '');
INSERT INTO EmailTemplates VALUES ('PendingPayment', 'Pending Order - $ID$ at $SHOPNAME$', '<pre>\r\nDear $USER$,\r\n\r\nPayment for order $ID$ is still pending.\r\n\r\nPlease pay soon so that we process the order.\r\n\r\n- $SHOPNAME$ Staff\r\n</pre>', '');
# --------------------------------------------------------

#
# Table structure for table `OrderShippingAddress`
#

CREATE TABLE OrderShippingAddress (
  nOrderID int(11) NOT NULL default '0',
  txtName varchar(20) default NULL,
  txtStreetAddress text,
  txtZipCode varchar(20) default NULL,
  txtCity varchar(20) default NULL,
  txtState varchar(20) default NULL,
  txtCountry varchar(20) default NULL,
  txtPhone varchar(25) default NULL,
  txtShippingMethod varchar(20) NOT NULL default '',
  PRIMARY KEY  (nOrderID)
) TYPE=MyISAM;

#
# Dumping data for table `OrderShippingAddress`
#

# --------------------------------------------------------

#
# Table structure for table `OrderUserInfo`
#

CREATE TABLE OrderUserInfo (
  nQuestionID int(11) NOT NULL default '0',
  nOrderID int(11) NOT NULL default '0',
  nType int(11) NOT NULL default '0',
  txtTitle text,
  txtValue text
) TYPE=MyISAM;

#
# Dumping data for table `OrderUserInfo`
#

# --------------------------------------------------------

#
# Table structure for table `OrderedItems`
#

CREATE TABLE OrderedItems (
  nOrderID int(50) NOT NULL default '0',
  nProductID int(11) NOT NULL default '0',
  dblPrice double NOT NULL default '0',
  dblCost double NOT NULL default '0',
  nQuantity int(11) NOT NULL default '0',
  txtReason text
) TYPE=MyISAM;

#
# Dumping data for table `OrderedItems`
#

# --------------------------------------------------------

#
# Table structure for table `Orders`
#

CREATE TABLE Orders (
  nID int(11) NOT NULL auto_increment,
  txtEmailAddress varchar(50) NOT NULL default '',
  tsChangeTime timestamp(14) NOT NULL,
  tsDate timestamp(14) NOT NULL,
  nOrderState int(11) NOT NULL default '0',
  dblTotal double NOT NULL default '0',
  dblProcessingFees double NOT NULL default '0',
  dblShippingCharges double NOT NULL default '0',
  dblGrandTotal double NOT NULL default '0',
  dblPaid double NOT NULL default '0',
  txtRemarks text,
  txtTracking text,
  txtTrackingCompany text,
  txtTrackingURL text,
  PRIMARY KEY  (nID)
) TYPE=MyISAM;

#
# Dumping data for table `Orders`
#

# --------------------------------------------------------

#
# Table structure for table `Preferences`
#

CREATE TABLE Preferences (
  txtName varchar(100) NOT NULL default '',
  txtValue text
) TYPE=MyISAM;

#
# Dumping data for table `Preferences`
#

INSERT INTO Preferences VALUES ('ifaru.cart.preferences.LoginPage.txtHeader', '');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.LoginPage.txtFooter', '');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.ProductListPage.txtHeader', '');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.LoginPage.txtTitle', '');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.ProductListPage.txtFooter', '');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.ProductListPage.txtTitle', '');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.CartPage.txtHeader', '');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.CartPage.txtFooter', '');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.CartPage.txtTitle', '');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.SignupPage.txtHeader', '');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.SignupPage.txtFooter', '');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.SignupPage.txtTitle', '');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.GlobalPage.txtHeader', '<center>\r\n<TABLE cellSpacing=1 cellPadding=1 width=600 bgColor=#0000ff border=0>\r\n  \r\n  <TR>\r\n    <TD bgColor=#ffffff colSpan=2>\r\n      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>\r\n        \r\n        <TR>\r\n          <TD><FONT size=5>iFaru</FONT></TD>\r\n          <TD>   \r\n            <TABLE cellSpacing=0 cellPadding=0 align=right border=0 style="WIDTH: 250px" width=250 \r\n           >\r\n              \r\n              <TR>\r\n                <TD align=right><A href="/ifaru/">Home</A></TD>\r\n                <TD align=right><A \r\n                  href="/ifaru/pages/cart/Category.jsp">Products</A></TD>\r\n                <TD align=right><A \r\n                  href="/ifaru/about.html">About</A></TD>\r\n                <TD align=right \r\n            ><A \r\n                  href="/ifaru/contact.html">Contact</A></TD>\r\n              </TR>\r\n            </TABLE>\r\n          </TD></TR></TABLE></TD></TR>\r\n  <TR>\r\n    <TD bgColor=#ffffff \r\n      style="WIDTH: 75px" width=75 vAlign=top><A \r\n      href="/ifaru/pages/users/MyAccount.jsp">Login</A><BR><A \r\n      href="/ifaru/pages/users/MyAccount.jsp">My Account</A> <BR><A \r\n      href="/ifaru/pages/cart/Cart.jsp">Cart</A><BR></TD>\r\n    <TD bgColor=#ffffff width="525" align=center valign=top>\r\n<BR>\r\n<BR>');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.GlobalPage.txtFooter', '    <br>\r\n    <br>\r\n    </TD></TR>\r\n  <TR>\r\n    <TD align=middle bgColor=#ffffff \r\ncolSpan=2> All \r\n      Rights Reserved , iFaru<BR>Usage of this website is subjected to <A href="/ifaru/useragreement.html">User \r\nAgreement</A></TD></TR></TABLE>\r\n</center>');
INSERT INTO Preferences VALUES ('ifaru.cart.preferences.GlobalPage.txtTitle', 'Online Shopping - iFaru');
# --------------------------------------------------------

#
# Table structure for table `Products`
#

CREATE TABLE Products (
  nID int(11) NOT NULL default '0',
  txtName varchar(100) NOT NULL default '',
  txtDescription text,
  txtImgUrl text,
  txtHeader text,
  txtFooter text,
  txtBuyNowUrl text,
  txtWeight varchar(50) NOT NULL default '',
  dblQtyPerPack double NOT NULL default '1',
  dblPricePerQty double NOT NULL default '0',
  bActive int(11) NOT NULL default '0',
  dblPrice double NOT NULL default '0',
  dblDummyPrice double NOT NULL default '0',
  dblShippingFactor double NOT NULL default '0',
  dblCostPerQty double NOT NULL default '0',
  dblCost double NOT NULL default '0',
  PRIMARY KEY  (nID)
) TYPE=MyISAM;

#
# Dumping data for table `Products`
#


INSERT INTO Products VALUES (22, 'Bangle-Bracelet', 'Beautiful Bangle/Bracelets in Gorgeous Colours Embellished With Delicate Bugle beads with dangling silver tone hearts', NULL, NULL, NULL, NULL, '', '1', '3.49', 0, '3.49', '5.99', '0', '0', '0');
INSERT INTO Products VALUES (21, 'Costume Ring', 'Stunning Adjustable Pink Rhinestone Crystals Ring', NULL, NULL, NULL, NULL, '', '1', '2.69', 1, '2.69', '4.29', '0', '0', '0');
INSERT INTO Products VALUES (20, 'Jasmine', 'A wonderfully fragrant traditional hydro-distilled Juhi (Jasmine Auriculatum) attar from India', NULL, NULL, NULL, NULL, '', '1', '2.99', 1, '2.99', '4.99', '0', '0', '0');
INSERT INTO Products VALUES (19, 'Muskulward (Musk Rose)', 'A powerful blend of musk softened with sweet and fresh roses', NULL, NULL, NULL, NULL, '', '1', '2.99', 1, '2.99', '4.99', '0', '0', '0');
INSERT INTO Products VALUES (18, 'Dehnal Oudh', 'A pleasing oriental woody masculine fragrance', NULL, NULL, NULL, NULL, '', '1', '8.99', 1, '8.99', '11.99', '0', '0', '0');
INSERT INTO Products VALUES (17, 'Chanel No.5', 'A bouquet of abstract flowers with an indefinable femininity', NULL, NULL, NULL, NULL, '1', '1', '2.99', 1, '2.99', '4.99', '0', '0', '0');
INSERT INTO Products VALUES (16, 'Rose', 'A wonderfully fragrant traditional hydro-distilled Rose attar (Rosa Damascena) - from India', '', '', '', '', '1', '1', '2.99', 1, '2.99', '4.99', '0', '0', '0');
INSERT INTO Products VALUES (23, 'Cushion covers', 'Beautiful ethnic cushion covers to beautify your home', '', NULL, NULL, NULL, '', '1', '9.99', 1, '9.99', '13.99', '0', '0', '0');
# --------------------------------------------------------


#
# Table structure for table `ShippingCharges`
#

CREATE TABLE ShippingCharges (
  txtCountryID varchar(40) NOT NULL default '',
  dblExpressCourier double NOT NULL default '0',
  dblRegisteredMail double NOT NULL default '0',
  PRIMARY KEY  (txtCountryID)
) TYPE=MyISAM;

#
# Dumping data for table `ShippingCharges`
#

# --------------------------------------------------------

#
# Table structure for table `ShippingCompanies`
#

CREATE TABLE ShippingCompanies (
  nID int(11) NOT NULL auto_increment,
  txtName varchar(100) NOT NULL default '',
  txtURL text,
  txtTrackingURL text,
  PRIMARY KEY  (nID)
) TYPE=MyISAM;

#
# Dumping data for table `ShippingCompanies`
#

INSERT INTO ShippingCompanies VALUES (1, 'RoyalMail', 'http://www.royalmail.com', 'http://www.royalmail.com/portal/rm/track');
# --------------------------------------------------------

#
# Table structure for table `UserInfoQuestions`
#

CREATE TABLE UserInfoQuestions (
  nID int(11) NOT NULL auto_increment,
  txtTitle text,
  nType int(11) NOT NULL default '0',
  txtChoices text,
  txtAcceptOnly text,
  txtRejectOnly text,
  txtErrorMsg text,
  PRIMARY KEY  (nID)
) TYPE=MyISAM;

#
# Dumping data for table `UserInfoQuestions`
#

INSERT INTO UserInfoQuestions VALUES (1, 'Personal Information', 1, '', '', '', 'null');
INSERT INTO UserInfoQuestions VALUES (2, 'Age', 3, '13-18,19-24,25-30,31-40,41-50,51-60', '', '', 'Please specify your age');
INSERT INTO UserInfoQuestions VALUES (3, 'Gender', 4, 'Male,Female', 'Male,Female', '', 'Please select your gender');
INSERT INTO UserInfoQuestions VALUES (4, 'Height', 3, '4-4.11\'\',5-5.11\'\',6-6.11\'\'', '', '', 'Please select your height');
INSERT INTO UserInfoQuestions VALUES (5, 'Weight (in pounds)', 2, '', '', '', '');
INSERT INTO UserInfoQuestions VALUES (6, '', 0, '', '', '', '');
# --------------------------------------------------------

#
# Table structure for table `Users`
#

CREATE TABLE Users (
  txtEmailAddress varchar(50) NOT NULL default '',
  txtPassword varchar(50) NOT NULL default '',
  nACLBitmap bigint(20) NOT NULL default '1',
  txtFirstname varchar(20) NOT NULL default '',
  txtLastname varchar(20) NOT NULL default '',
  txtStreetAddress text,
  txtZipCode varchar(20) NOT NULL default '',
  txtCity varchar(15) NOT NULL default '',
  txtState varchar(15) NOT NULL default '',
  txtCountry varchar(40) NOT NULL default '',
  txtPhone varchar(25) NOT NULL default '',
  txtReference varchar(100) NOT NULL default '',
  txtReferredBy varchar(40) NOT NULL default '""',
  bSendPromotion tinyint(4) NOT NULL default '0',
  bNeverSendMail tinyint(4) NOT NULL default '0',
  dblCredit double NOT NULL default '0',
  tsLastChange timestamp(14) NOT NULL,
  tsRegTime timestamp(14) NOT NULL,
  UNIQUE KEY txtEmailAddress (txtEmailAddress)
) TYPE=MyISAM;

#
# Dumping data for table `Users`
#

INSERT INTO Users VALUES ('muntazim@ifaru.com', '155mmfhb', -1, 'iFaru', 'Administrator', 'Somewhere', '99', 'City', 'State', 'GB', '99999999999', 'None', '""', 0, 0, '0', 20031126144201, 20031126144144);
# --------------------------------------------------------

#
# Table structure for table `Variables`
#

CREATE TABLE Variables (
  txtName varchar(100) NOT NULL default '',
  txtValue text,
  PRIMARY KEY  (txtName)
) TYPE=MyISAM;

#
# Dumping data for table `Variables`
#

INSERT INTO Variables VALUES ('ProcessingCharge', '10');
INSERT INTO Variables VALUES ('MaximumProcessingValue', '50');
INSERT INTO Variables VALUES ('USD-2-INR', '46');