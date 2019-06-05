package com.phuocnga.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phuocnga.dao.CityDao;
import com.phuocnga.model.City;
@Service
public class CityServiceImpl implements CityService {
	@Autowired
	CityDao ctDao;
	@Transactional
	@Override
	public List<City> listCity() {
		// TODO Auto-generated method stub
		return ctDao.listCity();
	}

}
