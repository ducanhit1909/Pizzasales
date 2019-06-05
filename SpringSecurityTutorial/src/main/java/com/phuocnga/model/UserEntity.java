package com.phuocnga.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "Users", schema = "dbo")
public class UserEntity implements Serializable {
	@NotNull
	private int id;

	private String fullName;

	private String email;

	private String password;

	private String confirmPassWord;

	private Boolean enable;

	private ExpirationToken tokenExpired;

	private List<OrderEntity> orders;
	private String address;
	private District district;
	private int districtId;
	private int cityId;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id", nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Basic
	@Column(name = "fullName", nullable = true, length = 50)
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	@Basic
	@Column(name = "email", nullable = true, length = 320)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Basic
	@Column(name = "password", nullable = true, length = 50)
	public String getPassword() {
		return password;
	}

	@Transient
	public String getConfirmPassWord() {
		return confirmPassWord;
	}

	public void setConfirmPassWord(String confirmPassWord) {
		this.confirmPassWord = confirmPassWord;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Basic
	@Column(name = "enable", nullable = true)
	public Boolean getEnable() {
		return enable;
	}

	public void setEnable(Boolean enable) {
		this.enable = enable;
	}

	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	public ExpirationToken getTokenExpired() {
		return tokenExpired;
	}

	public void setTokenExpired(ExpirationToken tokenExpired) {
		this.tokenExpired = tokenExpired;
	}

	@OneToMany(mappedBy = "userEntity", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	public List<OrderEntity> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderEntity> orders) {
		this.orders = orders;
	}

	@Basic
	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@ManyToOne
	@JoinColumn(name = "districtId")
	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}


	@Transient
	public int getDistrictId() {
		return districtId;
	}

	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}

	@Transient
	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	
	
}
