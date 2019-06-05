package com.phuocnga.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import com.phuocnga.event.RegistrationEvent;
import com.phuocnga.event.ResetTokenEvent;
import com.phuocnga.model.City;
import com.phuocnga.model.District;
import com.phuocnga.model.UserEntity;
import com.phuocnga.model.UserJsonEntity;
import com.phuocnga.service.SecurityService;
import com.phuocnga.service.UserService;
import com.phuocnga.validator.UserValidator;

@RequestMapping("/signup")
@Controller
public class RegistrationController {
	@Autowired
	UserValidator userValidator;
	@Autowired
	UserService usService;
	@Autowired
	ApplicationEventPublisher publisher;
	@Autowired
	MessageSource message;
	@Autowired
	SecurityService securityService;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.addValidators(userValidator);
	}

	@ModelAttribute("user")
	public UserEntity formBackingObject() {
		return new UserEntity();
	}

	@ModelAttribute("citys")
	public List<City> getAllCity() {
		return usService.citys();
	}

	// Validate signup form
	@PostMapping("/form_validate")
	@ResponseBody
	public UserJsonEntity loginProcesss(@Valid UserEntity user, BindingResult binding,
			WebRequest request, Model model) {
		UserJsonEntity userJson = new UserJsonEntity();
		if (binding.hasErrors()) {
			String error;
			Map<String, String> errors = new HashMap<String, String>();
			for (int i = 0; i < binding.getFieldErrors().size(); i++) {
				error = message.getMessage(binding.getFieldErrors().get(i).getCode(), null, request.getLocale());
				errors.put(binding.getFieldErrors().get(i).getField(), error);
			}
			userJson.setError(true);
			userJson.setErrors(errors);
		} else {
			String url = request.getContextPath();
			user.setDistrict(usService.getDistrictFromId(user.getDistrictId()));
			publisher.publishEvent(new RegistrationEvent(user, request.getLocale(), url));
			model.addAttribute("sendTokenMessage",
					message.getMessage("register.user.reset_token", null, request.getLocale()));
			userJson.setError(false);
		}
		return userJson;

	}

	@GetMapping(value = "/getDistrict")
	@ResponseBody
	public List<District> getDistrictFromCity(@RequestParam int cityId) {
		return usService.getDistrictFromCity(cityId);
	}

	// Confirm token
	@GetMapping("/confirmToken/{token}")
	public String confirmToken(@PathVariable String token, Model model, WebRequest request) {
		UserEntity user = usService.confirmToken(token);
		if (user == null) {
			// Error token is not exists
			model.addAttribute("tokenMessage",
					message.getMessage("register.token.notexists", null, request.getLocale()));
		} else {
			if (user.getEnable()) {
				// Error user already activated
				model.addAttribute("tokenMessage",
						message.getMessage("register.user.activated", null, request.getLocale()));
			} else {
				if (LocalDateTime.now().isAfter(user.getTokenExpired().getExpirationDate())) {
					// The token is expired
					model.addAttribute("tokenMessage",
							message.getMessage("register.token.expired", null, request.getLocale()));
				} else {
					// User is registered successfully!
					// Return index page
					user.setConfirmPassWord(user.getPassword());
					user.setEnable(true);
					usService.updateUser(user);
					model.addAttribute("tokenMessage",
							message.getMessage("register.user.success_register", null, request.getLocale()));

					return "front_end/login";
				}
			}
		}
		return "front_end/error";
	}

	@GetMapping("/reset_token")
	public String resetToken() {
		return "front_end/resettoken";
	}

	// Reset token
	@PostMapping("/reset_token")
	public String checkingUser(@RequestParam("email") String email, Model model, WebRequest request) {
		UserEntity user = usService.getUserFromEmail(email);
		if (user == null) {
			model.addAttribute("errorMessage", message.getMessage("user.email.invalid", null, request.getLocale()));
		} else {
			if (user.getEnable()) {
				model.addAttribute("errorMessage",
						message.getMessage("register.user.activated", null, request.getLocale()));
			} else {
				model.addAttribute("errorMessage",
						message.getMessage("register.user.reset_token", null, request.getLocale()));
				publisher.publishEvent(new ResetTokenEvent(user, request.getContextPath()));
			}
		}
		return "front_end/resettoken";
	}
}
