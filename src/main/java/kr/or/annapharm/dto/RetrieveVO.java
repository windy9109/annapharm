package kr.or.annapharm.dto;

import java.util.Date;

public class RetrieveVO {

	private int retrieveNo;
	private String chemistCode;
	private String pharmacyCode;
	private Date retrieveDate;

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
	@Override
	public String toString() {
		return "RetrieveVO [retrieveNo=" + retrieveNo + ", chemistCode=" + chemistCode + ", pharmacyCode="
				+ pharmacyCode + ", retrieveDate=" + retrieveDate + "]";
	}
}
