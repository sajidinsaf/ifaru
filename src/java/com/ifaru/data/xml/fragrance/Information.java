package com.ifaru.data.xml.fragrance;

import java.util.ArrayList;
import java.util.List;

public class Information {
  private List infoLines;

  /**
   * @return the infoLines
   */
  public List getInfoLines() {
    return infoLines;
  }

  /**
   * @param infoLines the infoLines to set
   */
  public void setInfoLines(List infoLines) {
    this.infoLines = infoLines;
  }
  
  public void addLine(InfoLine infoLine) {
    if (infoLines == null) {
      infoLines = new ArrayList(2);
    }
    infoLines.add(infoLine);
  }  
}
