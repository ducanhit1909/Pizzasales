package com.phuocnga.dao;

import java.util.List;
import java.util.TreeSet;
import javax.persistence.Query;
import javax.servlet.jsp.tagext.TryCatchFinally;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.validator.constraints.ParameterScriptAssert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.phuocnga.model.City;
import com.phuocnga.model.District;
import com.phuocnga.model.ExpirationToken;
import com.phuocnga.model.UserEntity;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	SessionFactory factory;
	@Autowired
	BCryptPasswordEncoder encoder;

	@Override
	public boolean checkUserIsExist(UserEntity user) {
		Session session = factory.getCurrentSession();
		String hql = "from UserEntity us where us.email=:email_in";
		Query query = session.createQuery(hql);
		query.setParameter("email_in", user.getEmail());
		try {
			query.getSingleResult();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public void addNewUser(UserEntity user) {
		user.setEnable(true);
		user.setPassword(encoder.encode(user.getPassword()));
		factory.getCurrentSession().saveOrUpdate(user);
	}

	@Override
	public boolean deleteUser(int id) {
		// TODO Auto-generated method stub
		try {
			Session session = factory.getCurrentSession();
			UserEntity userEntity = (UserEntity) session.get(UserEntity.class, id);
			userEntity.setEnable(false);
			factory.getCurrentSession().saveOrUpdate(userEntity);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public void registNewUser(UserEntity user, String token) {
		Session session = factory.getCurrentSession();
		ExpirationToken expireDate = new ExpirationToken();
		user.setPassword(encoder.encode(user.getPassword()));
		user.setTokenExpired(expireDate);
		user.setEnable(false);
		expireDate.setToken(token);
		expireDate.setUser(user);
		expireDate.calculateExpireTime();

		session.persist(user);
	}

	@Override
	public List<UserEntity> users() {
		Session session = factory.getCurrentSession();
		String sql = "From UserEntity u where u.enable=:enable";
		Query query = session.createQuery(sql).setBoolean("enable", Boolean.TRUE);
		return query.getResultList();

	}

	@Override
	public UserEntity confirmToken(String token) {
		Session session = factory.getCurrentSession();
		String hql = "Select us from UserEntity us join us.tokenExpired t where t.token =:token";
		Query query = session.createQuery(hql);
		query.setParameter("token", token);
		UserEntity user;
		try {
			user = (UserEntity) query.getSingleResult();
		} catch (Exception e) {
			user = null;
		}
		return user;
	}

	@Override
	public void updateUser(UserEntity user) {
		Session session = factory.getCurrentSession();
		session.update(user);
	}

	@Override
	public UserEntity getUserFromEmail(String email) {
		String hql = "from UserEntity u where u.email=:email and u.enable=:enable";
		Query query = factory.getCurrentSession().createQuery(hql).setBoolean("enable", Boolean.TRUE);;
		query.setParameter("email", email);
		UserEntity user;
		try {
			user = (UserEntity) query.getSingleResult();
		} catch (Exception e) {
			user = null;
		}
		return user;
	}

	@Override
	public void updateToken(UserEntity user, String token) {
		ExpirationToken expire = user.getTokenExpired();
		expire.setToken(token);
		expire.calculateExpireTime();
		Session session = factory.getCurrentSession();
		session.update(expire);
	}

	@Override
	public List<City> citys() {
		String hql = "From City";
		Query query = factory.getCurrentSession().createQuery(hql);
		return query.getResultList();
	}

	@Override
	public List<District> getDistrictFromCity(int cityId) {
		String hql = "From District d where d.city.cityId=:cityId";
		Query query = factory.getCurrentSession().createQuery(hql);
		query.setParameter("cityId", cityId);
		return query.getResultList();
	}

	@Override
	public District getDistrictFromId(int districtId) {
		District district = factory.getCurrentSession().get(District.class, districtId);
		return district;
	}

	@Override
	public UserEntity getUserById(int id) {
		String hql = "from UserEntity where id=:id";
		Query query = factory.getCurrentSession().createQuery(hql);
		query.setParameter("id", id);
		UserEntity user;
		try {
			user = (UserEntity) query.getSingleResult();
			System.out.println(user.getCityId());
		} catch (Exception e) {
			user = null;
		}
		return user;
	}

}