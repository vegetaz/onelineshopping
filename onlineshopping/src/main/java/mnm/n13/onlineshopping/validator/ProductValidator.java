package mnm.n13.onlineshopping.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import mnm.n13.shoppingbackend.dto.Product;

public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Product.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Product product = (Product) target;
		if(product.getFile() == null || product.getFile().getOriginalFilename().equals("")) {
			errors.rejectValue("file", null, "Chọn một tệp để tải lên!");
			return;
		}
		if(! (product.getFile().getContentType().equals("image/jpeg") || 
				product.getFile().getContentType().equals("image/png")) ||
				product.getFile().getContentType().equals("image/gif")
			 )
			{
				errors.rejectValue("file", null, "Chọn một tệp tin hình ảnh để tải lên!");
				return;	
			}

	}

}
