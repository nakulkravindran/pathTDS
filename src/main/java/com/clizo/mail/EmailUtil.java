package com.clizo.mail;


import java.util.Date;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

	/**
	 * Utility method to send simple HTML email
	 * @param session
	 * @param toEmail
	 * @param subject
	 * @param body
	 */
	public static void sendEmail(Session session, String frmEmail,String ccEmail,String toEmail, String subject, String body){
		try
	    {
	      MimeMessage msg = new MimeMessage(session);
	      //set message headers
	      msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
	      msg.addHeader("format", "flowed");
	      msg.addHeader("Content-Transfer-Encoding", "8bit");
	      msg.setFrom(new InternetAddress(frmEmail, frmEmail));
	      msg.setReplyTo(InternetAddress.parse(frmEmail, false));
	      msg.setSubject(subject, "UTF-8");	      
	      msg.setContent(body, "text/html; charset=utf-8");
	      msg.setSentDate(new Date());
	      msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
	      if(ccEmail!=null && ccEmail!=""){
	    	  msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(ccEmail, false));  
	      }
	      System.out.println("Message is ready");
    	  Transport.send(msg);
	      System.out.println("EMail Sent Successfully!!");
	    }
	    catch (Exception e) {
	      e.printStackTrace();
	    }
	}
}