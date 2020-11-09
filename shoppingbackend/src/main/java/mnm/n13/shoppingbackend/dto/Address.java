package mnm.n13.shoppingbackend.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Address implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@NotBlank(message = "Địa chỉ không được để trống!")
	@Column(name = "address")
	private String address;
	@NotBlank(message = "Tên đường không được để trống!")	
	@Column(name = "street")
	private String street;
	@NotBlank(message = "Nhập vào tên phường/xã!")
	@Column(name = "ward")
	private String ward;
	@NotBlank(message = "Nhập vào tên quận/huyện!")	
	private String town;
	@NotBlank(message = "Nhập vào tên tỉnh/thành phố!")	
	private String city;
	@Column(name ="postal_code")
	@NotBlank(message = "Nhập vào mã bưu chính!")	
	private String postalCode;
	@Column(name="is_shipping")
	private boolean shipping;
	@Column(name="is_billing")
	private boolean billing;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getWard() {
		return ward;
	}
	public void setWard(String ward) {
		this.ward = ward;
	}
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public boolean isBilling() {
		return billing;
	}
	public void setBilling(boolean billing) {
		this.billing = billing;
	}
	
	@Override
	public String toString() {
		return "Address [id=" + id + ", address=" + address + ", street=" + street
				+ ", ward=" + ward + ", town=" + town + ", city=" + city + ", postalCode=" + postalCode
				+ ", billing=" + billing + "]";
	}
		
	@Column(name = "user_id")
	private int userId;
	public boolean isShipping() {
		return shipping;
	}
	public void setShipping(boolean shipping) {
		this.shipping = shipping;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
}
