package kr.or.annapharm.dto;

/**
 * 약검색, 주성분검색 리트스 VO
 * @author PC-17
 *
 */
public class SearchMedicineVO {
	/**
	 * 약이름
	 */
	String mdName;
	/**
	 * 약 유효성분
	 */
	String mdComponent;
	/**
	 * 약 분류(전문,일반,건강기능식품)
	 */
	String mdClass;
	/**
	 * 약 주성분 함량 단위
	 */
	String unit;
	/**
	 * 약 주성분 코드
	 */
	String miMaincode;
	/**
	 * 약 투여 방법
	 */
	String miUse;
	/**
	 * 약 분류코드
	 */
	String miType;
	
	/**
	 * 약 분류코드 getter
	 * @return String
	 */
	public String getMiType() {
		return miType;
	}
	public void setMiType(String miType) {
		this.miType = miType;
	}
	public String getMiUse() {
		return miUse;
	}
	public void setMiUse(String miUse) {
		this.miUse = miUse;
	}
	public String getMdName() {
		return mdName;
	}
	public void setMdName(String mdName) {
		this.mdName = mdName;
	}
	public String getMdComponent() {
		return mdComponent;
	}
	public void setMdComponent(String mdComponent) {
		this.mdComponent = mdComponent;
	}
	public String getMdClass() {
		return mdClass;
	}
	public void setMdClass(String mdClass) {
		this.mdClass = mdClass;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getMiMaincode() {
		return miMaincode;
	}
	public void setMiMaincode(String miMaincode) {
		this.miMaincode = miMaincode;
	}

	
	
	
}
