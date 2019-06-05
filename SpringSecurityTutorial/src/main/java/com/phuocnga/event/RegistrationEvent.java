package com.phuocnga.event;
import java.util.Locale;
import com.phuocnga.model.UserEntity;

public class RegistrationEvent {

	private UserEntity user;
	private Locale locale;
	private String url;

	public RegistrationEvent(UserEntity user, Locale locale, String url) {
		this.user = user;
		this.locale = locale;
		this.url = url;
	}



	public UserEntity getUser() {
		return user;
	}


	public void setUser(UserEntity user) {
		this.user = user;
	}

	public Locale getLocale() {
		return locale;
	}

	public void setLocale(Locale locale) {
		this.locale = locale;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
