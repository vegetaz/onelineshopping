package mnm.n13.onlineshopping.controller;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mnm.n13.onlineshopping.exception.ProductNotFoundException;
import mnm.n13.onlineshopping.service.CartService;
import mnm.n13.onlineshopping.util.FileUtil;
import mnm.n13.shoppingbackend.dao.CartLineDAO;
import mnm.n13.shoppingbackend.dao.CategoryDAO;
import mnm.n13.shoppingbackend.dao.ProductDAO;
import mnm.n13.shoppingbackend.dao.UserDAO;
import mnm.n13.shoppingbackend.dto.Category;
import mnm.n13.shoppingbackend.dto.Product;
import mnm.n13.shoppingbackend.dto.User;

@Controller
public class PageController {
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private CartLineDAO cartLineDAO;
	
	@RequestMapping(value = {"/", "/home", "/index"})
	public ModelAndView index(@RequestParam(name="logout",required=false)String logout) {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","Trang chủ");
		
		logger.info("Inside PageController index method - INFO");
		logger.debug("Inside PageController index method - DEBUG");
		
		//passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		
		
		if(logout!=null) {
			mv.addObject("message", "Bạn đã đăng xuất thành công!");			
		}
		
		mv.addObject("userClickHome",true);
		return mv;				
	}
	
	@RequestMapping(value = "/about")
	public ModelAndView about() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","Về chúng tôi");
		mv.addObject("userClickAbout",true);
		return mv;				
	}	
	
	@RequestMapping(value = "/contact")
	public ModelAndView contact() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","Liên hệ");
		mv.addObject("userClickContact",true);
		return mv;				
	}	
	
	
	/*
	 * Methods to load all the products and based on category
	 * */
	
	@RequestMapping(value = "/show/all/products")
	public ModelAndView showAllProducts() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","Tất cả các sản phẩm");
		
		//passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		
		mv.addObject("userClickAllProducts",true);
		return mv;				
	}	
	
	@RequestMapping(value = "/show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {		
		ModelAndView mv = new ModelAndView("page");
		
		// categoryDAO to fetch a single category
		Category category = null;
		
		category = categoryDAO.get(id);
		
		mv.addObject("title",category.getName());
		
		//passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		
		// passing the single category object
		mv.addObject("category", category);
		
		mv.addObject("userClickCategoryProducts",true);
		return mv;				
	}	
	
	
	/*
	 * Viewing a single product
	 * */
	
	@RequestMapping(value = "/show/{id}/product") 
	public ModelAndView showSingleProduct(@PathVariable int id) throws ProductNotFoundException {
		
		ModelAndView mv = new ModelAndView("page");
		
		Product product = productDAO.get(id);
		
		if(product == null) throw new ProductNotFoundException();
		
		// update the view count
		product.setViews(product.getViews() + 1);
		productDAO.update(product);
		//---------------------------
		
		mv.addObject("title", product.getName());
		mv.addObject("product", product);
		
		mv.addObject("userClickShowProduct", true);
		
		
		return mv;
		
	}
	
	
	@RequestMapping(value="/membership")
	public ModelAndView register() {
		ModelAndView mv= new ModelAndView("page");
		
		logger.info("Page Controller membership called!");
		
		return mv;
	}
	
	
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam(name="error", required = false)	String error,
			@RequestParam(name="logout", required = false) String logout) {
		ModelAndView mv= new ModelAndView("login");
		mv.addObject("title", "Đăng nhập");
		if(error!=null) {
			mv.addObject("message", "Tên đăng nhập hoặc mật khẩu không đúng!");
		}
		if(logout!=null) {
			mv.addObject("logout", "Bạn đã đăng xuất thành công!");
		}
		return mv;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		// Invalidates HTTP Session, then unbinds any objects bound to it.
	    // Removes the authentication from securitycontext 		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
		
		return "redirect:/login?logout";
	}
	
	@RequestMapping(value="/amount",method=RequestMethod.GET)
	public ModelAndView amount(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("amount");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userDAO.getByEmail(auth.getName());
		
		return mv;
	}
	
	@RequestMapping(value="/user-amount",method=RequestMethod.POST)
	public ResponseEntity<String> userAmount(MultipartFile fileAmount, Long amount, HttpServletRequest request, HttpServletResponse response) {
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			User user = userDAO.getByEmail(auth.getName());
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyyyy");
			Random r = new Random();
			String rdName = dateFormat.format(new Date()) + r.nextInt(999999999) + "" + r.nextInt(999999999) + "" + r.nextInt(999999999);
			String contextPath = request.getContextPath();
			String path = FileUtil.uploadFilePath(request, fileAmount, rdName,contextPath);
			
			
			cartLineDAO.addLogAmount(user.getEmail(),amount,path);
			
			
			return new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch(Exception e){
			return new ResponseEntity<String>("error", HttpStatus.OK);
		}
	}
	
	@RequestMapping(value="/access-denied")
	public ModelAndView accessDenied() {
		ModelAndView mv = new ModelAndView("error");		
		mv.addObject("errorTitle", "Xin chào!");		
		mv.addObject("errorDescription", "Bạn không có quyền truy cập trang này!");		
		mv.addObject("title", "403 Truy cập bị từ chối");		
		return mv;
	}	
		
	
	
}
