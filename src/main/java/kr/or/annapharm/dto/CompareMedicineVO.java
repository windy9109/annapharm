package kr.or.annapharm.dto;

public class CompareMedicineVO {
	/**
	 * 약 선택 상태
	 * 선택 (fa_star fas 검은별), 선택안함 (fa_star far 흰별)기본값
	 */
	private String selectMd = "far fa-plus-square";
	
	
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

	private int mdNo;
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

	/**
	 * 약이름
	 */
	private String mdName;
	/**
	 * 제조사
	 */
	private String miCompany;
	/**
	 * 약 구분(전문,일반,건강기능식품)
	 */
	private String mdClass;
	/**
	 * 약 상한금액(약가)
	 */
	private int miPrice;
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
	 * @return the miPrice
	 */
	public int getMiPrice() {
		return miPrice;
	}
	/**
	 * @param miPrice the miPrice to set
	 */
	public void setMiPrice(int miPrice) {
		this.miPrice = miPrice;
	}

	
}
