package kr.or.annapharm.dto;

import java.util.Date;

public class OrderCartVO {
	String orderNo;
	int mdNo;
	int orderCartNum;
	int orderCartPrice;
	String miType;
	String miCompany;
	String mdName;
	String mdTerm;
	String miUnit; 
	Date orderDate;
	
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
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
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public int getMdNo() {
		return mdNo;
	}
	public void setMdNo(int mdNo) {
		this.mdNo = mdNo;
	}
	public int getOrderCartNum() {
		return orderCartNum;
	}
	public void setOrderCartNum(int orderCartNum) {
		this.orderCartNum = orderCartNum;
	}
	public int getOrderCartPrice() {
		return orderCartPrice;
	}
	public void setOrderCartPrice(int orderCartPrice) {
		this.orderCartPrice = orderCartPrice;
	}
	
	
}
