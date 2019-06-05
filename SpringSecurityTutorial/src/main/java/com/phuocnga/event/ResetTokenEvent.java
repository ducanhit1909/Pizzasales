package com.phuocnga.event;

import org.springframework.context.ApplicationEvent;

import com.phuocnga.model.UserEntity;

public class ResetTokenEvent {
	private UserEntity user;
	private String url;

	public ResetTokenEvent(UserEntity user, String url) {
		this.user = user;
		this.url = url;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
