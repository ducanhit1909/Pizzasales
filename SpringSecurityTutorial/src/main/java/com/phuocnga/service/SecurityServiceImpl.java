package com.phuocnga.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
@Configuration
@Service
public class SecurityServiceImpl implements SecurityService {
	@Autowired
	AuthenticationManager authenticationManager;
	@Autowired
	@Qualifier("userDetailService")
	UserDetailsService userDetailService;
	@Autowired
	BCryptPasswordEncoder encoder;

	@Override
	public void autoLogin(String userName, String passWord) {
		UserDetails userDatails = userDetailService.loadUserByUsername(userName);
		UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(
				userDatails, passWord, userDatails.getAuthorities());
		authenticationManager.authenticate(usernamePasswordAuthenticationToken);
		if (usernamePasswordAuthenticationToken.isAuthenticated()) {
			SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
		}
	}

}
