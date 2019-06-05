package com.phuocnga.model;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "ExpirationToken", schema = "dbo")
public class ExpirationToken implements Serializable{
	@NotNull
	private int id;
	private String token;
	private LocalDateTime expirationDate;
	private UserEntity user;
	private static final int EXPIRATION=5*60*60;//The token will expire within 30 second
	public ExpirationToken() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "token_id", nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Basic
	@Column(name = "token")
	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	@Basic
	@Column(name = "expiredate")
	public LocalDateTime getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(LocalDateTime expirationDate) {
		this.expirationDate = expirationDate;
	}

	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "user_id")
	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}
	
	public void calculateExpireTime() {
		LocalDateTime timeExpired=LocalDateTime.now().plusSeconds(EXPIRATION);
		this.expirationDate=timeExpired;
	}

}
