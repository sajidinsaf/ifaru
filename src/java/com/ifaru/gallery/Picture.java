package com.ifaru.gallery;

public class Picture {
  private Image image;
  private String id, title, description;
  /* id count is used to give each picture a unique id*/
  private static int idCount = 0;
  /**
   * @return the description
   */
  public String getDescription() {
    return description;
  }
  /**
   * @param description the description to set
   */
  public void setDescription(String description) {
    this.description = description;
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
   * @return the title
   */
  public String getTitle() {
    return title;
  }
  /**
   * @param title the title to set
   */
  public void setTitle(String title) {
    this.title = title;
    setId(title + "_"+ (idCount++));
  }
  
  public String toString() {
    return title 
           + " -> "
           + getImage().getSrc();
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
  
  public static void main(String[] args) {
    Picture pic = new Picture();
    pic.setTitle("ste 4 k5");
    System.out.println(pic.getId());
    pic.setTitle("stdfg2k5");      
    System.out.println(pic.getId());
    pic.setTitle("s te 4 k5");  
    System.out.println(pic.getId());    
  }
}
