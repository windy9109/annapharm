package kr.or.annapharm.dto;

import kr.or.annapharm.command.SearchCriteria;

public class PreferMedicineVO extends SearchCriteria{
	private int age;
	private String sex;
	private String mdName;
	private int mdNo;
	private String miCompany;
	private String mdClass;
	private int num;
	private int rank;
	/**
	 * @return the rank
	 */
	public int getRank() {
		return rank;
	}
	/**
	 * @param rank the rank to set
	 */
	public void setRank(int rank) {
		this.rank = rank;
	}
	/**
	 * @return the selectMd
	 */
	public String getSelectMd() {
		return selectMd;
	}
	/**
	 * @param selectMd the selectMd to set
	 */
	public void setSelectMd(String selectMd) {
		this.selectMd = selectMd;
	}
	private int price;
	private String selectMd = "far fa-plus-square";
	/**
	 * @return the mdNo
	 */
	public int getMdNo() {
		return mdNo;
	}
	/**
	 * @param mdNo the mdNo to set
	 */
	public void setMdNo(int mdNo) {
		this.mdNo = mdNo;
	}
	private int ownNum;
	
	
	
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
	 * @return the mdName
	 */
	public String getMdName() {
		return mdName;
	}
	/**
	 * @param mdName the mdName to set
	 */
	public void setMdName(String mdName) {
		this.mdName = mdName;
	}
	/**
	 * @return the miCompany
	 */
	public String getMiCompany() {
		return miCompany;
	}
	/**
	 * @param miCompany the miCompany to set
	 */
	public void setMiCompany(String miCompany) {
		this.miCompany = miCompany;
	}
	/**
	 * @return the mdClass
	 */
	public String getMdClass() {
		return mdClass;
	}
	/**
	 * @param mdClass the mdClass to set
	 */
	public void setMdClass(String mdClass) {
		this.mdClass = mdClass;
	}
	/**
	 * @return the num
	 */
	public int getNum() {
		return num;
	}
	/**
	 * @param num the num to set
	 */
	public void setNum(int num) {
		this.num = num;
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
	 * @return the ownNum
	 */
	public int getOwnNum() {
		return ownNum;
	}
	/**
	 * @param ownNum the ownNum to set
	 */
	public void setOwnNum(int ownNum) {
		this.ownNum = ownNum;
	}
	@Override
	public String toString() {
		return "PreferMedicineVO [age=" + age + ", sex=" + sex + ", mdName=" + mdName + ", miCompany=" + miCompany
				+ ", mdClass=" + mdClass + ", num=" + num + ", price=" + price + ", ownNum=" + ownNum + "]";
	}
	
	
}
