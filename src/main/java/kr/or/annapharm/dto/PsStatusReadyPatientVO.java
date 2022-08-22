package kr.or.annapharm.dto;

import java.util.Date;

public class PsStatusReadyPatientVO {
	// 의사) 처방완료환자목록
	private String patientCode;	// 환자코드
	private String patientName;	// 환자 이름
	private String patientRegnum;	// 환자 주민번호
	private String patientBirth;	// 환자 생일
	private String doctorCode;	// 의사코드
	private String psCode;
	private String psStatus;	// 처방전상태
	private Date psLastDate;	// 처방완료일
	private String  psTime;
	private int no;	//번호
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPsTime() {
		return psTime;
	}
	public void setPsTime(String psTime) {
		this.psTime = psTime;
	}
	public String getPsCode() {
		return psCode;
	}
	public void setPsCode(String psCode) {
		this.psCode = psCode;
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
	public String getPatientRegnum() {
		return patientRegnum;
	}
	public void setPatientRegnum(String patientRegnum) {
		this.patientRegnum = patientRegnum;
	}
	public String getPatientBirth() {
		return patientBirth;
	}
	public void setPatientBirth(String patientBirth) {
		this.patientBirth = patientBirth;
	}
	public String getDoctorCode() {
		return doctorCode;
	}
	public void setDoctorCode(String doctorCode) {
		this.doctorCode = doctorCode;
	}
	public String getPsStatus() {
		return psStatus;
	}
	public void setPsStatus(String psStatus) {
		this.psStatus = psStatus;
	}
	public Date getPsLastDate() {
		return psLastDate;
	}
	public void setPsLastDate(Date psLastDate) {
		this.psLastDate = psLastDate;
	}
	@Override
	public String toString() {
		return "PsStatusReadyPatientVO [patientCode=" + patientCode + ", patientName=" + patientName
				+ ", patientRegnum=" + patientRegnum + ", patientBirth=" + patientBirth + ", doctorCode=" + doctorCode
				+ ", psCode=" + psCode + ", psStatus=" + psStatus + ", psLastDate=" + psLastDate + ", psTime=" + psTime
				+ ", no=" + no + "]";
	}
	
	
	
	
}
