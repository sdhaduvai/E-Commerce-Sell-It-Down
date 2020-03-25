package com.hemanshu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import java.util.List;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.MimeMessageHelper;

import org.springframework.stereotype.Service;
@Service
public class EmailService {
	private JavaMailSender sender;
	
	@Autowired
	public EmailService(JavaMailSender sender) {
		this.sender=sender;
	}
	
	public void sendEmail(List<User> users,String text,String subject) throws Exception{
//		System.out.println("before");
		        MimeMessage message = sender.createMimeMessage();
//		        System.out.println("after");
		        for (User user1 : users) {
		        	
		        
		
		        // Enable the multipart flag!
		
		        MimeMessageHelper helper = new MimeMessageHelper(message,true);
		
		         
//		        System.out.println(user1.getEmailID());
		       helper.setFrom("team2@sellitdown.com");
		        helper.setTo(user1.getEmailID());
		
		       helper.setText(text);
		
		        helper.setSubject(subject);
		         
		
		        sender.send(message);
		        }
		    }

}
