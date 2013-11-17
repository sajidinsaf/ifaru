package com.ifaru.gallery;

import java.util.ArrayList;
import java.util.List;

public class Gallery {
  private String name;
  private List pictures;

  /**
   * @return the pictures
   */
  public List getPictures() {
    return pictures;
  }

  /**
   * @param pictures the pictures to set
   */
  public void addPicture(Picture picture) {
    if (pictures == null) {
      pictures = new ArrayList(10);
    }
    pictures.add(picture);
  }

  /**
   * @return the id
   */
  public String getName() {
    return name;
  }

  /**
   * @param id the id to set
   */
  public void setName(String id) {
    this.name = id;
  }

  /**
   * @param pictures the pictures to set
   */
  public void setPictures(List pictures) {
    this.pictures = pictures;
  }
}
