package kr.or.annapharm.command;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author PC-09
 *	개요 : 약국 매출 현황 페이지 매출 목록에 데이터를 넣기 위한 command객체
 *	작성자 : 이병진
 */
@SuppressWarnings("serial")
public class SalesAnalysisCommand implements Serializable {

	private String psCompleteDate;	// 처방 완료 날짜
	private String psType;			// 처방전 구분
	private String patientName;		// 환자명
	private String chemistName;		// 조제약사
	private String totalMedicienBill;// 약제비
	private String charge;			// 청구액
	private String patientCharge;	// 본인부담금
	private String deposit;			// 입금액
	private String compoundingFee;	// 조제료
	private String medicienBill;	// 약가 합산
	private String psCode;			// 처방전 코드

	public String getPsCode() {
		return psCode;
	}
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	public String getPsCompleteDate() {
		return psCompleteDate;
	}
	public void setPsCompleteDate(String psCompleteDate) {
		this.psCompleteDate = psCompleteDate;
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
	public String getTotalMedicienBill() {
		return totalMedicienBill;
	}
	public double getTotalMedicienBillInt() {
		return Double.parseDouble(totalMedicienBill.replaceAll(",", ""));
	}
	public void setTotalMedicienBill(String totalMedicienBill) {
		this.totalMedicienBill = totalMedicienBill;
	}
	public String getCharge() {
		return charge;
	}
	public double getChargeInt() {
		return Double.parseDouble(charge.replaceAll(",", ""));
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
	public String getPatientCharge() {
		return patientCharge;
	}
	public double getPatientChargeInt() {
		return Double.parseDouble(patientCharge.replaceAll(",", ""));
	}
	public void setPatientCharge(String patientCharge) {
		this.patientCharge = patientCharge;
	}
	public String getDeposit() {
		return deposit;
	}
	public double getDepositInt() {
		return Double.parseDouble(deposit.replaceAll(",", ""));
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public String getCompoundingFee() {
		return compoundingFee;
	}
	public double getCompoundingFeeInt() {
		return Double.parseDouble(compoundingFee.replaceAll(",", ""));
	}
	public void setCompoundingFee(String compoundingFee) {
		this.compoundingFee = compoundingFee;
	}
	public String getMedicienBill() {
		return medicienBill;
	}
	public double getMedicienBillInt() {
		return Double.parseDouble(medicienBill.replaceAll(",", ""));
	}
	public void setMedicienBill(String medicienBill) {
		this.medicienBill = medicienBill;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.SIMPLE_STYLE);
	}

}
