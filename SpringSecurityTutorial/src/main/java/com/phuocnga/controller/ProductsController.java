package com.phuocnga.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.phuocnga.model.ProductEntity;
import com.phuocnga.service.ProductService;

@RequestMapping("/managements/pizza_managements")
@Controller
public class ProductsController {
	public static final String PATH = "resources/images/Product/";
	@Autowired
	ProductService pdService;

	@GetMapping("/add_pizza")
	public String addNewPizza(Model model) {
		model.addAttribute("sizes", pdService.sizes());
		model.addAttribute("categories", pdService.categories());
		model.addAttribute("toppings", pdService.toppings());
		return "back-end/addPizza";
	}

	@GetMapping("/pizzas")
	public ModelAndView pizzas(ModelAndView modelAndView) {
		modelAndView.setViewName("back-end/pizza_managements");
		modelAndView.addObject("pizzas_admin", pdService.getAllProducts());
		return modelAndView;
	}

	@PostMapping("/add_pizza")
	public String addNewPizza(Model model, @RequestParam(value = "toppings", required = false) int[] toppings,
			@RequestParam(value = "sizes", required = false) int[] sizes,
			@RequestParam(value = "pizza_name", required = false) String pizzaName,
			@RequestParam(required = false) Integer category, @RequestParam(required = false) String description,
			@RequestParam(value = "pizza_image", required = false) CommonsMultipartFile image,
			HttpServletRequest request, RedirectAttributes redirectAttribute) {
		uploadImage(image, request);
		if (toppings == null) {
			redirectAttribute.addFlashAttribute("err_topping", "Please choice at least one topping type");
		}
		if (sizes == null) {
			redirectAttribute.addFlashAttribute("err_size", "Please choice at least one size");
		} else {
			redirectAttribute.addFlashAttribute("success", "Add product success!");
			pdService.addProduct(pizzaName, category, description, sizes, toppings, PATH + image.getOriginalFilename());
		}
		return "redirect:/managements/pizza_managements/add_pizza";
	}

	public void uploadImage(CommonsMultipartFile image, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath(PATH);
		File file = new File(path + File.separator + image.getOriginalFilename());
		BufferedOutputStream out;
		byte[] b = image.getBytes();
		try {
			out = new BufferedOutputStream(new FileOutputStream(file));
			out.write(b);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@GetMapping("/edit_pizza")
	public ModelAndView editPizza(ModelAndView modelAndView, @RequestParam int pizzaId) {
		ProductEntity productEntity = pdService.getProduct(pizzaId);
		modelAndView.setViewName("back-end/editPizza");
		modelAndView.addObject("product", productEntity);
		modelAndView.addObject("toppings", pdService.toppings());
		modelAndView.addObject("categories", pdService.categories());
		return modelAndView;
	}

	public boolean checkIsNullArray(List<Float> prices) {
		for (Float i : prices) {
			if (i == null) {
				return true;
			}
		}
		return false;
	}

	@PostMapping("/edit_pizza")
	public String editPizza(@RequestParam(required = false, value = "pizzaName") String pizzaName,
			@RequestParam(required = false, value = "pizzaCategory") Integer pizzaCategory,
			@RequestParam(required = false, value = "toppings") int[] toppings,
			@RequestParam(required = false, value = "size") int[] size,
			@RequestParam(required = false, value = "price") List<Float> price,
			@RequestParam(required = false) String description,
			@RequestParam(required = false, value = "pizza_image") CommonsMultipartFile pizza_image,
			@RequestParam int productId, Model model, RedirectAttributes ridr, HttpServletRequest request) {
		boolean err = false;
		if (checkIsNullArray(price)) {
			ridr.addFlashAttribute("price_err", "Please fill all input price!");
			err = true;
		}
		if (toppings == null) {
			ridr.addFlashAttribute("topping_err", "Please choice at least one check box toppings");
			err = true;
		}
		if (err) {
		} else {
			if (pizza_image.isEmpty()) {
				pdService.updateProduct(productId, pizzaName, pizzaCategory, description, size, price, toppings, null);
			} else {
				uploadImage(pizza_image, request);
				pdService.updateProduct(productId, pizzaName, pizzaCategory, description, size, price, toppings,
						PATH+pizza_image.getOriginalFilename());
			}
			ridr.addFlashAttribute("success", "Update product successful!");
		}
		return "redirect:/managements/pizza_managements/edit_pizza?pizzaId=" + productId;
	}
}
