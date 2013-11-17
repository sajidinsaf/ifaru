package com.ifaru.mail;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ifaru.framework.FrameworkConstants;
import com.ifaru.util.Logger;


/**
 * 
 */

/**
 * @author si96555
 *
 */
public class IFaruMailerAction extends Action {
  private Logger logger = Logger.getInstance();
  private String htmlBody = "";
  private String subject;
 
  private String emailDir = "email";
  private final static String sep = File.separator;

  public void appendHtmlBody(String htmlbody)
  {
    htmlBody += htmlbody;
  }
  
  public void setHtmlBody(String htmlbody)
  {
    htmlBody = htmlbody;
  }
  
  public void setSubject(String sub)
  {
    subject = sub;
  }
  

 
  private Session setUpEmailSession() throws Exception {
    // setup authentication and session
    Authenticator auth = new SimpleAuthenticator("contact+ifaru.com", "155mmfhb");
    Properties props = System.getProperties();
    props.put("mail.smtp.host", "mail.ifaru.com");
    //props.put("mail.pop3.host", "mail.ifaru.com");
    Session session = Session.getDefaultInstance(props, auth);
    //     Get the store
    //Store store = session.getStore("pop3");//config.getProperty("protocol"));
    Store store = session.getStore("pop3");
    store.connect("mail.ifaru.com", "contact+ifaru.com", "155mmfhb");  
    //store.connect("mail.ifaru.co.uk", "ifaru02", "Fa4rish");  
    return session;
  }
  
  private Message getMessage(Session session) throws IOException, MessagingException {
    // construct the message
    Message msg = new MimeMessage(session);
    //msg.setFrom(new InternetAddress("ifaru02@ifaru.co.uk", "iFaru"));
    msg.setFrom(new InternetAddress("contact@ifaru.com", "iFaru.com"));
    msg.setReplyTo(new InternetAddress[] {new InternetAddress("contact@ifaru.com")});


    msg.setSubject(subject);
    msg.setDataHandler(new DataHandler(
        new ByteArrayDataSource(htmlBody, "text/html")));
    setupHeader(msg);

    msg.setSentDate(new Date());
    
    return msg;
  }
  
  private void setupHeader(Message msg) throws MessagingException {
//    msg.setHeader("X-Mailer", "iFaru Mailer");
//    msg.setHeader("X-AntiAbuse", "This header was added to track abuse, please include it with any abuse report");
//    msg.setHeader("X-AntiAbuse", "Original Domain - hotmail.com");
//    msg.setHeader("X-AntiAbuse", "Originator/Caller UID/GID - [32639 32158] / [47 12]");
//    msg.setHeader("X-AntiAbuse", "Sender Address Domain - ifaru.com");
//    msg.setHeader("User-Agent", "JavaMail 2.0");
//    msg.setHeader("X-Source", "");
//    msg.setHeader("X-Source-Args", "");
//    msg.setHeader("X-Source-Dir", "");
  }

  public void send(Message msg) throws MessagingException {
      // send the thing off
      Transport.send(msg);
  }
  /**
   * @param args
   */
  private void doAction(String path) throws Exception{

    String emailBody = getEmail(path);
    logger.msg(getClass(), "doAction", "prepared email body: "
        +FrameworkConstants.LINE_SEPARATOR+emailBody);
    
    List toList = getList(path+"ToList.txt");
    logger.msg(getClass(), "doAction", "sending email to "+toList.size()+ " email adresses");
 

    setSubject("Card making accessories from iFaru");
    setHtmlBody(emailBody);    

    Session session = setUpEmailSession();
    Message msg = getMessage(session);   
    
    Iterator toAddr = toList.iterator();
    
    while (toAddr.hasNext()) {
      String addr = toAddr.next().toString();
      if (!addr.equals("")) {
        logger.msg(getClass(), "doAction", "Sending email to: "+addr);
        msg.setRecipients(
            Message.RecipientType.TO,
        InternetAddress.parse(addr, false));
        send(msg);
      }
    }
  }

  private String getEmail(String path) throws Exception {
    List emailLines = getList(path+"Email.html");
    String email = "";
    Iterator lines = emailLines.iterator();
    while(lines.hasNext()) {
      String line = lines.next().toString();
      email += !email.equals("") ? FrameworkConstants.LINE_SEPARATOR + line : line;
    }
    return email;
  }

  private List getList(String path) throws Exception {
    List list = new ArrayList();
    BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(path)));
    String line = null;
    while ((line = reader.readLine()) != null) {
      list.add(line);
    }
    return list;
  }

  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
    String path = getServlet().getServletConfig().getServletContext().getRealPath("/");
    logger.msg(getClass(), "doAction", "Got servlet root path: "+path);
    if (!path.endsWith(sep)) {
      path += sep;
    }
    path += emailDir+sep;
    logger.msg(getClass(), "doAction", "Constructed root path: "+path);
    doAction(path);
    return mapping.findForward(FrameworkConstants.SUCCESS_KEY);
  }

}
