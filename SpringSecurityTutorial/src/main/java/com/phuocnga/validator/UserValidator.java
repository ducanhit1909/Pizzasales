package com.phuocnga.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import com.phuocnga.model.UserEntity;
import com.phuocnga.service.UserService;

@Component
public class UserValidator implements Validator {

	@Autowired
	UserService usService;

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return UserEntity.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullName", "user.fullName.empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "user.email.empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassWord", "user.confirmPassWord.empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "user.password.empty");
		UserEntity user = (UserEntity) obj;
		Pattern pattern = Pattern
				.compile("^[_A-Za-z0-9-+]+(.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(.[A-Za-z0-9]+)*(.[A-Za-z]{2,})$");
		Matcher matcher = pattern.matcher(user.getEmail());
		if (!matcher.matches() && user.getEmail().length() > 0) {
			errors.rejectValue("email", "user.email.invalid");
		}
		if (user.getConfirmPassWord().length() > 0 && !user.getPassword().equals(user.getConfirmPassWord())) {
			errors.rejectValue("confirmPassWord", "user.confirmPassWord.error");
		}
		if (user.getEmail().length() > 0 && usService.checkUserIsExist(user)) {
			errors.rejectValue("email", "user.email.duplicate");
		}
		if (user.getPassword().length() > 0 && user.getPassword().length() < 8) {
			errors.rejectValue("password", "user.password.error");
		}
		if(user.getCityId()==0) {
			errors.rejectValue("cityId", "user.cityId.empty");
		}
	}

}
