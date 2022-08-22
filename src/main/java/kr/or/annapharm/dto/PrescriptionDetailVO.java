package kr.or.annapharm.dto;

public class PrescriptionDetailVO {
	private String mdClass;	// 약 구분
	private String miType;		// 약 분류코드
	private String miCode;		// 약 코드
	private String miUse;		// 투여
	private String mdName;		// 약 이름
	private int preDrugCount;	// 횟수
	private int preDrugDay;	// 일수
	private String psCode;			// 처방전 코드
	private String mdNo;
	
	
	
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
	public String getMiType() {
		return miType;
	}
	public void setMiType(String miType) {
		this.miType = miType;
	}
	public String getMiCode() {
		return miCode;
	}
	public void setMiCode(String miCode) {
		this.miCode = miCode;
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
	public int getPreDrugCount() {
		return preDrugCount;
	}
	public void setPreDrugCount(int preDrugCount) {
		this.preDrugCount = preDrugCount;
	}
	public int getPreDrugDay() {
		return preDrugDay;
	}
	public void setPreDrugDay(int preDrugDay) {
		this.preDrugDay = preDrugDay;
	}
	public String getPsCode() {
		return psCode;
	}
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	
	
	
	
}
