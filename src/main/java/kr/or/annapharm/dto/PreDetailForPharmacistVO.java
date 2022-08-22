package kr.or.annapharm.dto;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import kr.or.annapharm.command.SalesAnalysisCommand;
@SuppressWarnings("serial")
public class PreDetailForPharmacistVO implements Serializable{
	
	private String psCode;	// 처방전 교부코드
	private String psLastDate;	// 교부일자
	private String hospitalName;	// 발행기관(병원명)
	private String memName;	// 이름(의사명)
	private String chemistName;	// 이름(약사명)
	private String pharmacyName;	// 조제약국(약국명)
	private String pharmacyCode;	// 약국코드
	private String psStatus;	// 처방전 상태
	private String psType;	// 처방/비처방
	
	private String mdClass;	// 구분
	private String mdNo;	// 약번호
	private String mdName;	// 약명
	private int preDrugCount;	// 횟수
	private int preDrugDay;		// 일수
	private int miPrice;	// 약 금액(횟수*일수*1개금액)
	private String mdDrug;	// 마약구분
	
	private double totalMedicienBill;// 약제비
	private double charge;			// 청구액
	private double patientCharge;	// 본인부담금
	private double nonBenefit = 0;	// 비급여
	private double total;	// 총 처방금액
	
	private String productPosition="-";	// 위치
	private int productOwnnum=0;	// 재고
	
	
	public String getPharmacyCode() {
		return pharmacyCode;
	}
	public void setPharmacyCode(String pharmacyCode) {
		this.pharmacyCode = pharmacyCode;
	}
	public String getChemistName() {
		return chemistName;
	}
	public void setChemistName(String chemistName) {
		this.chemistName = chemistName;
	}
	public String getMdDrug() {
		return mdDrug;
	}
	public void setMdDrug(String mdDrug) {
		this.mdDrug = mdDrug;
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
	public double getNonBenefit() {
		return nonBenefit;
	}
	public void setNonBenefit(double nonBenefit) {
		this.nonBenefit = nonBenefit;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getMiPrice() {
		return miPrice;
	}
	public void setMiPrice(int miPrice) {
		this.miPrice = miPrice;
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
	public String getPsLastDate() {
		return psLastDate;
	}
	public void setPsLastDate(String psLastDate) {
		this.psLastDate = psLastDate;
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
	public String getMdClass() {
		return mdClass;
	}
	public void setMdClass(String mdClass) {
		this.mdClass = mdClass;
	}
	public String getMdNo() {
		return mdNo;
	}
	public void setMdNo(String mdNo) {
		this.mdNo = mdNo;
	}
	public String getMdName() {
		return mdName;
	}
	public void setMdName(String mdName) {
		this.mdName = mdName;
	}
	public int getPreDrugCount() {
		return preDrugCount;
	}
	public void setPreDrugCount(int preDrugCount) {
		this.preDrugCount = preDrugCount;
	}
	public int getPreDrugDay() {
		return preDrugDay;
	}
	public void setPreDrugDay(int preDrugDay) {
		this.preDrugDay = preDrugDay;
	}
	public String getProductPosition() {
		return productPosition;
	}
	public void setProductPosition(String productPosition) {
		this.productPosition = productPosition;
	}
	public int getProductOwnnum() {
		return productOwnnum;
	}
	public void setProductOwnnum(int productOwnnum) {
		this.productOwnnum = productOwnnum;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}

	
}
