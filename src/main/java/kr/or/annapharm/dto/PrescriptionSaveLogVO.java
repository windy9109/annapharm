package kr.or.annapharm.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author PC-09
 * 	개요 : 처방전 요양급여신청서 임시저장 및 출력시 필요한 데이터를 받기 위한 VO
 *	작성자 : 이병진
 */
@SuppressWarnings("serial")
public class PrescriptionSaveLogVO implements Serializable {

	private int pslogNum;				// 저장 번호
	private String pslogChname;			// 약사명
	private int pslogCount;				// 청구건수
	private Date pslogSaveday;			// 출력일
	private String pslogPharmacycode;	// 약국코드
	private String pslogStatus;			// 상태
	private String spPscode;			// 처방전 코드
	private Date psCompleteDateStrart;	// 시작일
	private Date psCompleteDateEnd;		// 종료일

	public Date getPsCompleteDateStrart() {
		return psCompleteDateStrart;
	}
	public void setPsCompleteDateStrart(Date psCompleteDateStrart) {
		this.psCompleteDateStrart = psCompleteDateStrart;
	}
	public Date getPsCompleteDateEnd() {
		return psCompleteDateEnd;
	}
	public void setPsCompleteDateEnd(Date psCompleteDateEnd) {
		this.psCompleteDateEnd = psCompleteDateEnd;
	}
	public String getSpPscode() {
		return spPscode;
	}
	public void setSpPscode(String spPscode) {
		this.spPscode = spPscode;
	}
	public int getPslogNum() {
		return pslogNum;
	}
	public void setPslogNum(int pslogNum) {
		this.pslogNum = pslogNum;
	}
	public String getPslogChname() {
		return pslogChname;
	}
	public void setPslogChname(String pslogChname) {
		this.pslogChname = pslogChname;
	}
	public int getPslogCount() {
		return pslogCount;
	}
	public void setPslogCount(int pslogCount) {
		this.pslogCount = pslogCount;
	}
	public Date getPslogSaveday() {
		return pslogSaveday;
	}
	public void setPslogSaveday(Date pslogSaveday) {
		this.pslogSaveday = pslogSaveday;
	}
	public String getPslogPharmacycode() {
		return pslogPharmacycode;
	}
	public void setPslogPharmacycode(String pslogPharmacycode) {
		this.pslogPharmacycode = pslogPharmacycode;
	}
	public String getPslogStatus() {
		return pslogStatus;
	}
	public void setPslogStatus(String pslogStatus) {
		this.pslogStatus = pslogStatus;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
