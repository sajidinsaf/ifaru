package com.ifaru.gallery;

import com.ifaru.framework.IFaruIdentifiableObject;

public class Image extends IFaruIdentifiableObject {
  private String src, thumbnail;

  
  /**
   * @return the src
   */
  public String getSrc() {
    return src;
  }

  /**
   * @param src the src to set
   */
  public void setSrc(String src) {
    this.src = src;
  }

  /**
   * @return the thumbnail
   */
  public String getThumbnail() {
    return thumbnail;
  }

  /**
   * @param thumbnail the thumbnail to set
   */
  public void setThumbnail(String thumbnail) {
    this.thumbnail = thumbnail;
  }
  
  
  public String toString() {
    StringBuffer sb = new StringBuffer();
    sb.append("Main Image: ");
    sb.append(getSrc());
    sb.append(" Thumbnail: ");
    sb.append(getThumbnail());
    return sb.toString();
  }
  
  public int hashCode() {
    return COMMON_HASHCODE;
  }
  
  public boolean equals(Object obj) {
    return same(obj.toString(), toString());
  }  
}
