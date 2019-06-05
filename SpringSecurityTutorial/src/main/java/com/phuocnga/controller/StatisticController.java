package com.phuocnga.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/managements/statistic_managements")
@Controller
public class StatisticController {
	@GetMapping("/statistic")
	public String statistic() {
		return "back-end/statistic";
	}
}
