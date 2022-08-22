package kr.or.annapharm.dto;

public class PrescriptionCompleteVO {
	private String psCode;	// 처방전코드
	private String chemistCode;	 // 약사코드
	private String pharmacyCode; // 약국코드
	private String saleNo;	// 판매번호
	private String patientCode;	// 환자번호
	private String salePrice;	// 총금액
	private String mdNo;	// 약번호
	private int saleCartNum;	// 약갯수
	private String saleCartPrice;	// 약의 각각 판매가
	
	
	
	public String getSaleNo() {
		return saleNo;
	}
	public void setSaleNo(String saleNo) {
		this.saleNo = saleNo;
	}
	public String getPatientCode() {
		return patientCode;
	}
	public void setPatientCode(String patientCode) {
		this.patientCode = patientCode;
	}
	public String getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(String salePrice) {
		this.salePrice = salePrice;
	}
	public String getMdNo() {
		return mdNo;
	}
	public void setMdNo(String mdNo) {
		this.mdNo = mdNo;
	}
	public int getSaleCartNum() {
		return saleCartNum;
	}
	public void setSaleCartNum(int saleCartNum) {
		this.saleCartNum = saleCartNum;
	}
	public String getSaleCartPrice() {
		return saleCartPrice;
	}
	public void setSaleCartPrice(String saleCartPrice) {
		this.saleCartPrice = saleCartPrice;
	}
	public String getPsCode() {
		return psCode;
	}
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	public String getChemistCode() {
		return chemistCode;
	}
	public void setChemistCode(String chemistCode) {
		this.chemistCode = chemistCode;
	}
	public String getPharmacyCode() {
		return pharmacyCode;
	}
	public void setPharmacyCode(String pharmacyCode) {
		this.pharmacyCode = pharmacyCode;
	}
	
	@Override
	public String toString() {
		return "PrescriptionCompleteVO [psCode=" + psCode + ", chemistCode=" + chemistCode + ", pharmacyCode="
				+ pharmacyCode + "]";
	}
}
