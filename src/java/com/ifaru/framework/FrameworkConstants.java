package com.ifaru.framework;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public interface FrameworkConstants {
  String USER_KEY = "userview";
  String SUCCESS_KEY = "Success";
  String FAILURE_KEY = "Failure";
  String DEFAULT_KEY = "Default";
  String SHIPPING_OPTIONS_KEY = "ShippingOptions";
  String PAYMENT_ERROR_KEY = "Failure";    
  String HOME_KEY = "Home";  
  String MY_ACCOUNT_KEY = "myaccount";
  String LOGIN_ERROR_KEY = "global.error.invalidlogin";
  String LOGIN_COUNT_KEY = "login.count"; 
  String LINE_SEPARATOR = System.getProperty("line.separator");
  String INVALID_SESSION_KEY = "Invalid_Session";
  String MYACCOUNT_MESSAGE_KEY = "myaccount.message";
  String PRICE_FIELD_ID_END = "_PriceField";
  String REMOVE_ITEM_FIELD_ID_END = "_RemoveItem";
  String CART_ITEM_ID_FIELD_SEPERATOR = "_size_";
  
  // REQUEST/SESSION PARAMETER NAMES
  String GALLERY_KEY = "galleryKey";
  String GALLERY_PICTURE_KEY = "galleryPictureKey";
  String GALLERY_PICTURE_NEXT_KEY = "galleryPictureNextKey";  
  String GALLERY_PICTURE_PREVIOUS_KEY = "galleryPicturePreviousKey";
  String USERPROFILE_KEY = "userprofileview";
  String PARENT_KEY = "parent";
  String WEBSITE_BEAN_KEY = "website";
  String CATEGORIES_BEAN_KEY = "categories";  
  String FRAGRANCE_DATA_FILE_KEY = "fragranceDataFile";
  String FRAGRANCE_CATALOG_FILE_KEY = "fragranceCatalog";  
  String CATALOGITEMS_OBJECT_KEY = "catalogItemsKey";
  String FRAGRANCE_ID_KEY = "fragranceId";
  String FRAGRANCE_KEY = "fragrance";
  String PARENT_ID_KEY = "nParentId";
  
  // Catalog page control keys
  String ALPHABETIC_ORDER_PARAM_NAME = "startsWithAlphabet";
  String PREVIOUS_PAGE_INDICATOR = "previousPage";
  String NEXT_PAGE_INDICATOR = "nextPage";
  String LAST_LIST_START_INDEX = "lastListStartIndex";
  String LAST_LIST_END_INDEX = "lastListEndIndex";  
  String CURRENT_PAGE_NUMBER = "currentPageNumber";
  String NUMBER_OF_PAGES = "numberOfPages";
  String CURRENT_CATALOG_LIST = "currentCatalogList";
  String CART_KEY = "shoppingCart";
  String VIEW_CART_KEY = "viewCart";
  String CATEGORY_REQUEST_PARAMETER_NAME = "category";
  String BRAND_REQUEST_PARAMETER_NAME = "brand";
  String BRANDS_BEAN_KEY = "brands";  
  String BRAND_BASE_URL_KEY = "brandBaseUrl";
  String CATEGORY_BASE_URL_KEY = "categoryBaseUrl";
  String BRAND_SEARCH_FLAG = "brandSearch";
  String CATEGORY_SEARCH_FLAG = "categorySearch";
  String KEYWORD_SEARCH_FLAG = "keywordSearch"; 
  String KEYWORD_COMMONWORDS = "commonWords";   

  String[] commonWords = new String[] {"a", "of", "the", "how", "but", "and", "what", "it", "who", "an", "when", "why", "where"};
  String KEYWORD_SEPARATOR = " ";
  String CHECKOUT_OPTION_KEY = "checkoutOption";
  String CHECKOUT_OPTION_PAYPAL = "PAYPAL";
  String CHECKOUT_OPTION_NOCHEX = "NOCHEX";
  String CHECKOUT_OPTION_CHEQUE = "CHEQUE";
  
  String EMAIL_HOST_KEY = "shopEmailHost";
  String EMAIL_USERNAME_KEY = "shopEmailUsername";
  String EMAIL_PASSWORD_KEY = "shopEmailPassword";  

  String TIME_FOR_FEE_ENTITY = "ieu-7h733j683#3"; // the pwd seed
  String FRAGRANCE_CATALOG_POLL_DURATION = "catalogPollDuration";
  String CHEQUE_PAYMENT_FORWARD_KEY = "Cheque";
  String PAYPAL_PAYMENT_FORWARD_KEY = "Paypal";
  String NOCHEX_PAYMENT_FORWARD_KEY = "Nochex";
  String CHEQUEPAYMENT_EMAIL_KEY = "email";
  String ITEM_AVAILABLE = "enabled";
  String PATH_SEPARATOR = File.separator;
  String INVALID_EMAIL_ADDRESS_KEY = "InvalidEmail";
  String PAYMENT_RESULT = "paymentResult";
  
  
  String SHIPPING_OPTION_ID_UK = "15037301";  
  String SHIPPING_OPTION_ID_INTERNATIONAL = "15037302";   
  String SHIPPING_OPTION_NAME_UK = "UK MAINLAND";  
  String SHIPPING_OPTION_NAME_INTERNATIONAL = "INTENATIONAL";
  String FORWARDED_FROM_SHIPPINGOPTIONS = "shippingOptionFwd";
  double FIXED_POSTAL_INSURANCE_CHARGE = 5;
  int INSURANCE_REQUIRED_INDICATOR = 1;
  String CATALOG_UPDATE_FAILURE = "catalogUpdateFailure";     
  String CATALOG_UPDATE_SUCCESS = "catalogUpdateSuccess";

  String CATALOG_ITEM_KEY = "catalogItemKey";
  String INFO_URL_START = "/ifaru/catalog/GetItem.do?";
  String ITEM_HTML_INFO_URL_PARAM_NAME = "itemHtmlInfoUrl";  
  String ITEM_PRICEFIELD_ID_PARAM_NAME = "itemPriceFieldId";
  String UPDATE_CATALOG_USERNAME = "HHXrYwtdKK5nTbw+7tMHJ6+jec4=";  
  String UPDATE_CATALOG_PASSWORD = "nvfv52jFlvEDsReCKAb7mLun+A4=";
  String SIZE_STANDARD = "One Size";
  String CUSTOMER_KEY = "customer";
  
  String ADMIN_CATALOG_KEY = "adminCatalogKey";
  String ADMIN_LOGIN_FAILURE = "loginFailure";
  String ADMIN_LOGIN_SUCCESS = "loginSuccess";   
  
  char PAD_CHAR_0 = (char)48;
  String SHIPPING_ADDRESS = "shippAddr";
  String BILLING_ADDRESS = "billAddr";
  String GET_SHIPPING_ADDRESS_KEY = "GetShippingAddress";
  
}
