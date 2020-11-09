package mnm.n13.shoppingbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mnm.n13.shoppingbackend.dao.CartLineDAO;
import mnm.n13.shoppingbackend.dto.Amount;
import mnm.n13.shoppingbackend.dto.Cart;
import mnm.n13.shoppingbackend.dto.CartLine;
import mnm.n13.shoppingbackend.dto.LogAmount;
import mnm.n13.shoppingbackend.dto.OrderDetail;

@Repository("cartLineDAO")
@Transactional
public class CartLineDAOImpl implements CartLineDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public CartLine getByCartAndProduct(int cartId, int productId) {
		String query = "FROM CartLine WHERE cartId = :cartId AND product.id = :productId";
		try {
			
			return sessionFactory.getCurrentSession()
									.createQuery(query,CartLine.class)
										.setParameter("cartId", cartId)
										.setParameter("productId", productId)
											.getSingleResult();
			
		}catch(Exception ex) {
			return null;	
		}
		
	}

	@Override
	public boolean add(CartLine cartLine) {
		try {
			sessionFactory.getCurrentSession().persist(cartLine);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean update(CartLine cartLine) {
		try {
			sessionFactory.getCurrentSession().update(cartLine);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean remove(CartLine cartLine) {	
		try {			
			sessionFactory.getCurrentSession().delete(cartLine);
			return true;
		}catch(Exception ex) {
			return false;
		}		
	}


	@Override
	public List<CartLine> list(int cartId) {
		String query = "FROM CartLine WHERE cartId = :cartId";
		return sessionFactory.getCurrentSession()
								.createQuery(query, CartLine.class)
									.setParameter("cartId", cartId)
										.getResultList();		
	}

	@Override
	public CartLine get(int id) {		
		return sessionFactory.getCurrentSession().get(CartLine.class, Integer.valueOf(id));
	}

	@Override
	public boolean updateCart(Cart cart) {
		try {			
			sessionFactory.getCurrentSession().update(cart);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	@Override
	public List<CartLine> listAvailable(int cartId) {
		String query = "FROM CartLine WHERE cartId = :cartId AND available = :available";
		return sessionFactory.getCurrentSession()
								.createQuery(query, CartLine.class)
									.setParameter("cartId", cartId)
									.setParameter("available", true)
										.getResultList();
	}

	@Override
	public boolean addOrderDetail(OrderDetail orderDetail) {
		try {			
			sessionFactory.getCurrentSession().persist(orderDetail);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	@Override
	public List<OrderDetail> listOrderDetail() {
		String query = "FROM OrderDetail";
		return sessionFactory.getCurrentSession().createQuery(query, OrderDetail.class).getResultList();
	}

	@Override
	public boolean updateOrderDetail(int id) {
		OrderDetail orderDetail = sessionFactory.getCurrentSession().createQuery("FROM OrderDetail WHERE id=:id", OrderDetail.class)
				.setParameter("id", id)
				.getSingleResult();
		
		try {
			orderDetail.setStatus(1);
			sessionFactory.getCurrentSession().update(orderDetail);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	@Override
	public void addLogAmount(String email, Long amount, String path) {
		try {
			LogAmount log = new LogAmount();
			log.setAmount(amount);
			log.setEmail(email);
			log.setPath_image(path);
			sessionFactory.getCurrentSession().persist(log);
		}
		catch(Exception ex) {
		}
	}

	@Override
	public List<LogAmount> listLogAmount() {
		String query = "FROM LogAmount";
		return sessionFactory.getCurrentSession().createQuery(query, LogAmount.class).getResultList();
	}

	@Override
	public void updateLogAmount(int id, Long amount) {
		
		LogAmount log = sessionFactory.getCurrentSession().createQuery("FROM LogAmount WHERE id=:id", LogAmount.class)
				.setParameter("id", id)
				.getSingleResult();
		
		Amount am = null;
		try {
			am = sessionFactory.getCurrentSession().createQuery("FROM Amount WHERE email=:email", Amount.class)
					.setParameter("email", log.getEmail())
					.getSingleResult();
		}
		catch(Exception ex) {
			
		}
		
		try {
			log.setStatus(1);
			sessionFactory.getCurrentSession().update(log);
			
			if(am != null) {
				am.setAmount(amount + am.getAmount());
				sessionFactory.getCurrentSession().update(am);
			} else {
				am = new Amount();
				am.setAmount(amount);
				am.setEmail(log.getEmail());
				sessionFactory.getCurrentSession().persist(am);
			}
		}
		catch(Exception ex) {
		}
	}

	@Override
	public boolean updateAmountPay(String email,double checkoutTotal) {
		
		try {
			Amount am = sessionFactory.getCurrentSession().createQuery("FROM Amount WHERE email=:email", Amount.class)
					.setParameter("email", email)
					.getSingleResult();
			if(am.getAmount() < (long) checkoutTotal) {
				return false;
			} else {
				am.setAmount(am.getAmount() - (long) checkoutTotal);
				sessionFactory.getCurrentSession().update(am);
				return true;
			}
		}
		catch(Exception ex) {
			return false;
		}
	}

	@Override
	public Amount getAmount(String email) {
		Amount am = null;
		try {
			am = sessionFactory.getCurrentSession().createQuery("FROM Amount WHERE email=:email", Amount.class)
				.setParameter("email", email)
				.getSingleResult();
		
		}
		catch(Exception ex) {
			am = new Amount();
			am.setAmount(0L);
		}
		return am;
	}

	@Override
	public boolean checkByPay(int cartId, String email) {
		boolean am = true;
		try {
			Amount amount = getAmount(email);
			Long pay = amount.getAmount();
			
			if(pay == 0L) {
				return false;
			}
			
			if(cartId == -1) {
				return false;
				
			} else {
				Cart ca = sessionFactory.getCurrentSession().createQuery("FROM Cart WHERE id=:id", Cart.class)
						.setParameter("id", cartId)
						.getSingleResult();
				if(pay < ca.getGrandTotal()) {
					return false;
				}
			}
		}
		catch(Exception ex) {
			
		}
		return am;
	}

		
}
