package kr.or.annapharm.dto;

import java.util.Date;

public class OrderVO {
	String orderNo;
	String pharmacyCode;
	String orderWriter;
	Date orderDate;
	Date orderLastdate;
	String orderStatus;
	
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getPharmacyCode() {
		return pharmacyCode;
	}
	public void setPharmacyCode(String pharmacyCode) {
		this.pharmacyCode = pharmacyCode;
	}
	public String getOrderWriter() {
		return orderWriter;
	}
	public void setOrderWriter(String orderWriter) {
		this.orderWriter = orderWriter;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Date getOrderLastdate() {
		return orderLastdate;
	}
	public void setOrderLastdate(Date orderLastdate) {
		this.orderLastdate = orderLastdate;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
}
