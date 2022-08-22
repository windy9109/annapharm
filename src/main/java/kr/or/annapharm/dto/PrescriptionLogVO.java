package kr.or.annapharm.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


/**
 * @author PC-09
 * 개요 : 약사 조제 화면에서 환자의 과거 처방이력을 확인할 때 사용되는 VO객체
 * 작성자 : 이병진
 */
@SuppressWarnings("serial")
public class PrescriptionLogVO implements Serializable {

	 private String psType;			// 구분(처방/비처방)
	 private String psCode;			// 교부번호
	 private Date psDate;			// 교부일자
	 private Date psCompleteDate;	// 조제완료일
	 private String doctorCode;	// 의사 코드
	 private String hospitalName;	// 병원이름
	 private String memName;		// 의사이름
	 private String pharmacyName = "-";	// 약국이름
	 private String psStatus;		// 처방전 상태

	public String getDoctorCode() {
		return doctorCode;
	}
	public void setDoctorCode(String doctorCode) {
		this.doctorCode = doctorCode;
	}
	public Date getPsCompleteDate() {
		return psCompleteDate;
	}
	public void setPsCompleteDate(Date psCompleteDate) {
		this.psCompleteDate = psCompleteDate;
	}
	public String getPsType() {
		return psType;
	}
	public void setPsType(String psType) {
		this.psType = psType;
	}
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
	public String getPharmacyName() {
		return pharmacyName;
	}
	public void setPharmacyName(String pharmacyName) {
		this.pharmacyName = pharmacyName;
	}
	public String getPsStatus() {
		return psStatus;
	}
	public void setPsStatus(String psStatus) {
		this.psStatus = psStatus;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
