package com.ifaru.html.util;

import com.ifaru.framework.FrameworkConstants;

public class HtmlAnchorTag implements HtmlTag {
  private String href;
  private String content;
  private String html;
  private String requestParamName = FrameworkConstants.ALPHABETIC_ORDER_PARAM_NAME;
  private String requestParamValue;
  /**
   * @return the content
   */
  public String getContent() {
    return content;
  }
  /**
   * @param content the content to set
   */
  public void setContent(String content) {
    this.content = content;
  }
  /**
   * @return the href
   */
  public String getHref() {
    return href;
  }
  /**
   * @param href the href to set
   */
  public void setHref(String href) {
    this.href = href;
  }
  /**
   * @return the html
   */
  public String getHtml() {
    StringBuffer aLink = new StringBuffer(1);
    aLink.append(getLinkTagStart(getRequestParamValue()));
    aLink.append(content);
    aLink.append(getLinkTagEnd());
    html = aLink.toString();
    return html;
  }
  /**
   * @param html the html to set
   */
  public void setHtml(String html) {
    this.html = html;
  }
  
  private String getLinkTagEnd() {
    return "</a>";
  }

  private String getLinkTagStart(String paramNameValue) {
    String linkStart = "<a href=\""+getHref()+"?"
        + getRequestParamName()+ "="
        + paramNameValue + "\"" 
        +">";
    
    return linkStart;
  }
  
  /**
   * @return the paramId
   */
  public String getRequestParamName() {
    return requestParamName;
  }

  /**
   * @param paramId the paramId to set
   */
  public void setRequestParamName(String paramId) {
    this.requestParamName = paramId;
  }
  /**
   * @return the requestParamValue
   */
  public String getRequestParamValue() {
    return requestParamValue;
  }
  /**
   * @param requestParamValue the requestParamValue to set
   */
  public void setRequestParamValue(String requestParamValue) {
    this.requestParamValue = requestParamValue;
  }  
  
  public String toString() {
    return getHtml();
  }
}
