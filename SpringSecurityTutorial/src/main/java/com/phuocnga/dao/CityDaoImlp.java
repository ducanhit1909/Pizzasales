package com.phuocnga.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phuocnga.model.City;
@Repository
public class CityDaoImlp implements CityDao{
	@Autowired
	SessionFactory factory;
	@Override
	public List<City> listCity() {
		Session session = factory.getCurrentSession();
		String sql = "From City";
		Query query = session.createQuery(sql);
		return query.getResultList();
	}
	
}
