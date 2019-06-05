package com.phuocnga.service;

import java.util.List;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phuocnga.dao.UserDao;
import com.phuocnga.model.City;
import com.phuocnga.model.District;
import com.phuocnga.model.UserEntity;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao usDao;

	@Override
	@Transactional
	public List<UserEntity> users() {
		// TODO Auto-generated method stub
		return usDao.users();
	}

	@Transactional
	@Override
	public boolean checkUserIsExist(UserEntity user) {
		return usDao.checkUserIsExist(user);
	}

	@Transactional
	@Override
	public void registNewUser(UserEntity user, String token) {
		usDao.registNewUser(user, token);
	}

	@Transactional
	@Override
	public UserEntity confirmToken(String token) {
		// TODO Auto-generated method stub
		return usDao.confirmToken(token);
	}

	@Transactional
	@Override
	public void updateUser(UserEntity user) {
		usDao.updateUser(user);
	}

	@Transactional
	@Override
	public UserEntity getUserFromEmail(String email) {
		return usDao.getUserFromEmail(email);
	}

	@Transactional
	@Override
	public void updateToken(UserEntity user, String token) {
		usDao.updateToken(user, token);
	}

	@Transactional
	@Override
	public List<City> citys() {
		return usDao.citys();
	}
	@Transactional
	@Override
	public void addNewUser(UserEntity user) {
		// TODO Auto-generated method stub
		usDao.addNewUser(user);
	}
	@Transactional
	@Override
	public boolean deleteUser(int id) {
		// TODO Auto-generated method stub
		return usDao.deleteUser(id);
	}

	@Transactional
	@Override
	public List<District> getDistrictFromCity(int cityId) {
		return usDao.getDistrictFromCity(cityId);
	}

	@Transactional
	@Override
	public District getDistrictFromId(int districtId) {
		// TODO Auto-generated method stub
		return usDao.getDistrictFromId(districtId);
	}
	@Transactional
	@Override
	public UserEntity getUserById(int id) {
		// TODO Auto-generated method stub
		return usDao.getUserById(id);
	}

}
