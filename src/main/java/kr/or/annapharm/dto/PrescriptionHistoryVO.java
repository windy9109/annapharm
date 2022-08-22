package kr.or.annapharm.dto;

import java.util.Date;

public class PrescriptionHistoryVO {

	private String psCode;	// 처방전코드
	private Date psDate;	// 처방일
	private String medicineName;	// 약이름	
	private String hospitalName;	// 병원명
	private String memName;	// 회원이름
	private String psStatus;	// 처방전상태
	
	public String getPsCode() {
		return psCode;
	}
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	public Date getPsDate() {
		return psDate;
	}
	public void setPsDate(Date psDate) {
		this.psDate = psDate;
	}
	public String getMedicineName() {
		return medicineName;
	}
	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getPsStatus() {
		return psStatus;
	}
	public void setPsStatus(String psStatus) {
		this.psStatus = psStatus;
	}
	
	@Override
	public String toString() {
		return "PrescriptionHistoryVO [psCode=" + psCode + ", psDate=" + psDate + ", medicineName=" + medicineName
				+ ", hospitalName=" + hospitalName + ", memName=" + memName + ", psStatus=" + psStatus + "]";
	}
	


}
