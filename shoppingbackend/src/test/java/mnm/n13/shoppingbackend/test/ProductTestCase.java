package mnm.n13.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import mnm.n13.shoppingbackend.dao.ProductDAO;
import mnm.n13.shoppingbackend.dto.Product;

public class ProductTestCase {

	private static AnnotationConfigApplicationContext context;
	
	
	private static ProductDAO productDAO;
	
	
	private Product product;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("mnm.n13.shoppingbackend");
		context.refresh();
		productDAO = (ProductDAO)context.getBean("productDAO");
	}
	
	@Test
	public void testListActiveProducts() {
		assertEquals("Đã xảy ra lỗi trong khi tìm nạp danh sách các sản phẩm!",
				5,productDAO.listActiveProducts().size());				
	} 
	
	
	@Test
	public void testListActiveProductsByCategory() {
		assertEquals("Đã xảy ra lỗi trong khi tìm nạp danh sách các sản phẩm!",
				3,productDAO.listActiveProductsByCategory(3).size());
		assertEquals("Đã xảy ra lỗi trong khi tìm nạp danh sách các sản phẩm!",
				2,productDAO.listActiveProductsByCategory(1).size());
	} 
	
	@Test
	public void testGetLatestActiveProduct() {
		assertEquals("Đã xảy ra lỗi trong khi tìm nạp danh sách các sản phẩm!",
				3,productDAO.getLatestActiveProducts(3).size());
		
	} 
	
	
	
		
}
