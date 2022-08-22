package kr.or.annapharm.dto;

import java.sql.Date;

public class MemberVO {

	private String memId;
	private String memPwd;
	private String memName;
	private String memRegnum;
	private String memTel;
	private String memAddr;
	private String memEmail;
	private String memAuthority = "일반";
	private String memZipcode;
	private String memAddr2;
	private String memLogindate;
	private int chemistInCode;



	private int memEnabled;
	private String memRegdate;


	private String chemistCode;


	private String patientCode;	// 환자코드
	private Date psDate;	// 처방일









	public int getChemistInCode() {
		return chemistInCode;
	}
	public void setChemistInCode(int chemistInCode) {
		this.chemistInCode = chemistInCode;
	}
	public Date getPsDate() {
		return psDate;
	}
	public void setPsDate(Date psDate) {
		this.psDate = psDate;
	}
	public String getChemistCode() {
		return chemistCode;
	}
	public void setChemistCode(String chemistCode) {
		this.chemistCode = chemistCode;
	}
	public void setPatientCode(String patientCode) {
		this.patientCode = patientCode;
	}
	public String getPatientCode() {
		return patientCode;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemRegnum() {
		return memRegnum;
	}
	public void setMemRegnum(String memRegnum) {
		this.memRegnum = memRegnum;
	}
	public String getMemTel() {
		return memTel;
	}
	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemAuthority() {
		return memAuthority;
	}
	public void setMemAuthority(String memAuthority) {
		this.memAuthority = memAuthority;
	}
	public String getMemZipcode() {
		return memZipcode;
	}
	public void setMemZipcode(String memZipcode) {
		this.memZipcode = memZipcode;
	}
	public String getMemAddr2() {
		return memAddr2;
	}
	public void setMemAddr2(String memAddr2) {
		this.memAddr2 = memAddr2;
	}
	public int getMemEnabled() {
		return memEnabled;
	}
	public void setMemEnabled(int memEnabled) {
		this.memEnabled = memEnabled;
	}
	public String getMemRegdate() {
		return memRegdate;
	}
	public void setMemRegdate(String memRegdate) {
		this.memRegdate = memRegdate;
	}


	public String getMemLogindate() {
		return memLogindate;
	}
	public void setMemLogindate(String memLogindate) {
		this.memLogindate = memLogindate;
	}
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName + ", memRegnum=" + memRegnum
				+ ", memTel=" + memTel + ", memAddr=" + memAddr + ", memEmail=" + memEmail + ", memAuthority="
				+ memAuthority + ", memZipcode=" + memZipcode + ", memAddr2=" + memAddr2 + ", memLogindate="
				+ memLogindate + ", memEnabled=" + memEnabled + ", memRegdate=" + memRegdate + ", patientCode="
				+ patientCode + "]";
	}





}
