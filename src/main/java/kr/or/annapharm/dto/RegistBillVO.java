package kr.or.annapharm.dto;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


/**
 * @author PC-09
 * 	개요 : 청구서 등록에 들어갈 약국 데이터와 약사 데이터를 담는 VO
 * 	작성자 : 이병진
 *
 */
@SuppressWarnings("serial")
public class RegistBillVO implements Serializable {

	private String piHpid;			// 약국 코드
	private String piDutyname;		// 약국 이름
	private String PiDutytel1;		// 약국 전화번호
	private String PiDutyaddr;		// 약국 주소
	private String piPostcdn;		// 약국 우편번호
	private String memRegnum;		// 생년월일
	private String memName;			// 약사 이름
	private String chemistCode;		// 약사 코드

	public String getChemistCode() {
		return chemistCode;
	}
	public void setChemistCode(String chemistCode) {
		this.chemistCode = chemistCode;
	}
	public String getMemRegnum() {
		return memRegnum;
	}
	public void setMemRegnum(String memRegnum) {
		this.memRegnum = memRegnum;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getPiHpid() {
		return piHpid;
	}
	public void setPiHpid(String piHpid) {
		this.piHpid = piHpid;
	}
	public String getPiDutyname() {
		return piDutyname;
	}
	public void setPiDutyname(String piDutyname) {
		this.piDutyname = piDutyname;
	}
	public String getPiDutytel1() {
		return PiDutytel1;
	}
	public void setPiDutytel1(String piDutytel1) {
		PiDutytel1 = piDutytel1;
	}
	public String getPiDutyaddr() {
		return PiDutyaddr;
	}
	public void setPiDutyaddr(String piDutyaddr) {
		PiDutyaddr = piDutyaddr;
	}
	public String getPiPostcdn() {
		return piPostcdn;
	}
	public void setPiPostcdn(String piPostcdn) {
		this.piPostcdn = piPostcdn;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
