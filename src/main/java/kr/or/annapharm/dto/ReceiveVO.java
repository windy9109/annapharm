package kr.or.annapharm.dto;

import java.util.Date;

public class ReceiveVO {
	String receiveNo;
	String pharmacyCode;
	String receiveWriter;
	Date receiveDate;
	Date receiveLastdate;
	String receiveStatus;
	
	public String getReceiveNo() {
		return receiveNo;
	}
	public void setReceiveNo(String receiveNo) {
		this.receiveNo = receiveNo;
	}
	public String getPharmacyCode() {
		return pharmacyCode;
	}
	public void setPharmacyCode(String pharmacyCode) {
		this.pharmacyCode = pharmacyCode;
	}
	public String getReceiveWriter() {
		return receiveWriter;
	}
	public void setReceiveWriter(String receiveWriter) {
		this.receiveWriter = receiveWriter;
	}
	public Date getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}
	public Date getReceiveLastdate() {
		return receiveLastdate;
	}
	public void setReceiveLastdate(Date receiveLastdate) {
		this.receiveLastdate = receiveLastdate;
	}
	public String getReceiveStatus() {
		return receiveStatus;
	}
	public void setReceiveStatus(String receiveStatus) {
		this.receiveStatus = receiveStatus;
	}
	
	
}
