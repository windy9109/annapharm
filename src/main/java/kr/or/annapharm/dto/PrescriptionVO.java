package kr.or.annapharm.dto;

import java.util.Date;

public class PrescriptionVO {

	private long psCode;		// 처방전코드
	private String doctorCode;	// 의사코드
	private String patientCode;	// 환자코드
	private String chemistCode;	// 약사코드
	private Date psDate;		// 최초처방일
	private Date psLastdate;	// 최종수정일
	private String psModifyReq;	// 수정요청
	private Date psCompleteDate;// 처방완료일
	private String psStatus;	// 처방전상태
	private String psType;		// 구분 (처방/비처방)
	private Date chDate;
	
	public String getPsType() {
		return psType;
	}
	public void setPsType(String psType) {
		this.psType = psType;
	}
	
	public long getPsCode() {
		return psCode;
	}
	public void setPsCode(long psCode) {
		this.psCode = psCode;
	}
	public String getDoctorCode() {
		return doctorCode;
	}
	public void setDoctorCode(String doctorCode) {
		this.doctorCode = doctorCode;
	}
	public String getPatientCode() {
		return patientCode;
	}
	public void setPatientCode(String patientCode) {
		this.patientCode = patientCode;
	}
	public String getChemistCode() {
		return chemistCode;
	}
	public void setChemistCode(String chemistCode) {
		this.chemistCode = chemistCode;
	}
	public Date getPsDate() {
		return psDate;
	}
	public void setPsDate(Date psDate) {
		this.psDate = psDate;
	}
	public Date getPsLastdate() {
		return psLastdate;
	}
	public void setPsLastdate(Date psLastdate) {
		this.psLastdate = psLastdate;
	}
	public String getPsModifyReq() {
		return psModifyReq;
	}
	public void setPsModifyReq(String psModifyReq) {
		this.psModifyReq = psModifyReq;
	}
	public Date getPsCompleteDate() {
		return psCompleteDate;
	}
	public void setPsCompleteDate(Date psCompleteDate) {
		this.psCompleteDate = psCompleteDate;
	}
	public String getPsStatus() {
		return psStatus;
	}
	public void setPsStatus(String psStatus) {
		this.psStatus = psStatus;
	}
	public Date getChDate() {
		return chDate;
	}
	public void setChDate(Date chDate) {
		this.chDate = chDate;
	}
	

	
	
	
}
