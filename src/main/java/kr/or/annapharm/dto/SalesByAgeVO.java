package kr.or.annapharm.dto;

public class SalesByAgeVO {
	int age;
	String sex;
	int price;
	int count;
	int biPrice;
	int biCount;
	int totalPrice;
	int totalCount;
	/**
	 * @return the age
	 */
	public int getAge() {
		return age;
	}
	/**
	 * @param age the age to set
	 */
	public void setAge(int age) {
		this.age = age;
	}
	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}
	/**
	 * @return the count
	 */
	public int getCount() {
		return count;
	}
	/**
	 * @param count the count to set
	 */
	public void setCount(int count) {
		this.count = count;
	}
	/**
	 * @return the biPrice
	 */
	public int getBiPrice() {
		return biPrice;
	}
	/**
	 * @param biPrice the biPrice to set
	 */
	public void setBiPrice(int biPrice) {
		this.biPrice = biPrice;
	}
	/**
	 * @return the biCount
	 */
	public int getBiCount() {
		return biCount;
	}
	/**
	 * @param biCount the biCount to set
	 */
	public void setBiCount(int biCount) {
		this.biCount = biCount;
	}
	/**
	 * @return the totalPrice
	 */
	public int getTotalPrice() {
		return totalPrice;
	}
	/**
	 * @param totalPrice the totalPrice to set
	 */
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	/**
	 * @return the totalCount
	 */
	public int getTotalCount() {
		return totalCount;
	}
	/**
	 * @param totalCount the totalCount to set
	 */
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	@Override
	public String toString() {
		return "SalesByAgeListRealVO [age=" + age + ", sex=" + sex + ", price=" + price + ", count=" + count
				+ ", biPrice=" + biPrice + ", biCount=" + biCount + ", totalPrice=" + totalPrice + ", totalCount="
				+ totalCount + "]";
	}
	
	
	
}
