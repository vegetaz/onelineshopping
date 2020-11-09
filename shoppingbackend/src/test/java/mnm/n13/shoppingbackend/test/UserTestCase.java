package mnm.n13.shoppingbackend.test;

import org.junit.BeforeClass;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import mnm.n13.shoppingbackend.dao.UserDAO;
import mnm.n13.shoppingbackend.dto.Address;
import mnm.n13.shoppingbackend.dto.Cart;
import mnm.n13.shoppingbackend.dto.User;

public class UserTestCase {

	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user = null;
	private Cart cart = null;
	private Address address = null;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("mnm.n13.shoppingbackend");
		context.refresh();
		
		userDAO = (UserDAO) context.getBean("userDAO");
	}	
}
