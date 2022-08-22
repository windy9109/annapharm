package kr.or.annapharm.dto;

public class RequestPrescriptionChemistVO {

	private String patientCode;	// 환자코드
	private String patientName;	// 환자명
	private String psModifyReq;	// 수정요청사유
	private String psCode;		// 처방전코드
	private String pharmacyName;	// 약국명
	private String memName;		// 약사명
	private String piDutytel1;	// 약국전화번호
	private String piDutyaddr;	// 약국주소
	
	private String chemistCode;	// 약사코드
	private String pharmacyCode;	// 약국코드
	
	
	
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
	public String getPiDutytel1() {
		return piDutytel1;
	}
	public void setPiDutytel1(String piDutytel1) {
		this.piDutytel1 = piDutytel1;
	}
	public String getPiDutyaddr() {
		return piDutyaddr;
	}
	public void setPiDutyaddr(String piDutyaddr) {
		this.piDutyaddr = piDutyaddr;
	}
	public String getPharmacyName() {
		return pharmacyName;
	}
	public void setPharmacyName(String pharmacyName) {
		this.pharmacyName = pharmacyName;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getPatientCode() {
		return patientCode;
	}
	public void setPatientCode(String patientCode) {
		this.patientCode = patientCode;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getPsModifyReq() {
		return psModifyReq;
	}
	public void setPsModifyReq(String psModifyReq) {
		this.psModifyReq = psModifyReq;
	}
	public String getPsCode() {
		return psCode;
	}
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	
	
	@Override
	public String toString() {
		return "RequestPrescriptionChemistVO [patientCode=" + patientCode + ", patientName=" + patientName
				+ ", psModifyReq=" + psModifyReq + ", psCode=" + psCode + ", pharmacyName=" + pharmacyName
				+ ", memName=" + memName + ", piDutytel1=" + piDutytel1 + ", piDutyaddr=" + piDutyaddr
				+ ", chemistCode=" + chemistCode + ", pharmacyCode=" + pharmacyCode + "]";
	}
	
	
	
	
	
	


}
