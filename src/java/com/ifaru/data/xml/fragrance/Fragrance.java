package com.ifaru.data.xml.fragrance;

import java.util.ArrayList;
import java.util.List;

import com.ifaru.gallery.Image;

public class Fragrance {
  private String name;
  private String fragrance; 
  private String category;
  private List grades;
  private Information information;
  private String id;
  private Image image;
  private String gender;
  /* id count is used to give each picture a unique id*/
  private static int idCount = 0;  
  /**
   * @return the fragrance
   */
  public String getFragrance() {
    return fragrance;
  }
  /**
   * @param fragrance the fragrance to set
   */
  public void setFragrance(String fragrance) {
    this.fragrance = fragrance;
  }
  /**
   * @return the grades
   */
  public List getGrades() {
    return grades;
  }
  /**
   * @param grades the grades to set
   */
  public void setGrades(List grades) {
    this.grades = grades;
  }
  /**
   * @return the information
   */
  public Information getInformation() {
    return information;
  }
  /**
   * @param information the information to set
   */
  public void setInformation(Information information) {
    this.information = information;
  }
  
  public void addGrade(Grade grade) {
    if (grades == null) {
      grades = new ArrayList(2);
    }
    grades.add(grade);
  }
  /**
   * @return the name
   */
  public String getName() {
    return name;
  }
  /**
   * @param name the name to set
   */
  public void setName(String name) {
    this.name = name;
    setId(this.name + "_"+ (idCount++));    
  }
  /**
   * @return the category
   */
  public String getCategory() {
    return category;
  }
  /**
   * @param category the category to set
   */
  public void setCategory(String category) {
    this.category = category;
  }
  /**
   * @return the id
   */
  public String getId() {
    return id;
  }
  /**
   * @param id the id to set
   */
  public void setId(String id) {
    id = removeSpaces(id);
    this.id = id;
  }
  
  private String removeSpaces(String s) {
    String sNew = "";
    for (int i=0; i<s.length(); i++) {
      char spaceChar = " ".toCharArray()[0]; 
      if (s.charAt(i) != spaceChar) {
        sNew += s.charAt(i);
      }
    }
    return sNew;
  }
  /**
   * @return the image
   */
  public Image getImage() {
    return image;
  }
  /**
   * @param image the image to set
   */
  public void setImage(Image image) {
    this.image = image;
  }
  /**
   * @return the gender
   */
  public String getGender() {
    return gender;
  }
  /**
   * @param gender the gender to set
   */
  public void setGender(String gender) {
    this.gender = gender;
  }
}
