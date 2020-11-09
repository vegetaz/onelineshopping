package mnm.n13.shoppingbackend.dao;

import java.util.List;

import mnm.n13.shoppingbackend.dto.Category;

public interface CategoryDAO {

	
	
	Category get(int id);
	List<Category> list();
	boolean add(Category category);
	boolean update(Category category);
	boolean delete(Category category);
	
	
}
