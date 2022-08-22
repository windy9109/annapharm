package kr.or.annapharm.dto;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author PC-09
 *  개요 : 매출 현황 페이지의 상세조회 결과를 출력하기 위한 VO
 *  작성자 : 이병진
 */
@SuppressWarnings("serial")
public class SalesAnalysisDetailVO implements Serializable {

	private String mdName;			// 약품명
	private String miCompany;		// 제조회사
	private String miUse;			// 유형
	private String insurance = "급여";// 급여보험
	private String preDrugNum;		// 총 투약
	private String preDrugCount;	// 횟수
	private String preDrugDay;		// 일수
	private String miPrice;			// 단가
	private String total;			// 금액
	private String PrescriptTotalFee; // 처방전 총합
	private String mdNo;			// 약품 번호
	int count;

	public String getMdNo() {
		return mdNo;
	}
	public void setMdNo(String mdNo) {
		this.mdNo = mdNo;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setFormat(DecimalFormat format) {
		this.format = format;
	}
	public int getCount() {
		return count;
	}
	public String getPrescriptTotalFee() {
		return PrescriptTotalFee;
	}
	public void setPrescriptTotalFee(int prescriptTotalFee) {
		PrescriptTotalFee = format.format(prescriptTotalFee);
	}

	DecimalFormat format = new DecimalFormat("###,###");

	public String getMdName() {
		return mdName;
	}
	public void setMdName(String mdName) {
		this.mdName = mdName;
	}
	public String getMiCompany() {
		return miCompany;
	}
	public void setMiCompany(String miCompany) {
		this.miCompany = miCompany;
	}
	public String getMiUse() {
		return miUse;
	}
	public void setMiUse(String miUse) {
		this.miUse = miUse;
	}
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	public String getPreDrugNum() {
		return preDrugNum;
	}
	public void setPreDrugNum(int preDrugNum) {
		this.preDrugNum = format.format(preDrugNum);
	}
	public String getPreDrugCount() {
		return preDrugCount;
	}
	public void setPreDrugCount(int preDrugCount) {
		this.preDrugCount = format.format(preDrugCount);
	}
	public String getPreDrugDay() {
		return preDrugDay;
	}
	public void setPreDrugDay(int preDrugDay) {
		this.preDrugDay = format.format(preDrugDay);
	}
	public String getMiPrice() {
		return miPrice;
	}
	public void setMiPrice(int miPrice) {
		this.miPrice = format.format(miPrice);
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(int total) {
		count = total;
		this.total = format.format(total);
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}


}
