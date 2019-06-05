package com.phuocnga.controller;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;

import com.phuocnga.model.OrderJsonEntity;
import com.phuocnga.service.OrderService;
import com.phuocnga.service.UserService;

@Controller
@SessionAttributes("orderJson")
public class LoginController {
	@Autowired
	MessageSource message;
	@Autowired
	UserService usService;
	@Autowired
	OrderService odService;

	@RequestMapping(value = "/signin")
	public String signIn(@RequestParam(value = "error", required = false) boolean error,
			@RequestParam(value = "success", required = false) boolean success, Model model, WebRequest request,
			Principal principle) {
		if (error) {
			model.addAttribute("errorLoginMessage", message.getMessage("login.error", null, request.getLocale()));
		} else {
			if (success) {
				Integer orderId;
				Long totalQuantityOfOrder = new Long(0);
				Double totalPriceOfOrder=new Double(0);
				OrderJsonEntity orderJson;
				if ((orderId = odService.checkOrderExsist(principle.getName())) != null) {
					totalQuantityOfOrder = odService.calculateTotalQuantityOfOrder(orderId);
					totalPriceOfOrder=odService.calculateTotalPriceOfOrder(orderId);
					orderJson=new OrderJsonEntity(true, null, totalQuantityOfOrder);
					orderJson.setTotalPriceOfOrder(totalPriceOfOrder);
					model.addAttribute("orderJson",orderJson);
				}
				return "redirect:/products";
			}
		}
		return "front_end/login";
	}
}