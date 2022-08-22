package kr.or.annapharm.dto;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import kr.or.annapharm.command.SalesAnalysisCommand;

/**
 * @author PC-09
 *	개요 : 약국매출현황 페이지 조제료 계산에 필요한 데이터를 담는 VO
 *	작성자 : 이병진
 */
@SuppressWarnings("serial")
public class SalesAnalysisVO implements Serializable{
	private Date psCompleteDate;	// 처방 완료 날짜
	private String psType;			// 처방전 구분
	private String patientName;		// 환자명
	private String chemistName;		// 조제약사
	private String mdDrug;			// 마약류 구분
	private String psCode;			// 처방전 코드
	private int preDrugDay;			// 조제일수
	private int preDrugNum;			// 약 총 개수
	private double totalMedicienBill;// 약제비
	private double charge;			// 청구액
	private double patientCharge;	// 본인부담금
	private double deposit;			// 입금액
	private double compoundingFee;	// 조제료
	private double medicienBill;	// 약가 합산

	public SalesAnalysisVO() {}

	public int getPreDrugNum() {
		return preDrugNum;
	}
	public void setPreDrugNum(int preDrugNum) {
		this.preDrugNum = preDrugNum;
	}
	public int getPreDrugDay() {
		return preDrugDay;
	}
	public void setPreDrugDay(int preDrugDay) {
		this.preDrugDay = preDrugDay;
	}
	public Date getPsCompleteDate() {
		return psCompleteDate;
	}
	public void setPsCompleteDate(Date psCompleteDate) {
		this.psCompleteDate = psCompleteDate;
	}
	public String getPsCode() {
		return psCode;
	}
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	public String getMdDrug() {
		return mdDrug;
	}
	public void setMdDrug(String mdDrug) {
		this.mdDrug = mdDrug;
	}
	public String getPsType() {
		return psType;
	}
	public void setPsType(String psType) {
		this.psType = psType;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getChemistName() {
		return chemistName;
	}
	public void setChemistName(String chemistName) {
		this.chemistName = chemistName;
	}
	public double getTotalMedicienBill() {
		return totalMedicienBill;
	}
	public void setTotalMedicienBill(double totalMedicienBill) {
		this.totalMedicienBill = totalMedicienBill;
	}
	public double getCharge() {
		return charge;
	}
	public void setCharge(double charge) {
		this.charge = charge;
	}
	public double getPatientCharge() {
		return patientCharge;
	}
	public void setPatientCharge(double patientCharge) {
		this.patientCharge = patientCharge;
	}
	public double getDeposit() {
		return deposit;
	}
	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}
	public double getCompoundingFee() {
		return compoundingFee;
	}
	public void setCompoundingFee(double compoundingFee) {
		this.compoundingFee = compoundingFee;
	}
	public double getMedicienBill() {
		return medicienBill;
	}
	public void setMedicienBill(double medicienBill) {
		this.medicienBill = medicienBill;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

	public SalesAnalysisCommand toSalesAnalysisCommand() {

		DecimalFormat format = new DecimalFormat("###,###");
		SimpleDateFormat dataformat = new SimpleDateFormat("yyyy.MM.dd");

		SalesAnalysisCommand sac = new SalesAnalysisCommand();
		sac.setPsCompleteDate(dataformat.format(this.psCompleteDate));
		sac.setPsType(this.psType);
		sac.setPatientName(this.patientName);
		sac.setChemistName(this.chemistName);
		sac.setTotalMedicienBill(format.format(this.totalMedicienBill));
		sac.setCharge(format.format(charge));
		sac.setPatientCharge(format.format(this.patientCharge));
		sac.setDeposit(format.format(this.deposit));
		sac.setCompoundingFee(format.format(this.compoundingFee));
		sac.setMedicienBill(format.format(medicienBill));
		sac.setPsCode(this.psCode);

		return sac;
	}


}
