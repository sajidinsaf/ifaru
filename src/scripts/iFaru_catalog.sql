
#
# Table structure for table `Countries`
#
drop table countries;
CREATE TABLE Countries (
  shortname char(2) NOT NULL default '',
  name varchar(40) NOT NULL default '',
  registeredPost double NOT NULL default '15',
  ExpressCourier double NOT NULL default '20',
  PRIMARY KEY  (shortname)
);

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
drop table emailtemplates;
CREATE TABLE EmailTemplates (
  name varchar(50) NOT NULL default '',
  subject text NOT NULL,
  Message text NOT NULL,
  Variables text NOT NULL,
  PRIMARY KEY  (Name)
) ;

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
drop table ordershippingaddress;
CREATE TABLE OrderShippingAddress (
  OrderID int(11) NOT NULL default '0',
  Name varchar(20) default NULL,
  StreetAddress text,
  ZipCode varchar(20) default NULL,
  City varchar(20) default NULL,
  State varchar(20) default NULL,
  Country varchar(20) default NULL,
  Phone varchar(25) default NULL,
  ShippingMethod varchar(20) NOT NULL default '',
  PRIMARY KEY  (OrderID)
) ;

#
# Dumping data for table `OrderShippingAddress`
#

# --------------------------------------------------------

#
# Table structure for table `OrderUserInfo`
#
drop table orderuserinfo;
CREATE TABLE OrderUserInfo (
  QuestionID int(11) NOT NULL default '0',
  OrderID int(11) NOT NULL default '0',
  Type int(11) NOT NULL default '0',
  Title text,
  Value text
) ;

#
# Table structure for table `OrderedItems`
#
drop table orderitems;
CREATE TABLE OrderItems (
  OrderID int(50) NOT NULL default '0',
  ProductID int(11) NOT NULL default '0',
  Price double NOT NULL default '0',
  Cost double NOT NULL default '0',
  Quantity int(11) NOT NULL default '0',
  Reason text
) ;

#
# Table structure for table `Orders`
#
drop table orders;
CREATE TABLE Orders (
  ID int(11) NOT NULL auto_increment,
  EmailAddress varchar(50) NOT NULL default '',
  ChangeTime timestamp NOT NULL,
  Date timestamp NOT NULL,
  OrderState int(11) NOT NULL default '0',
  Total double NOT NULL default '0',
  ProcessingFees double NOT NULL default '0',
  ShippingCharges double NOT NULL default '0',
  GrandTotal double NOT NULL default '0',
  Paid double NOT NULL default '0',
  Remarks text,
  Tracking text,
  TrackingCompany text,
  TrackingURL text,
  PRIMARY KEY  (ID)
) ;

# Table structure for table `ShippingCharges`
#
drop table shippingcharges;
CREATE TABLE ShippingCharges (
  CountryID varchar(40) NOT NULL default '',
  ExpressCourier double NOT NULL default '0',
  RegisteredMail double NOT NULL default '0',
  PRIMARY KEY  (CountryID)
) ;

#
# Dumping data for table `ShippingCharges`
#

# --------------------------------------------------------

#
# Table structure for table `ShippingCompanies`
#
drop table shippingcompanies;
CREATE TABLE ShippingCompanies (
  ID int(11) NOT NULL auto_increment,
  Name varchar(100) NOT NULL default '',
  URL text,
  TrackingURL text,
  PRIMARY KEY  (id)
) ;

#
# Dumping data for table `ShippingCompanies`
#

INSERT INTO ShippingCompanies VALUES (1, 'RoyalMail', 'http://www.royalmail.com', 'http://www.royalmail.com/portal/rm/track');
# --------------------------------------------------------

#
# Table structure for table `Users`
#
drop table users;
CREATE TABLE Users (
  EmailAddress varchar(50) NOT NULL default '',
  Password varchar(50) NOT NULL default '',
  ACLBitmap bigint(20) NOT NULL default '1',
  Firstname varchar(20) NOT NULL default '',
  Lastname varchar(20) NOT NULL default '',
  StreetAddress text,
  ZipCode varchar(20) NOT NULL default '',
  City varchar(15) NOT NULL default '',
  State varchar(15) NOT NULL default '',
  Country varchar(40) NOT NULL default '',
  Phone varchar(25) NOT NULL default '',
  Reference varchar(100) NOT NULL default '',
  ReferredBy varchar(40) NOT NULL default '""',
  SendPromotion tinyint(4) NOT NULL default '0',
  NeverSendMail tinyint(4) NOT NULL default '0',
  Credit double NOT NULL default '0',
  LastChange timestamp NOT NULL,
  RegTime timestamp NOT NULL,
  UNIQUE KEY EmailAddress (EmailAddress)
) ;

#
# Dumping data for table `Users`
#

#INSERT INTO Users VALUES ('muntazim@ifaru.com', '155mmfhb', -1, 'iFaru', 'Administrator', 'Somewhere', '99', 'City', 'State', 'GB', '99999999999', 'None', '""', 0, 0, '0', 20031126144201, 20031126144144);
# --------------------------------------------------------

#
# Table structure for table `Variables`
#
drop table variables;
CREATE TABLE Variables (
  Name varchar(100) NOT NULL default '',
  Value text,
  EffectiveDate timestamp DEFAULT '0000-00-00 00:00:00',
  ExpiryDate timestamp DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY  (Name)
) ;

#
# Dumping data for table `Variables`
#

INSERT INTO Variables VALUES ('ProcessingCharge', '10','2009-07-07 00:00:00','2009-07-07 00:00:00');
INSERT INTO Variables VALUES ('MaximumProcessingValue', '50','2009-07-07 00:00:00','2009-07-07 00:00:00');
INSERT INTO Variables VALUES ('USD-2-INR', '46','2009-07-07 00:00:00','2009-07-07 00:00:00');