package kr.or.annapharm.dto;

public class UpdatePrescriptionVO {
	private String psCode;	// 처방전코드
	private long psCodeL;  // 처방전코드(숫자)
	private int mdNo;	// 약번호
	private int preDrugNum;	// 수량
	private int preDrugDay;	// 일수
	private int preDrugCount;	// 횟수
	private String patientCode;	// 환자코드
	private String chemistCode;	// 약사코드
	private String pharmacyCode;	// 약국코드
	
	

	public String getPharmacyCode() {
		return pharmacyCode;
	}
	public void setPharmacyCode(String pharmacyCode) {
		this.pharmacyCode = pharmacyCode;
	}
	public String getChemistCode() {
		return chemistCode;
	}
	public void setChemistCode(String chemistCode) {
		this.chemistCode = chemistCode;
	}
	public long getPsCodeL() {
		return psCodeL;
	}
	public void setPsCodeL(long psCodeL) {
		this.psCodeL = psCodeL;
	}
	public String getPatientCode() {
		return patientCode;
	}
	public void setPatientCode(String patientCode) {
		this.patientCode = patientCode;
	}
	public String getPsCode() {
		return psCode;
	}
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	public int getMdNo() {
		return mdNo;
	}
	public void setMdNo(int mdNo) {
		this.mdNo = mdNo;
	}
	public int getPreDrugNum() {
		return preDrugNum;
	}
	public void setPreDrugNum(int preDrugNum) {
		this.preDrugNum = preDrugNum;
	}
	public int getPreDrugDay() {
		return preDrugDay;
	}
	public void setPreDrugDay(int preDrugDay) {
		this.preDrugDay = preDrugDay;
	}
	public int getPreDrugCount() {
		return preDrugCount;
	}
	public void setPreDrugCount(int preDrugCount) {
		this.preDrugCount = preDrugCount;
	}
	
	@Override
	public String toString() {
		return "UpdatePrescriptionVO [psCode=" + psCode + ", psCodeL=" + psCodeL + ", mdNo=" + mdNo + ", preDrugNum="
				+ preDrugNum + ", preDrugDay=" + preDrugDay + ", preDrugCount=" + preDrugCount + ", patientCode="
				+ patientCode + ", chemistCode=" + chemistCode + ", pharmacyCode=" + pharmacyCode + "]";
	}
	
	

	
	
	
	
}
