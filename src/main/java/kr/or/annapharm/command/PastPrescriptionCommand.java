package kr.or.annapharm.command;

import java.util.Date;

public class PastPrescriptionCommand {
	private String psCode; // 코드 정보
	private String name; // 약 이름
	private Date psDate; // 처방일
	private String piDutyname; // 약국이름
	private String piDutytel1; //약국 전화번호

	private String phmacyCode; //약국 번호
	private String patientCode; // 환자 코드
	private String mdName; // 약이름 하나만 뜯기
	private int mdCount; // 약 종류 개수
	private String mdNo;

	private String preDrugCount; //하루에 투약 횟수
	private String preDrugDay; //몇일간 복용



	public String getPhmacyCode() {
		return phmacyCode;
	}

	public void setPhmacyCode(String phmacyCode) {
		this.phmacyCode = phmacyCode;
	}

	public String getPiDutytel1() {
		return piDutytel1;
	}

	public void setPiDutytel1(String piDutytel1) {
		this.piDutytel1 = piDutytel1;
	}

	public String getMdNo() {
		return mdNo;
	}

	public void setMdNo(String mdNo) {
		this.mdNo = mdNo;
	}

	public String getPreDrugCount() {
		return preDrugCount;
	}

	public void setPreDrugCount(String preDrugCount) {
		this.preDrugCount = preDrugCount;
	}

	public String getPreDrugDay() {
		return preDrugDay;
	}

	public void setPreDrugDay(String preDrugDay) {
		this.preDrugDay = preDrugDay;
	}

	public String getPatientCode() {
		return patientCode;
	}

	public void setPatientCode(String patientCode) {
		this.patientCode = patientCode;
	}

	public String getPsCode() {
		return psCode;
	}

	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getPsDate() {
		return psDate;
	}

	public void setPsDate(Date psDate) {
		this.psDate = psDate;
	}

	public String getPiDutyname() {
		return piDutyname;
	}

	public void setPiDutyname(String piDutyname) {
		this.piDutyname = piDutyname;
	}

	public String getMdName() {
		return mdName;
	}

	public void setMdName(String mdName) {
		this.mdName = mdName;
	}

	public int getMdCount() {
		return mdCount;
	}

	public void setMdCount(int length) {
		this.mdCount = length;
	}

	@Override
	public String toString() {
		return "PastPrescriptionCommand [psCode=" + psCode + ", name=" + name + ", psDate=" + psDate + ", piDutyname="
				+ piDutyname + ", patientCode=" + patientCode + ", mdName=" + mdName + ", mdCount=" + mdCount
				+ ", preDrugCount=" + preDrugCount + ", preDrugDay=" + preDrugDay + "]";
	}



}
