package kr.or.annapharm.command;

public class SalesByAgeCommand implements Comparable<SalesByAgeCommand> {
	private int age;
	private String sex;
	private int countPs;
	private int sumPrice;
	private int countNoPs;
	private int sumNoPrice;
	private int countTotal;
	private int sumTotal;
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
	 * @return the countPs
	 */
	public int getCountPs() {
		return countPs;
	}
	/**
	 * @param countPs the countPs to set
	 */
	public void setCountPs(int countPs) {
		this.countPs = countPs;
		this.countTotal += countPs;
	}
	/**
	 * @return the sumPrice
	 */
	public int getSumPrice() {
		return sumPrice;
	}
	/**
	 * @param sumPrice the sumPrice to set
	 */
	public void setSumPrice(int sumPrice) {
		this.sumPrice = sumPrice;
		this.sumTotal += sumPrice;
	}
	/**
	 * @return the countNoPs
	 */
	public int getCountNoPs() {
		return countNoPs;
	}
	/**
	 * @param countNoPs the countNoPs to set
	 */
	public void setCountNoPs(int countNoPs) {
		this.countNoPs = countNoPs;
		this.countTotal += countNoPs;
	}
	/**
	 * @return the sumNoPrice
	 */
	public int getSumNoPrice() {
		return sumNoPrice;
	}
	/**
	 * @param sumNoPrice the sumNoPrice to set
	 */
	public void setSumNoPrice(int sumNoPrice) {
		this.sumNoPrice = sumNoPrice;
		this.sumTotal += sumNoPrice;
	}
	/**
	 * @return the countTotal
	 */
	public int getCountTotal() {
		return countTotal;
	}
	/**
	 * @param countTotal the countTotal to set
	 */
	public void setCountTotal(int countTotal) {
		this.countTotal = countTotal;
	}
	/**
	 * @return the sumTotal
	 */
	public int getSumTotal() {
		return sumTotal;
	}
	/**
	 * @param sumTotal the sumTotal to set
	 */
	public void setSumTotal(int sumTotal) {
		this.sumTotal = sumTotal;
	}
	@Override
	public String toString() {
		return "SalesByAgeCommand [age=" + age + ", sex=" + sex + ", countPs=" + countPs + ", sumPrice=" + sumPrice
				+ ", countNoPs=" + countNoPs + ", sumNoPrice=" + sumNoPrice + ", countTotal=" + countTotal
				+ ", sumTotal=" + sumTotal + "]";
	}
	
	
	@Override
	public int compareTo(SalesByAgeCommand o) {
		// TODO Auto-generated method stub
		return o.getCountTotal() - getCountTotal();
	}
	
	
	
	
	
	
	
}
