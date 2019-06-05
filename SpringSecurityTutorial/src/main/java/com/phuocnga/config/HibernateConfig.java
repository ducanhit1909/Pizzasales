package com.phuocnga.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

import com.phuocnga.model.City;
import com.phuocnga.model.District;
import com.phuocnga.model.ExpirationToken;
import com.phuocnga.model.OrderDetailEntity;
import com.phuocnga.model.OrderDetailId;
import com.phuocnga.model.OrderEntity;
import com.phuocnga.model.OrderMethodEntity;
import com.phuocnga.model.ProductCategoryEntity;
import com.phuocnga.model.ProductSizeEntity;
import com.phuocnga.model.ProductSizeId;
import com.phuocnga.model.ProductToppingEntity;
import com.phuocnga.model.SizeEntity;
import com.phuocnga.model.ProductEntity;
import com.phuocnga.model.UserEntity;

@Configuration
@EnableTransactionManagement
@ComponentScan(basePackages= {"com.phuocnga.model","com.phuocnga.dao","com.phuocnga.service"})
public class HibernateConfig {
	@Autowired
	private ApplicationContext context;

	@Bean
	public LocalSessionFactoryBean getSessionFactory() {
		LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
		factoryBean.setConfigLocation(context.getResource("classpath:hibernate.cfg.xml"));
		factoryBean.setAnnotatedClasses(UserEntity.class,
				ProductCategoryEntity.class,ProductSizeId.class,ProductSizeEntity.class,SizeEntity.class, ProductToppingEntity.class, ProductEntity.class,
				ExpirationToken.class, OrderMethodEntity.class, OrderEntity.class, OrderDetailId.class,
				OrderDetailEntity.class,City.class,District.class);
		return factoryBean;
	}

	@Bean
	public HibernateTransactionManager getTransactionManager() {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager();
		transactionManager.setSessionFactory(getSessionFactory().getObject());
		return transactionManager;
	}

	// Configure message
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource source = new ResourceBundleMessageSource();
		source.setBasename("messages");
		return source;
	}

	@Bean
	public Validator getValidator() {
		LocalValidatorFactoryBean validator = new LocalValidatorFactoryBean();
		validator.setValidationMessageSource(messageSource());
		return validator;
	}
}
