package com.ifaru.util;

import java.io.IOException;
import java.util.Date;
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
import com.ifaru.framework.FrameworkConstants;
import com.ifaru.framework.FrameworkFacade;
import com.ifaru.framework.IFaruException;
import com.ifaru.mail.ByteArrayDataSource;
import com.ifaru.mail.SimpleAuthenticator;
import com.ifaru.security.PasswordService;
import com.ifaru.util.Logger;

public class MailUtil {

    private Logger logger = Logger.getInstance();
    private String htmlBody = "";
    private String subject;
    private String mailHost;
    private String mailPassword;
    private String mailUsername;
    private String toEmailAddress;

    public void appendHtmlBody(String htmlbody) {
      htmlBody += htmlbody;
    }
    
    public void setHtmlBody(String htmlbody) {
      htmlBody = htmlbody;
    }
    
    public void setSubject(String sub) {
      subject = sub;
    }
    
    public void setTo(String toEmailAddress) {
      this.toEmailAddress = toEmailAddress;
    }
    
    public void sendHtmlMessage(String message, String toEmailAddress) throws MessagingException, IOException {
      String mn = "sendHtmlMessage";
      logger.msg(getClass(), mn, new Object[] {"Sending message ", message, " to email address: ", toEmailAddress});
      setHtmlBody(message);
      setTo(toEmailAddress);
      send();
    }
    
    private Session setUpEmailSession() throws MessagingException {
      // setup authentication and session
      Authenticator auth = new SimpleAuthenticator(mailUsername, mailPassword);
      Properties props = System.getProperties();
      props.put("mail.smtp.host", mailHost);
      Session session = Session.getDefaultInstance(props, auth);
      Store store = session.getStore("pop3");
      store.connect(mailHost, mailUsername, mailPassword);  
      return session;
    }
    
    private Message getMessage(Session session) throws IOException, MessagingException {
      // construct the message
      Message msg = new MimeMessage(session);
      msg.setFrom(new InternetAddress(mailUsername, "iFaru.com"));
      msg.setReplyTo(new InternetAddress[] {new InternetAddress(mailUsername)});


      msg.setSubject(subject);
      msg.setDataHandler(new DataHandler(
          new ByteArrayDataSource(htmlBody, "text/html")));
      setupHeader(msg);

      msg.setSentDate(new Date());
      
      return msg;
    }
    
    private void setupHeader(Message msg) throws MessagingException {
//      msg.setHeader("X-Mailer", "iFaru Mailer");
//      msg.setHeader("X-AntiAbuse", "This header was added to track abuse, please include it with any abuse report");
//      msg.setHeader("X-AntiAbuse", "Original Domain - hotmail.com");
//      msg.setHeader("X-AntiAbuse", "Originator/Caller UID/GID - [32639 32158] / [47 12]");
//      msg.setHeader("X-AntiAbuse", "Sender Address Domain - ifaru.com");
//      msg.setHeader("User-Agent", "JavaMail 2.0");
//      msg.setHeader("X-Source", "");
//      msg.setHeader("X-Source-Args", "");
//      msg.setHeader("X-Source-Dir", "");
    }

    public void send() throws MessagingException, IOException {
      Session session = setUpEmailSession();
      Message msg = getMessage(session);      
      msg.setRecipients(
          Message.RecipientType.TO,
      InternetAddress.parse(toEmailAddress, false));
      msg.setRecipients(
          Message.RecipientType.CC,
      InternetAddress.parse(mailUsername, false));      
      // send the thing off
      send(msg);      
      
    }
    
    public void send(Message msg) throws MessagingException {
        Transport.send(msg);
    }



    public void init(FrameworkFacade facade) throws IFaruException {
      mailHost = facade.getServletConfig().getInitParameter(FrameworkConstants.EMAIL_HOST_KEY);
      mailUsername = facade.getServletConfig().getInitParameter(FrameworkConstants.EMAIL_USERNAME_KEY);
      PasswordService pwdService = PasswordService.getInstance();
      try {
        pwdService.init(facade);
      } catch (Exception e) {
        throw new IFaruException("Exception while initialising PasswordService", e);
      }
      mailPassword = pwdService.getPassword(facade.getServletConfig().getInitParameter(FrameworkConstants.EMAIL_PASSWORD_KEY), FrameworkConstants.TIME_FOR_FEE_ENTITY);
      
    }

  
  
  
}
