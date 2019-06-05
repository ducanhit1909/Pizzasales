package com.phuocnga.controller;
import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import com.phuocnga.model.OrderDetailId;
import com.phuocnga.model.OrderJsonEntity;
import com.phuocnga.service.OrderService;

@RequestMapping("/order")
@Controller
@SessionAttributes("orderJson")
public class OrderController {
	@Autowired
	OrderService orderService;

	@RequestMapping(value = "/addtocart", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public OrderJsonEntity addProductToCart(@RequestParam(name = "productId", required = false) int productId,
			@RequestParam(name = "topping", required = false) int topping,
			@RequestParam(name = "size", required = false) int size, HttpServletRequest request, Model model) {
		Principal principle = request.getUserPrincipal();
		String username = principle != null ? principle.getName() : null;
		Integer orderId;
		String productName;
		OrderJsonEntity orderJson;
		if (username == null) {
			orderJson = new OrderJsonEntity(false, null, 0L);
			return orderJson;
		} else {
			if ((orderId = orderService.checkOrderExsist(username)) == null) {
				orderId = orderService.createOrderByEmail(username);
				productName = orderService.createOrderDetail(orderId, productId, topping, size);
			} else {
				if (orderService.checkOrderDetailExist(orderId, productId, topping, size)) {
					productName = orderService.updateOrderDetail(orderId, productId, topping, size, 1);
				} else {
					productName = orderService.createOrderDetail(orderId, productId, topping, size);
				}
			}
		}
		orderJson = new OrderJsonEntity(true, productName, orderService.calculateTotalQuantityOfOrder(orderId));
		orderJson.setTotalPriceOfOrder(orderService.calculateTotalPriceOfOrder(orderId));
		model.addAttribute("orderJson", orderJson);
		return orderJson;
	}

	@GetMapping("/orderDetail")
	public String orderDetail() {
		return "front_end/orders";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public OrderJsonEntity deleteProductFromOrder(@RequestBody OrderDetailId orderDetailId, Model model) {
		orderService.deleteOrderDetail(orderDetailId);
		OrderJsonEntity orderJson=addOrderJsonToSession(orderDetailId.getOrderId(), model);
		return orderJson;
	}

	@ModelAttribute
	public void getOrderDetail(Model model, HttpServletRequest request) {
		Principal principle = request.getUserPrincipal();
		Integer orderId;
		if (principle != null && (orderId = orderService.checkOrderExsist(principle.getName())) != null) {
			model.addAttribute("orderDetails", orderService.getOrderDetailByUser(orderId));
			addOrderJsonToSession(orderId, model);
		}
	}

	@GetMapping("/update")
	@ResponseBody
	public OrderJsonEntity updateOrderDetail(@RequestParam int orderId, @RequestParam int productId,
			@RequestParam int productToppingId, @RequestParam int productSizeId, @RequestParam int quantity,
			Model model) {
		orderService.updateQuantityOfOrder(orderId, productId, productToppingId, productSizeId, quantity);
		return addOrderJsonToSession(orderId, model);
	}

	@GetMapping("/place_order")
	public String placeOrder(@RequestParam("orderId") int orderId, Model model) {
		model.addAttribute("orderId", orderId);
		return "front_end/order_method";
	}

	// Method add order detail to session and return new order json
	public OrderJsonEntity addOrderJsonToSession(int orderId, Model model) {
		Long totalQuantityReturn = orderService.calculateTotalQuantityOfOrder(orderId);
		Double totalPriceReturn = orderService.calculateTotalPriceOfOrder(orderId);
		OrderJsonEntity orderJson = new OrderJsonEntity(true, null, totalQuantityReturn);
		orderJson.setTotalPriceOfOrder(totalPriceReturn);
		model.addAttribute("orderJson", orderJson);
		return orderJson;
	}

	@PostMapping("/place_order")
	@ResponseBody
	public String placeOrder(@RequestParam("orderId") int orderId, @RequestParam("orderMethod") int orderMethod,
			Model model, WebRequest webrequest) {
		orderService.placeOrder(orderId, orderMethod);
		addOrderJsonToSession(-1, model);
		return "Your order is placed, keep your phone, We'll contact you later!";
	}
}