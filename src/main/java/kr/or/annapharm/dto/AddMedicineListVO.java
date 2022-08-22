package kr.or.annapharm.dto;

public class AddMedicineListVO {
	private String mdClass;	// 구분
	private String miCode;	// 약코드
	private String miType;	// 분류코드
	private String miUse;	// 복용법
	private String mdName;	// 약명
	private String mdDrug;	// 마약
	private String mdNo;		// 약번호
	private String miCompany; // 거래처
	private String miUnit; // 단위
	private String mdTerm;
	private int miPrice; // 가격

	public String getMdTerm() {
		return mdTerm;
	}
	public void setMdTerm(String mdTerm) {
		this.mdTerm = mdTerm;
	}
	public String getMiCompany() {
		return miCompany;
	}
	public void setMiCompany(String miCompany) {
		this.miCompany = miCompany;
	}
	public String getMiUnit() {
		return miUnit;
	}
	public void setMiUnit(String miUnit) {
		this.miUnit = miUnit;
	}
	public int getMiPrice() {
		return miPrice;
	}
	public void setMiPrice(int miPrice) {
		this.miPrice = miPrice;
	}
	public String getMdNo() {
		return mdNo;
	}
	public void setMdNo(String mdNo) {
		this.mdNo = mdNo;
	}
	public String getMdClass() {
		return mdClass;
	}
	public void setMdClass(String mdClass) {
		this.mdClass = mdClass;
	}
	public String getMiCode() {
		return miCode;
	}
	public void setMiCode(String miCode) {
		this.miCode = miCode;
	}
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
	public String getMdDrug() {
		return mdDrug;
	}
	public void setMdDrug(String mdDrug) {
		this.mdDrug = mdDrug;
	}
	
	
	
}
