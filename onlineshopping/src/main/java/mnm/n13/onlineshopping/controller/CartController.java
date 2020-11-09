package mnm.n13.onlineshopping.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mnm.n13.onlineshopping.handler.CheckoutHandler;
import mnm.n13.onlineshopping.service.CartService;
import mnm.n13.onlineshopping.util.FileUtil;
import mnm.n13.shoppingbackend.dao.CartLineDAO;
import mnm.n13.shoppingbackend.dao.UserDAO;
import mnm.n13.shoppingbackend.dto.Amount;
import mnm.n13.shoppingbackend.dto.Cart;
import mnm.n13.shoppingbackend.dto.CartLine;
import mnm.n13.shoppingbackend.dto.User;

@Controller
@RequestMapping("/cart")
public class CartController {

	private final static Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private CartLineDAO cartLineDAO;
	
	@RequestMapping("/show")
	public ModelAndView showCart(@RequestParam(name = "result", required = false) String result) {
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Giỏ hàng");
		mv.addObject("userClickShowCart", true);
		
		if(result!=null) {
			switch(result) {
				case "added":
					mv.addObject("message", "Sản phẩm đã được thêm vào giỏ hàng thành công!");					
					cartService.validateCartLine();
					break;
				case "unavailable":
					mv.addObject("message", "Số lượng sản phẩm không có sẵn!");					
					break;
				case "updated":
					mv.addObject("message", "Giỏ hàng đã được cập nhật thành công!");					
					cartService.validateCartLine();
					break;
				case "modified":
					mv.addObject("message", "Mặt hàng trong giỏ hàng đã được sửa đổi!");
					break;
				case "maximum":
					mv.addObject("message", "Đã đạt giới hạn tối đã cho sản phẩm!");
					break;
				case "deleted":
					mv.addObject("message", "Sản phẩm đã được gỡ bỏ!");
					break;

			}
		}
		else {
			String response = cartService.validateCartLine();
			if(response.equals("result=modified")) {
				mv.addObject("message", "Mặt hàng trong giỏ hàng đã được sửa đổi!");
			}
		}

		mv.addObject("cartLines", cartService.getCartLines());
		return mv;
		
	}
	

	@RequestMapping("/{cartLineId}/update")
	public String udpateCartLine(@PathVariable int cartLineId, @RequestParam int count) {
		String response = cartService.manageCartLine(cartLineId, count);		
		return "redirect:/cart/show?"+response;		
	}
	
	@RequestMapping("/add/{productId}/product")
	public String addCartLine(@PathVariable int productId) {
		String response = cartService.addCartLine(productId);
		return "redirect:/cart/show?"+response;
	}
	
	@RequestMapping("/{cartLineId}/remove")
	public String removeCartLine(@PathVariable int cartLineId) {
		String response = cartService.removeCartLine(cartLineId);
		return "redirect:/cart/show?"+response;
	}
	
	/* after validating it redirect to checkout
	 * if result received is success proceed to checkout 
	 * else display the message to the user about the changes in cart page
	 * */	
	@RequestMapping("/validate")
	public String validateCart() {
		String response = cartService.validateCartLine();
		if(!response.equals("result=success")) {
			return "redirect:/cart/show?"+response;
		}
		else {
			return "redirect:/cart/checkout";
		}
	}
	
	@RequestMapping(value="/payonline",method=RequestMethod.POST)
	public ResponseEntity<String> payonline(MultipartFile file, HttpServletRequest request) {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyyyy");
			Random r = new Random();
			String rdName = dateFormat.format(new Date()) + r.nextInt(999999999) + ""
	                + r.nextInt(999999999) + "" + r.nextInt(999999999);
			String contextPath = request.getContextPath();
			String path = FileUtil.uploadFilePath(request, file, rdName,contextPath);
			CheckoutHandler.path = path;
			
			return new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch(Exception e){
			return new ResponseEntity<String>("error", HttpStatus.OK);
		}
	}
	
	@RequestMapping(value="/payAmount",method=RequestMethod.GET)
	public ResponseEntity<String> payAmount(HttpServletRequest request) {
		try {
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			User user = userDAO.getByEmail(auth.getName());
			
			List<CartLine> cartLines = cartLineDAO.listAvailable(user.getCart().getId());
			
			boolean checkcart = false;
			if(cartLines.size() > 0) {
				checkcart = cartLineDAO.checkByPay(cartLines.get(0).getCartId(), user.getEmail());
			} else {
				checkcart = cartLineDAO.checkByPay(-1, user.getEmail());
			}
			
			if(checkcart) {
				CheckoutHandler.path = "-1";
			} else {
				return new ResponseEntity<String>("notok", HttpStatus.OK);
			}
			
			return new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch(Exception e){
			return new ResponseEntity<String>("error", HttpStatus.OK);
		}
	}
	
	@RequestMapping(value="/getAmount",method=RequestMethod.GET)
	public ResponseEntity<Amount> getAmount(HttpServletRequest request) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userDAO.getByEmail(auth.getName());
		Amount am = cartLineDAO.getAmount(user.getEmail());
		
		return new ResponseEntity<Amount>(am, HttpStatus.OK);
		
	}
	
}
