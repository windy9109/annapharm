package kr.or.annapharm.dto;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@SuppressWarnings("serial")
public class MedicienCalculatVO implements Serializable {

	private String psCode;		// 처방전 코드
	private String mdNo;		// 약품 번호
	private int preDrugDay;		// 조제일수
	private int preDrugNum;	// 약 총 개수
	private String mdDrug;		// 마약류 구분
	private int miPrice;		// 약품 가격


	public int getPreDrugNum() {
		return preDrugNum;
	}
	public void setPreDrugNum(int preDrugNum) {
		this.preDrugNum = preDrugNum;
	}
	public int getMiPrice() {
		return miPrice;
	}
	public void setMiPrice(int miPrice) {
		this.miPrice = miPrice;
	}
	public String getPsCode() {
		return psCode;
	}
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	public String getMdNo() {
		return mdNo;
	}
	public void setMdNo(String mdNo) {
		this.mdNo = mdNo;
	}
	public int getPreDrugDay() {
		return preDrugDay;
	}
	public void setPreDrugDay(int preDrugDay) {
		this.preDrugDay = preDrugDay;
	}
	public String getMdDrug() {
		return mdDrug;
	}
	public void setMdDrug(String mdDrug) {
		this.mdDrug = mdDrug;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
