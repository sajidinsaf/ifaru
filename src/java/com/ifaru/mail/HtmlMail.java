package com.ifaru.mail;


import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class HtmlMail
{
	public String htmlBody = "";
	public String fromName;
	public String fromAddress;
	
	public String to;
	public String subject;
	public String cc = null;
	
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
	
	public void setFrom(String name,String address)
	{
		fromName = name;
		fromAddress = address;
	}
	
	public void setTo(String to)
	{
		this.to = to;
	}
	
	public void setCC(String cc)
	{
		this.cc = cc;
	}
	
	
	public String send(String host)
	{
		try
		{
			
			Properties props = System.getProperties();
			props.put("mail.smtp.host", host);

			// Get a Session object
			Session session = Session.getDefaultInstance(props, null);
		
			// construct the message
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(fromAddress,fromName));

			msg.setRecipients(
							  Message.RecipientType.TO,
						InternetAddress.parse(to, false));
		
			if (cc != null)
			msg.setRecipients(Message.RecipientType.CC,
						InternetAddress.parse(cc, false));

			msg.setSubject(subject);

			msg.setDataHandler(new DataHandler(
				new ByteArrayDataSource(htmlBody, "text/html")));

			msg.setHeader("X-Mailer", "iFaru Mailer");
			msg.setSentDate(new Date());
			
			// send the thing off
			Transport.send(msg);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return e.getMessage();
		}
		return null;
	}
}
