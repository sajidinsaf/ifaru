package com.ifaru.html.util;

public class ConditionalHtmlTableRow {
  
  private int counter;
  private String startTableRowTag = "<tr>";
  private String endTableRowTag = "</tr>";
  private String noAction = "";
  private String hAlign = "";
  private String vAlign = "";

  private int count;

  /**
   * @return the count
   */
  public int getCount() {
    return count;
  }

  /**
   * @param count the count to set
   */
  public void setCount(int count) {
    this.count = count;
  }
  
  /**
   * at the first iteration open a table row "<tr>"
   * once the preset count (set through setCount()) limit is reached, close the table row and reset the counter 
   * otherwise return an empty string to have no effect on the html
   */
  public String getStartTableRowTag() {
    if (counter == 0) {
      counter++;
      return startTableRowTag;
    } else {
      counter++;
      return noAction;
    }
  }
  
  public void setOpenTableRow(String publishValue) {
    
  }
  
  public String getEndTableRowTag() {
    if (counter == getCount()) {
      counter = 0;
      return endTableRowTag;
    } 
    return noAction;
  }

  public void setEndTableRowTag(String publishValue) {
    
  }  
  
  /**
   * @return the hAlign
   */
  public String getHAlign() {
    return hAlign;
  }

  /**
   * @param align the hAlign to set
   */
  public void setHAlign(String align) {
    hAlign = align;
    startTableRowTag = "<tr align=\""+hAlign+"\"" + " valign=\""+vAlign+"\">";
  }

  /**
   * @return the vAlign
   */
  public String getVAlign() {
    return vAlign;
  }

  /**
   * @param aling the vAlign to set
   */
  public void setVAlign(String aling) {
    vAlign = aling;
    startTableRowTag = "<tr align=\""+hAlign+"\"" + " valign=\""+vAlign+"\">";
  }
  
  public static void main (String args[]) {
    ConditionalHtmlTableRow tr = new ConditionalHtmlTableRow();
    tr.setCount(7);
    for (int i=0; i<7; i++){
      System.out.println(tr.getStartTableRowTag());
      System.out.println(tr.getEndTableRowTag());      
    }
  }  
}
