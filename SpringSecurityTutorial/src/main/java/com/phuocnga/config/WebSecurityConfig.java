package com.phuocnga.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import com.phuocnga.dao.UserDao;
import com.phuocnga.service.MyUserDetailService;

@Configuration
@EnableWebSecurity
@ComponentScan(basePackageClasses = { MyUserDetailService.class, UserDao.class })
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	@Qualifier("userDetailService")
	UserDetailsService userDetailService;

	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("admin").password(encoder().encode("admin123")).roles("ADMIN");
		auth.userDetailsService(userDetailService).passwordEncoder(encoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/error");
		http.csrf().disable().authorizeRequests()
				.antMatchers("/resources/**", "/", "/signup", "/signin", "/products/**", "/signup/**",
						"/order/addtocart", "order/place_order")
				.permitAll().antMatchers("/order/orderDetail").hasRole("USER").antMatchers("/managements/**").hasRole("ADMIN")
				.anyRequest().authenticated().and().formLogin().loginPage("/signin")
				.loginProcessingUrl("/loginProcesses").defaultSuccessUrl("/signin?success=true")
				.failureUrl("/signin?error=true").and().logout().logoutUrl("/logout").logoutSuccessUrl("/");
	}

	@Bean
	@Override
	protected AuthenticationManager authenticationManager() throws Exception {
		return super.authenticationManager();
	}
}
