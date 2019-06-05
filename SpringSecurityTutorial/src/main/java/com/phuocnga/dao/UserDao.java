package com.phuocnga.dao;

import java.util.List;

import com.phuocnga.model.City;
import com.phuocnga.model.District;
import com.phuocnga.model.UserEntity;

public interface UserDao {
	// Login process
	List<UserEntity> users();

	//Registration process
	boolean checkUserIsExist(UserEntity user);

	void registNewUser(UserEntity user, String token);

	UserEntity confirmToken(String token);

	void updateUser(UserEntity user);

	UserEntity getUserFromEmail(String email);

	void updateToken(UserEntity user, String token);
	List<City>citys();


	void addNewUser(UserEntity user);

	boolean deleteUser(int id);

	List<District>getDistrictFromCity(int cityId);
	District getDistrictFromId(int districtId);

	UserEntity getUserById(int id);

}
