package com.phuocnga.service;

import java.util.List;

import com.phuocnga.model.City;
import com.phuocnga.model.District;
import com.phuocnga.model.UserEntity;

public interface UserService {
	List<UserEntity> users();
	void addNewUser(UserEntity user);
	boolean deleteUser(int id);
	boolean checkUserIsExist(UserEntity user);

	void registNewUser(UserEntity user, String token);

	UserEntity confirmToken(String token);

	void updateUser(UserEntity user);

	UserEntity getUserFromEmail(String email);
	UserEntity getUserById(int id);
	void updateToken(UserEntity user,String token);
	List<City> citys();
	List<District>getDistrictFromCity(int cityId);
	District getDistrictFromId(int districtId);
}
