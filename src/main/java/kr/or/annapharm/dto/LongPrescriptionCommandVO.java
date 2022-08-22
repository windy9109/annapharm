package kr.or.annapharm.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import kr.or.annapharm.command.SearchCriteria;

public class LongPrescriptionCommandVO extends SearchCriteria {
	private String psCode;
	private String piHpid;
	private int preDrugDay;
	
	/**
	 * @return the psCode
	 */
	public String getPsCode() {
		return psCode;
	}
	/**
	 * @param psCode the psCode to set
	 */
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	
	/**
	 * @return the piHpid
	 */
	public String getPiHpid() {
		return piHpid;
	}
	/**
	 * @param piHpid the piHpid to set
	 */
	public void setPiHpid(String piHpid) {
		this.piHpid = piHpid;
	}
	/**
	 * @return the preDrugDay
	 */
	public int getPreDrugDay() {
		return preDrugDay;
	}
	/**
	 * @param preDrugDay the preDrugDay to set
	 */
	public void setPreDrugDay(int preDrugDay) {
		this.preDrugDay = preDrugDay;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
