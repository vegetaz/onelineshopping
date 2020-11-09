package mnm.n13.shoppingbackend.dao;

import java.util.List;

import mnm.n13.shoppingbackend.dto.Amount;
import mnm.n13.shoppingbackend.dto.Cart;
import mnm.n13.shoppingbackend.dto.CartLine;
import mnm.n13.shoppingbackend.dto.LogAmount;
import mnm.n13.shoppingbackend.dto.OrderDetail;

public interface CartLineDAO {

	public List<CartLine> list(int cartId);
	public CartLine get(int id);	
	public boolean add(CartLine cartLine);
	public boolean update(CartLine cartLine);
	public boolean remove(CartLine cartLine);
	
	// fetch the CartLine based on cartId and productId
	public CartLine getByCartAndProduct(int cartId, int productId);		
		
	// updating the cart
	boolean updateCart(Cart cart);
	
	// list of available cartLine
	public List<CartLine> listAvailable(int cartId);
	
	// adding order details
	boolean addOrderDetail(OrderDetail orderDetail);
	boolean updateOrderDetail(int id);
	public List<OrderDetail> listOrderDetail();
	public void addLogAmount(String name, Long amount, String path);
	public List<LogAmount> listLogAmount();
	public void updateLogAmount(int id, Long amount);
	public boolean updateAmountPay(String email,double checkoutTotal);
	public Amount getAmount(String email);
	public boolean checkByPay(int cartId, String email);
	
}
