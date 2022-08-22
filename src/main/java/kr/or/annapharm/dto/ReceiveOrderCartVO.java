package kr.or.annapharm.dto;

public class ReceiveOrderCartVO {
	String receiveNo;
	String productQr;
	String orderNo;
	String mdNo;
	String receiveCartNum;
	String orderCartNum;
	String receiveCartPrice;
	String orderCartPrice;
	String miType;
	String miCompany;
	String mdName;
	String mdTerm;
	String miUnit;
	String miCode;
	String productPosition;
	String receiveCartPosition;
	String receiveDate;
	String orderDate;
	String receiveShelfLife;
	String pharmacyCode;
	String piHpid;
	String loginMember;
	
	public String getProductQr() {
		return productQr;
	}
	public void setProductQr(String productQr) {
		this.productQr = productQr;
	}
	public String getPharmacyCode() {
		return pharmacyCode;
	}
	public void setPharmacyCode(String pharmacyCode) {
		this.pharmacyCode = pharmacyCode;
	}
	public String getPiHpid() {
		return piHpid;
	}
	public void setPiHpid(String piHpid) {
		this.piHpid = piHpid;
	}
	public String getLoginMember() {
		return loginMember;
	}
	public void setLoginMember(String loginMember) {
		this.loginMember = loginMember;
	}
	public String getReceiveCartPosition() {
		return receiveCartPosition;
	}
	public void setReceiveCartPosition(String receiveCartPosition) {
		this.receiveCartPosition = receiveCartPosition;
	}
	public String getProductPosition() {
		return productPosition;
	}
	public void setProductPosition(String productPosition) {
		this.productPosition = productPosition;
	}
	public String getReceiveNo() {
		return receiveNo;
	}
	public void setReceiveNo(String receiveNo) {
		this.receiveNo = receiveNo;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getMdNo() {
		return mdNo;
	}
	public void setMdNo(String mdNo) {
		this.mdNo = mdNo;
	}
	public String getReceiveCartNum() {
		return receiveCartNum;
	}
	public void setReceiveCartNum(String receiveCartNum) {
		this.receiveCartNum = receiveCartNum;
	}
	public String getOrderCartNum() {
		return orderCartNum;
	}
	public void setOrderCartNum(String orderCartNum) {
		this.orderCartNum = orderCartNum;
	}
	public String getReceiveCartPrice() {
		return receiveCartPrice;
	}
	public void setReceiveCartPrice(String receiveCartPrice) {
		this.receiveCartPrice = receiveCartPrice;
	}
	public String getOrderCartPrice() {
		return orderCartPrice;
	}
	public void setOrderCartPrice(String orderCartPrice) {
		this.orderCartPrice = orderCartPrice;
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
	public String getMiCode() {
		return miCode;
	}
	public void setMiCode(String miCode) {
		this.miCode = miCode;
	}
	public String getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate.substring(0,10).replace('-', '.');
	}
	
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate.substring(0,10).replace('-', '.');
	}
	public String getReceiveShelfLife() {
		return receiveShelfLife;
	}
	public void setReceiveShelfLife(String receiveShelfLife) {
		this.receiveShelfLife = receiveShelfLife.substring(0,10);
	}
	public void setReceiveShelfLifeDemo(String receiveShelfLife) {
		this.receiveShelfLife = receiveShelfLife;
	}
	@Override
	public String toString() {
		return "ReceiveOrderCartVO [receiveNo=" + receiveNo + ", orderNo=" + orderNo + ", mdNo=" + mdNo
				+ ", receiveCartNum=" + receiveCartNum + ", orderCartNum=" + orderCartNum + ", receiveCartPrice="
				+ receiveCartPrice + ", orderCartPrice=" + orderCartPrice + ", miType=" + miType + ", miCompany="
				+ miCompany + ", mdName=" + mdName + ", mdTerm=" + mdTerm + ", miUnit=" + miUnit + ", miCode=" + miCode
				+ ", productPosition=" + productPosition + ", receiveDate=" + receiveDate + ", orderDate=" + orderDate
				+ ", receiveShelfLife=" + receiveShelfLife + "]";
	}
	
		
}
