package kr.or.annapharm.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class PatientVO {
	private String patientCode;	// 환자코드
	private String memId;	// 회원 아이디
	private String patientName;	// 환자 이름
	private String patientRegnum;	// 환자 주민번호
	private String patientPhone;	// 환자 폰번호
	private String patientAddr;	// 환자 주소
	private String patientBirth;	// 환자 생일
	private Date psDate;	// 처방일



	public Date getPsDate() {
		return psDate;
	}
	public void setPsDate(Date psDate) {
		this.psDate = psDate;
	}
	public String getPatientCode() {
		return patientCode;
	}
	public void setPatientCode(String patientCode) {
		this.patientCode = patientCode;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
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
	public String getPatientPhone() {
		return patientPhone;
	}
	public void setPatientPhone(String patientPhone) {
		this.patientPhone = patientPhone;
	}
	public String getPatientAddr() {
		return patientAddr;
	}
	public void setPatientAddr(String patientAddr) {
		this.patientAddr = patientAddr;
	}
	public String getPatientBirth() {
		return patientBirth;
	}
	public void setPatientBirth(String patientBirth) {
		this.patientBirth = patientBirth;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}




}
