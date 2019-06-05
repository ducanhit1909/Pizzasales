package com.phuocnga.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.phuocnga.dao.UserDao;
import com.phuocnga.model.UserEntity;

@Service("userDetailService")
public class MyUserDetailService implements UserDetailsService {
	@Autowired
	UserDao userDao;

	@Transactional(readOnly = true)
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity user = userDao.getUserFromEmail(username);
		UserBuilder builder = null;
		if (user != null) {
			builder = User.withUsername(user.getEmail());
			builder.disabled(!user.getEnable());
			builder.password(user.getPassword());
			List<GrantedAuthority> grantList = Arrays.asList(new SimpleGrantedAuthority("ROLE_USER"));
			builder.authorities(grantList);
		} else {
			throw new UsernameNotFoundException("User not found");
		}

		return builder.build();
	}

}
