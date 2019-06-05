package com.phuocnga.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.phuocnga.model.City;
import com.phuocnga.model.ProductEntity;
import com.phuocnga.model.UserEntity;
import com.phuocnga.service.ProductService;
import com.phuocnga.service.UserService;

@Controller
public class HomeController {
	@Autowired
	ProductService productService;
	@Autowired
	UserService userService;

	@GetMapping("/")
	public String redirectHome() {
		return "front_end/index";
	}

	@GetMapping("/signup")
	public String signUp() {
		return "front_end/register";
	}

	@ModelAttribute("user")
	public UserEntity formBackingObject() {
		return new UserEntity();
	}

	@ModelAttribute("citys")
	public List<City> getAllCity() {
		return userService.citys();
	}

	/* Pagination */
	@GetMapping("/products")
	public String product(HttpSession session, Model model) {
		model.addAttribute("products", productService.paginationPage(0, 5));
		model.addAttribute("page", 5);
		return "front_end/product";
	}

	@RequestMapping(value = "/products/page", method = RequestMethod.GET)
	public String pagination(@RequestParam int productRequest, Model model) {
		int numberElementOfEachPage = 5;
		int totalProduct = productService.totalOfPage(numberElementOfEachPage);
		List<ProductEntity> resultList = productService.paginationPage(0, productRequest);
		if (productRequest >= totalProduct * numberElementOfEachPage) {
			model.addAttribute("outOfPage", true);
		} else {
			model.addAttribute("outOfPage", false);
		}
		model.addAttribute("page", productRequest);
		model.addAttribute("products", resultList);
		return "front_end/product";
	}

	/**********************************************************************************************/
	@GetMapping("/error")
	public String error() {
		return "error";
	}

	/* Admin Managements */
	@GetMapping("/managements/admin_managements")
	public String admin() {
		return "back-end/index";
	}

}
