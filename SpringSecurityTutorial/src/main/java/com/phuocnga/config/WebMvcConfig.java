package com.phuocnga.config;

import java.util.Properties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.theme.ThemeChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import com.phuocnga.event.RegistrationEventListener;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.phuocnga.controller",
		"com.phuocnga.validator", }, excludeFilters = @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, value = {
				HibernateConfig.class, WebMvcConfig.class, WebSecurityConfig.class }))
@EnableAsync
public class WebMvcConfig implements WebMvcConfigurer {

	@Autowired
	JavaMailSender mailSender;

	/*
	 * STEP 1 - Create SpringResourceTemplateResolver
	 */
	/* JSP Config */
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();

		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");

		return bean;
	}

	/*
	 * ____________________________________Thymeleaf
	 * config_________________________________________________
	 */
//	  @Bean
//	   public SpringResourceTemplateResolver templateResolver() {
//	      SpringResourceTemplateResolver templateResolver = new SpringResourceTemplateResolver();
//	      templateResolver.setApplicationContext(applicationContext);
//	      templateResolver.setPrefix("/WEB-INF/views/");
//	      templateResolver.setSuffix(".html");
//	      return templateResolver;
//	   }
//	  
//	  @Bean
//	   public SpringTemplateEngine templateEngine() {
//	      SpringTemplateEngine templateEngine = new SpringTemplateEngine();
//	      templateEngine.setTemplateResolver(templateResolver());
//	      templateEngine.setEnableSpringELCompiler(true);
//	      return templateEngine;
//	   }
//	  
//	  @Override
//	   public void configureViewResolvers(ViewResolverRegistry registry) {
//	      ThymeleafViewResolver resolver = new ThymeleafViewResolver();
//	      resolver.setTemplateEngine(templateEngine());
//	      registry.viewResolver(resolver);
//	   }
	/*
	 * _____________________________________________________________________________________________________
	 */

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Bean
	public LocaleResolver localeResolver() {
		CookieLocaleResolver localeResolver = new CookieLocaleResolver();
		return localeResolver;
	}

	@Bean
	public JavaMailSender getJavaMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);

		mailSender.setUsername("nobitahuynh997@gmail.com");
		mailSender.setPassword("06111997nga");

		Properties props = mailSender.getJavaMailProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		return mailSender;
	}

	@Bean
	public RegistrationEventListener listener() {
		return new RegistrationEventListener();
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		ThemeChangeInterceptor themeChangeInterceptor = new ThemeChangeInterceptor();
		themeChangeInterceptor.setParamName("theme");
		registry.addInterceptor(themeChangeInterceptor);

		LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
		localeChangeInterceptor.setParamName("lang");
		registry.addInterceptor(localeChangeInterceptor);
	}

	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(5000000);
		return multipartResolver;
	}
}
