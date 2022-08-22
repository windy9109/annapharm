package kr.or.annapharm.dto;

import java.util.Date;

public class ReceiveCartVO {
	String receiveNo;
	int mdNo;
	int receiveCartNum;
	int receiveCartPrice;
	String miType;
	String miCompany;
	String mdName;
	String mdTerm;
	String miUnit; 
	Date receiveDate;
	

	public Date getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}
	public String getMiType() {
		return miType;
	}
	public void setMiType(String miType) {
		this.miType = miType;
	}
	public String getMiCompany() {
		return miCompany;
	}
	public void setMiCompany(String miCompany) {
		this.miCompany = miCompany;
	}
	public String getMdName() {
		return mdName;
	}
	public void setMdName(String mdName) {
		this.mdName = mdName;
	}
	public String getMdTerm() {
		return mdTerm;
	}
	public void setMdTerm(String mdTerm) {
		this.mdTerm = mdTerm;
	}
	public String getMiUnit() {
		return miUnit;
	}
	public void setMiUnit(String miUnit) {
		this.miUnit = miUnit;
	}
	public String getReceiveNo() {
		return receiveNo;
	}
	public void setReceiveNo(String receiveNo) {
		this.receiveNo = receiveNo;
	}
	public int getMdNo() {
		return mdNo;
	}
	public void setMdNo(int mdNo) {
		this.mdNo = mdNo;
	}
	public int getReceiveCartNum() {
		return receiveCartNum;
	}
	public void setReceiveCartNum(int receiveCartNum) {
		this.receiveCartNum = receiveCartNum;
	}
	public int getReceiveCartPrice() {
		return receiveCartPrice;
	}
	public void setReceiveCartPrice(int receiveCartPrice) {
		this.receiveCartPrice = receiveCartPrice;
	}
	
	
}	
