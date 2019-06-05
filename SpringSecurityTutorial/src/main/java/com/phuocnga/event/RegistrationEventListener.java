package com.phuocnga.event;

import java.util.UUID;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.EventListener;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;

import com.phuocnga.model.UserEntity;
import com.phuocnga.service.UserService;

public class RegistrationEventListener {
	@Autowired
	private UserService userService;
	@Autowired
	JavaMailSender mailSender;

	@Async
	@EventListener
	public void userRegister(RegistrationEvent event) {
		String token = UUID.randomUUID().toString();
		UserEntity user = event.getUser();
		// Save token
		userService.registNewUser(user, token);

		String url = "http://localhost:8080" + event.getUrl() + "/signup/confirmToken/" + token;
		// Send mail

		MimeMessage mineMessage = mailSender.createMimeMessage();
		try {
			mineMessage.setFrom(new InternetAddress("nobitahuynh997@gmail.com"));
			mineMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
			mineMessage.setSubject("Confirm Registration!");
			mineMessage.setContent(
					"<p>Click link below to active your account(the link will expire within 1 day) </p><br><a href="
							+ url + ">Click here</a>",
					"text/html");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mailSender.send(mineMessage);
	}
	@Async
	@EventListener
	public void resetToken(ResetTokenEvent event) {
		String token = UUID.randomUUID().toString();
		String url = "http://localhost:8080" + event.getUrl() + "/signup/confirmToken/" + token;
		UserEntity user = event.getUser();

		userService.updateToken(user, token);
		// Send mail

		MimeMessage mineMessage = mailSender.createMimeMessage();
		try {
			mineMessage.setFrom(new InternetAddress("nobitahuynh997@gmail.com"));
			mineMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
			mineMessage.setSubject("Confirm Registration!");
			mineMessage.setContent(
					"<p>Click link below to active your account(the link will expire within 1 day) </p><br><a href="
							+ url + ">Click here</a>",
					"text/html");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mailSender.send(mineMessage);
	}

}
