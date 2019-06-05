package com.phuocnga.controller;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.phuocnga.model.City;
import com.phuocnga.model.District;
import com.phuocnga.model.UserEntity;
import com.phuocnga.service.UserService;

@Controller
@RequestMapping(value="/managements/")
public class UserController {
	@Autowired
	UserService userService;

	@GetMapping("/customer")
	public ModelAndView list(HttpServletRequest request) {
		String notify = request.getParameter("notyfi");
		ModelAndView model = new ModelAndView("back-end/customer_managements");
		List<UserEntity> list = userService.users();
		List<City> listCity = userService.citys();
		model.addObject("list", list);
		model.addObject("notyfi", notify);
		model.addObject("listCity", listCity);
		return model;
	}

	/*
	 * @GetMapping("/add") public ModelAndView add() { ModelAndView model = new
	 * ModelAndView("back-end/addCustomer"); UserEntity user = new UserEntity();
	 * model.addObject("user", user); return model; }
	 */

	@GetMapping("/delete/{id}")
	public @ResponseBody String delete(@PathVariable("id") int id) {
		boolean ok=userService.deleteUser(id);
		if(ok) {
			return "success";
		}else {
			return "fail";
		}
	}
//	@GetMapping("/update/{id}")
//	public @ResponseBody String update(@PathVariable("id") int id) {
//		boolean ok=userService.deleteUser(id);
//		if(ok) {
//			return "success";
//		}else {
//			return "fail";
//		}
//	}
	@GetMapping("/update/{id}")
	public @ResponseBody Map<String, Object> update(@PathVariable("id") int id) {
		UserEntity user = userService.getUserById(id);
		Map<String, Object> ds = new LinkedHashMap<>();
		ds.put("user", user);
		ds.put("city", user.getDistrict().getCity());
		return ds;
	}
	@GetMapping("/validate-email")
	public @ResponseBody String validateEmail(@RequestParam("email") String email) {
		UserEntity a = userService.getUserFromEmail(email);
		System.out.print(email);
		if (a == null) {
			return "no";
		} else {
			return "yes";
		}
	}
	@GetMapping("/select-city")
	public @ResponseBody List<District> selectCity(@RequestParam("cityId") int cityId) {
		List<District> listDistrict = userService.getDistrictFromCity(cityId);
		System.err.println(listDistrict);
		return listDistrict;
	}
	@PostMapping("/save")
	public @ResponseBody String save(@ModelAttribute UserEntity user) {
		
		try {
			user.setDistrict(userService.getDistrictFromId(user.getDistrictId()));
			userService.addNewUser(user);
			return "ok";
		}catch(Exception e) {
			return e.getMessage();
		}
	}
//	@PostMapping("/save")
//	public ModelAndView save(UserEntity user) {
//		userService.addNewUser(user);
//		return new ModelAndView("redirect:/customer-management");
//			
//	}

}
