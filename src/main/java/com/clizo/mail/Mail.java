package com.clizo.mail;

import java.io.InputStream;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.clizo.properties.demo;

public class Mail {

	public void mailsend(String toe, String subject, String messag) {

		Properties prop = new Properties();
//    InputStream input = null;

		InputStream cvs = demo.class.getResourceAsStream("config.properties");

		System.out.println("String get :" + cvs);

		try {

			prop.load(cvs);
		} catch (Exception ex) {
			System.out.println("error " + ex);
		}

		String to = toe;

		// Sender's email ID needs to be mentioned
		String from = prop.getProperty("admin");

		// Assuming you are sending email from localhost
		String host = "localhost";

		// Get system properties
		Properties properties = System.getProperties();

		// Setup mail server
		properties.setProperty("mail.smtp.host", host);

		// Get the default Session object.
		Session session = Session.getDefaultInstance(properties);

		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Set Subject: header field
			message.setSubject(subject);

			// Send the actual HTML message, as big as you like
			message.setContent(messag, "text/html");

			// Send message
			Transport.send(message);
			System.out.println("Sent message successfully....");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}
}