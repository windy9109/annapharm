package kr.or.annapharm.command;

import java.util.Date;

public class InsertRetrieveCommand {
	private int retrieveNo;
	private String chemistCode;
	private String pharmacyCode;
	private Date retrieveDate;

	private String rlName;
	private String rlCode;
	private String rlReason;
	private int rlNum;
	private String rlQr;
	private String miUnit;

	private int flag;

	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public int getRetrieveNo() {
		return retrieveNo;
	}
	public void setRetrieveNo(int retrieveNo) {
		this.retrieveNo = retrieveNo;
	}
	public String getChemistCode() {
		return chemistCode;
	}
	public void setChemistCode(String chemistCode) {
		this.chemistCode = chemistCode;
	}
	public String getPharmacyCode() {
		return pharmacyCode;
	}
	public void setPharmacyCode(String pharmacyCode) {
		this.pharmacyCode = pharmacyCode;
	}
	public Date getRetrieveDate() {
		return retrieveDate;
	}
	public void setRetrieveDate(Date retrieveDate) {
		this.retrieveDate = retrieveDate;
	}
	public String getRlName() {
		return rlName;
	}
	public void setRlName(String rlName) {
		this.rlName = rlName;
	}
	public String getRlCode() {
		return rlCode;
	}
	public void setRlCode(String rlCode) {
		this.rlCode = rlCode;
	}
	public String getRlReason() {
		return rlReason;
	}
	public void setRlReason(String rlReason) {
		this.rlReason = rlReason;
	}
	public int getRlNum() {
		return rlNum;
	}
	public void setRlNum(int rlNum) {
		this.rlNum = rlNum;
	}
	public String getRlQr() {
		return rlQr;
	}
	public void setRlQr(String rlQr) {
		this.rlQr = rlQr;
	}
	public String getMiUnit() {
		return miUnit;
	}
	public void setMiUnit(String miUnit) {
		this.miUnit = miUnit;
	}
}
