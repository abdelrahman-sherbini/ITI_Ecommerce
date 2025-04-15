package gov.iti.Helper;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

public class Mail {
	
	public static void sendMail(String recipientMailId, String subject, String body) {
		 
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.mailersend.net");
        properties.put("mail.transport.protocol", "smtp");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.port", "587");

        String emailId = "MS_UBs2zP@test-68zxl27rkn54j905.mlsender.net"; 	     // admin/company mail-id
        String password = "mssp.kjdORPI.ynrw7gynexo42k8e.LNKDynm";		// generated password

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(emailId, password);
            }
        });
        
        try {
            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(emailId));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientMailId));
            message.setSubject(subject);
            message.setContent(body, "text/html");

            Transport.send(message);
            //System.out.println("Message Sent Successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
