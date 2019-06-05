package com.phuocnga.model;

import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "District")
public class District {
	private int districtId;
	private String districtName;
	@JsonIgnore
	private City city;
	@JsonIgnore
	private List<UserEntity> userEntity;

	public District(int districtId, String districtName, City city) {
		super();
		this.districtId = districtId;
		this.districtName = districtName;
		this.city = city;
	}

	public District() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "districtId", nullable = false)
	public int getDistrictId() {
		return districtId;
	}

	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}

	@Basic
	@Column(name = "districtName")
	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	@ManyToOne
	@JoinColumn(name = "cityId")
	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}
	
	@OneToMany(mappedBy = "district")
	public List<UserEntity> getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(List<UserEntity> userEntity) {
		this.userEntity = userEntity;
	}

}
