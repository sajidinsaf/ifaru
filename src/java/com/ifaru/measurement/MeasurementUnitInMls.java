package com.ifaru.measurement;

import java.util.HashMap;
import java.util.Map;

import com.ifaru.framework.IFaruException;

public class MeasurementUnitInMls extends MeasurementUnit {

  public final static String MLS_TSTR1ml = "Tester-1ml";  
  public final static String MLS_TSTRpt25 = "Tester-0.25ml"; 
  public final static String MLS_TSTR = "Tester"; 
  public final static String MLS_ONE = "1";   
  public final static String MLS_THREE = "3";
  public final static String MLS_SIX = "6";
  public final static String MLS_TWELVE = "12";
  public final static String MLS_TWENTYFOUR = "24";
  
  private int quantityAvailable;
  
  private static MeasurementUnitInMls mu;
  
  protected MeasurementUnitInMls() {
    
  }
  
  /**
   * Supply the size in mls (which is adopted as the name of this MU) to get the respective instance
   * If an MU with the name does not exist null is returned.
   * @param name
   */
  public static MeasurementUnit getInstance(String name) throws IFaruException{
    if (mu == null) {
      mu = new MeasurementUnitInMls();
    }
    Class muClass = (Class)mu.getMeasurementMap().get(name);
    if (muClass == null) {
      return null;
    }
    try {
      return (MeasurementUnit)muClass.newInstance();
    } catch (InstantiationException e) {
      throw new IFaruException ("InstantiationException thrown while attempting on instaniate class"+muClass.getName(), e);
    } catch (IllegalAccessException e) {
      throw new IFaruException ("IllegalAccessException thrown while attempting on instaniate class"+muClass.getName(), e);
    }
  }
  
  
  @Override
  public int getQuantityAvailable() {
    return quantityAvailable;
  }

  
  private final Map mUs = getMeasurementMap();

  private Map getMeasurementMap() {
    Map map = new HashMap();
    map.put(MLS_TSTRpt25, MeasurementUnitTESTERpt25Mls.class);     
    map.put(MLS_TSTR1ml, MeasurementUnit1Mls.class);  
    map.put(MLS_TSTR, MeasurementUnit1Mls.class); 
    map.put(MLS_ONE, MeasurementUnit1Mls.class);   
    map.put(MLS_THREE, MeasurementUnit3Mls.class);
    map.put(MLS_SIX, MeasurementUnit6Mls.class);
    map.put(MLS_TWELVE, MeasurementUnit12Mls.class);
    map.put(MLS_TWENTYFOUR, MeasurementUnit24Mls.class);
    return map;
  }
}



class MeasurementUnit3Mls extends MeasurementUnitInMls {
  public MeasurementUnit3Mls() {
    super();
  }
  public void setQuantity(int quantity) {
    if (getName().trim().equalsIgnoreCase(MLS_THREE)) {
      setQuantityAvailable(quantity/3);
    }
  }
}

class MeasurementUnit6Mls extends MeasurementUnitInMls {
  public MeasurementUnit6Mls() {
    super();
  }    
  public void setQuantity(int quantity) {
    if (getName().trim().equalsIgnoreCase(MLS_SIX)) {
      setQuantityAvailable(quantity/6);
    }
  }
}  

class MeasurementUnit12Mls extends MeasurementUnitInMls {
  public MeasurementUnit12Mls() {
    super();
  }    
  public void setQuantity(int quantity) {
    if (getName().trim().equalsIgnoreCase(MLS_TWELVE)) {
      setQuantityAvailable(quantity/12);
    }
  }
}   


class MeasurementUnit24Mls extends MeasurementUnitInMls {
  public MeasurementUnit24Mls() {
    super();
  }    
  public void setQuantity(int quantity) {
    if (getName().trim().equalsIgnoreCase(MLS_TWENTYFOUR)) {
      setQuantityAvailable(quantity/24);
    }
  }
}   

class MeasurementUnit1Mls extends MeasurementUnitInMls {
  public MeasurementUnit1Mls() {
    super();
  }    
  public void setQuantity(int quantity) {
    if (getName().trim().equalsIgnoreCase(MLS_ONE) || getName().trim().equalsIgnoreCase(MLS_TSTR) || getName().trim().equals(MLS_TSTR1ml)) {
      setQuantityAvailable(quantity);
    }
  }
}  

class MeasurementUnitTESTERpt25Mls extends MeasurementUnitInMls {
  public MeasurementUnitTESTERpt25Mls() {
    super();
  }    
  public void setQuantity(int quantity) {
    if (getName().trim().equalsIgnoreCase(MLS_TSTRpt25)) {
      setQuantityAvailable(quantity * 4);
    }
  }
}   
