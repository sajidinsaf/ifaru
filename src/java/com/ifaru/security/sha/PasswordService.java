package com.ifaru.security.sha;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import sun.misc.BASE64Encoder;
import sun.misc.CharacterEncoder;
public final class PasswordService
{
  private static PasswordService instance;
  private PasswordService()
  {
  }
  public synchronized String encrypt(String plaintext) throws SystemUnavailableException
  {
    MessageDigest md = null;
    try
    {
      md = MessageDigest.getInstance("SHA"); //step 2
    }
    catch(NoSuchAlgorithmException e)
    {
      throw new SystemUnavailableException(e.getMessage());
    }
    try
    {
      md.update(plaintext.getBytes("UTF-8")); //step 3
    }
    catch(UnsupportedEncodingException e)
    {
      throw new SystemUnavailableException(e.getMessage());
    }
    byte raw[] = md.digest(); //step 4
    String hash = (new BASE64Encoder()).encode(raw); //step 5
    return hash; //step 6
  }
  public static synchronized PasswordService getInstance() //step 1
  {
    if(instance == null)
    {
      return new PasswordService();
    }
    else    
    {
      return instance;
    }
  }
  
  public static void main(String args[]) throws Exception {
    PasswordService service = PasswordService.getInstance();
    String user = "ifaruadmin";
    String ePwd = service.encrypt(user);
    System.out.println("Encrypted " + user + " to " +ePwd);
    
    user = "155mmfhb";
    ePwd = service.encrypt(user);
    System.out.println("Encrypted " + user + " to " +ePwd); 
  }
}

