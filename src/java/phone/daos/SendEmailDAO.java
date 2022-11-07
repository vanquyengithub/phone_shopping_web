/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phone.daos;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.log4j.Logger;

/**
 *
 * @author User
 */
public class SendEmailDAO {
    
    Logger logger = Logger.getLogger(SendEmailDAO.class);

    
    public boolean sendEmail(String toEmail, String authCode) {
        boolean test = false;        
        String fromEmail = "vanquyenwork2020@gmail.com";
        String password = "embull2010";

        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            
            
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            MimeMessage mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            
            mess.setSubject("Cart Order Email Verification");
            
    		//set message text
            mess.setText("Please verify your order by using this code to make sure you are the right person: " + authCode);
            //send the message
            Transport.send(mess);
            
            test=true;
            
        } catch (Exception e) {
            logger.error(e.toString());
        }

        return test;
    }
}
