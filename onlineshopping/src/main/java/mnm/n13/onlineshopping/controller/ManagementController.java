package mnm.n13.onlineshopping.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mnm.n13.onlineshopping.util.FileUtil;
import mnm.n13.onlineshopping.validator.ProductValidator;
import mnm.n13.shoppingbackend.dao.CartLineDAO;
import mnm.n13.shoppingbackend.dao.CategoryDAO;
import mnm.n13.shoppingbackend.dao.ProductDAO;
import mnm.n13.shoppingbackend.dto.Category;
import mnm.n13.shoppingbackend.dto.LogAmount;
import mnm.n13.shoppingbackend.dto.OrderDetail;
import mnm.n13.shoppingbackend.dto.Product;

@Controller
@RequestMapping("/manage")
public class ManagementController {

	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;	
	
	@Autowired
	private CartLineDAO cartLineDAO;
	
	@RequestMapping("/manageCart/update")
	public String manageCart(@RequestParam int id) {		

		cartLineDAO.updateOrderDetail(id);
		
		return "redirect:/manage/manageCart";
	}
	
	@RequestMapping("/manageCart")
	public ModelAndView manageCart(@RequestParam(name="success",required=false)String success) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Quản lý giỏ hàng");		
		mv.addObject("userClickManageCart",true);
		
		List<OrderDetail> orderDetail = new ArrayList<OrderDetail>();
		orderDetail = cartLineDAO.listOrderDetail();

		mv.addObject("orderDetail", orderDetail);
		return mv;
	}
	
	@RequestMapping("/manageAmount/update")
	public String manageAmount(@RequestParam int id, @RequestParam Long amount) {

		cartLineDAO.updateLogAmount(id, amount);
		
		return "redirect:/manage/manageAmount";
	}
	
	@RequestMapping("/manageAmount")
	public ModelAndView manageAmount() {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Quáº£n lĂ½ vĂ­ tiá»�n");		
		mv.addObject("userClickAmount",true);
		
		List<LogAmount> logAmount = new ArrayList<LogAmount>();
		logAmount = cartLineDAO.listLogAmount();

		mv.addObject("logAmount", logAmount);
		return mv;
	}

	@RequestMapping("/product")
	public ModelAndView manageProduct(@RequestParam(name="success",required=false)String success) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Quản lý sản phẩm");		
		mv.addObject("userClickManageProduct",true);
		
		Product nProduct = new Product();
		
		// assuming that the user is ADMIN
		// later we will fixed it based on user is SUPPLIER or ADMIN
		nProduct.setSupplierId(1);
		nProduct.setActive(true);

		mv.addObject("product", nProduct);

		
		if(success != null) {
			if(success.equals("product")){
				mv.addObject("message", "Sản phẩm đã được thêm vào!");
			}	
			else if (success.equals("category")) {
				mv.addObject("message", "Danh mục sản phẩm đã được thêm vào!");
			}
		}
			
		return mv;
		
	}

	
	@RequestMapping("/{id}/product")
	public ModelAndView manageProductEdit(@PathVariable int id) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Quản lý sản phẩm");		
		mv.addObject("userClickManageProduct",true);
		
		// Product nProduct = new Product();		
		mv.addObject("product", productDAO.get(id));

			
		return mv;
		
	}
	
	
	@RequestMapping(value = "/product", method=RequestMethod.POST)
	public String managePostProduct(@Valid @ModelAttribute("product") Product mProduct, 
			BindingResult results, Model model, HttpServletRequest request) {
		
		// mandatory file upload check
		if(mProduct.getId() == 0) {
			new ProductValidator().validate(mProduct, results);
		}
		else {
			// edit check only when the file has been selected
			if(!mProduct.getFile().getOriginalFilename().equals("")) {
				new ProductValidator().validate(mProduct, results);
			}			
		}
		
		if(results.hasErrors()) {
			model.addAttribute("message", "XĂ¡c thá»±c khĂ´ng thĂ nh cĂ´ng khi thĂªm sáº£n pháº©m!");
			model.addAttribute("userClickManageProduct",true);
			return "page";
		}			

		
		if(mProduct.getId() == 0 ) {
			productDAO.add(mProduct);
		}
		else {
			productDAO.update(mProduct);
		}
	
		 //upload the file
		 if(!mProduct.getFile().getOriginalFilename().equals("") ){
			FileUtil.uploadFile(request, mProduct.getFile(), mProduct.getCode()); 
		 }
		
		return "redirect:/manage/product?success=product";
	}

	
	@RequestMapping(value = "/product/{id}/activation", method=RequestMethod.GET)
	@ResponseBody
	public String managePostProductActivation(@PathVariable int id) {		
		Product product = productDAO.get(id);
		boolean isActive = product.isActive();
		product.setActive(!isActive);
		productDAO.update(product);		
		return (isActive)? "Ä�Ă£ huá»· kĂ­ch hoáº¡t sáº£n pháº©m!": "Ä�Ă£ kĂ­ch hoáº¡t sáº£n pháº©m";
	}
			

	@RequestMapping(value = "/category", method=RequestMethod.POST)
	public String managePostCategory(@ModelAttribute("category") Category mCategory, HttpServletRequest request) {					
		categoryDAO.add(mCategory);		
		return "redirect:" + request.getHeader("Referer") + "?success=category";
	}
			
	
	
	@ModelAttribute("categories") 
	public List<Category> modelCategories() {
		return categoryDAO.list();
	}
	
	@ModelAttribute("category")
	public Category modelCategory() {
		return new Category();
	}
	
	
}

	
