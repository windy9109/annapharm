package kr.or.annapharm.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@SuppressWarnings("serial")
public class SavelogPrescriptionVO implements Serializable{

	private String pslogNum;		// 저장/출력 컬럼 번호
	private String spPscode;		// 처방전 코드
	private Date psCompleteDate;	// 조제 완료일

	public String getPslogNum() {
		return pslogNum;
	}
	public void setPslogNum(String pslogNum) {
		this.pslogNum = pslogNum;
	}
	public String getSpPscode() {
		return spPscode;
	}
	public void setSpPscode(String spPscode) {
		this.spPscode = spPscode;
	}
	public Date getPsCompleteDate() {
		return psCompleteDate;
	}
	public void setPsCompleteDate(Date psCompleteDate) {
		this.psCompleteDate = psCompleteDate;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
