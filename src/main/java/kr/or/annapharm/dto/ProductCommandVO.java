package kr.or.annapharm.dto;

public class ProductCommandVO {
	String productQr;
	String pharmacyCode;
	String piHpid;
	String productUnit;
	String productDate;
	String productPosition;
	String receiveCartPosition;
	String mdName;
	String mdClass;
	String miType;
	String warnMark;
	String mdNo;
	String productOwnnum;
	String productOwnnumStandard;
	String dateOver;
	String miCompany;
	String miPrice;
	int receiveNo;
	int orderNo;
	String loginMember;
	String receiveCartNum;
	String orderCartNum;
	String receiveCartPrice;
	String orderCartPrice;
	String receiveShelfLife;
	
	public String getLoginMember() {
		return loginMember;
	}
	public void setLoginMember(String loginMember) {
		this.loginMember = loginMember;
	}
	public String getPiHpid() {
		return piHpid;
	}
	public void setPiHpid(String piHpid) {
		this.piHpid = piHpid;
	}
	public String getReceiveCartPosition() {
		return receiveCartPosition;
	}
	public void setReceiveCartPosition(String receiveCartPosition) {
		this.receiveCartPosition = receiveCartPosition;
	}
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
	public String getProductUnit() {
		return productUnit;
	}
	public void setProductUnit(String productUnit) {
		this.productUnit = productUnit;
	}
	public String getProductDate() {
		return productDate;
	}
	public void setProductDate(String productDate) {
		this.productDate = productDate;
	}
	public String getProductPosition() {
		return productPosition;
	}
	public void setProductPosition(String productPosition) {
		this.productPosition = productPosition;
	}
	public String getMdName() {
		return mdName;
	}
	public void setMdName(String mdName) {
		this.mdName = mdName;
	}
	public String getMdClass() {
		return mdClass;
	}
	public void setMdClass(String mdClass) {
		this.mdClass = mdClass;
	}
	public String getMiType() {
		return miType;
	}
	public void setMiType(String miType) {
		this.miType = miType;
	}
	public String getWarnMark() {
		return warnMark;
	}
	public void setWarnMark(String warnMark) {
		this.warnMark = warnMark;
	}
	public String getMdNo() {
		return mdNo;
	}
	public void setMdNo(String mdNo) {
		this.mdNo = mdNo;
	}
	public String getProductOwnnum() {
		return productOwnnum;
	}
	public void setProductOwnnum(String productOwnnum) {
		this.productOwnnum = productOwnnum;
	}
	public String getProductOwnnumStandard() {
		return productOwnnumStandard;
	}
	public void setProductOwnnumStandard(String productOwnnumStandard) {
		this.productOwnnumStandard = productOwnnumStandard;
	}
	public String getDateOver() {
		return dateOver;
	}
	public void setDateOver(String dateOver) {
		this.dateOver = dateOver;
	}
	public String getMiCompany() {
		return miCompany;
	}
	public void setMiCompany(String miCompany) {
		this.miCompany = miCompany;
	}
	public String getMiPrice() {
		return miPrice;
	}
	public void setMiPrice(String miPrice) {
		this.miPrice = miPrice;
	}
	public int getReceiveNo() {
		return receiveNo;
	}
	public void setReceiveNo(int receiveNo) {
		this.receiveNo = receiveNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
	public String getReceiveShelfLife() {
		return receiveShelfLife;
	}
	public void setReceiveShelfLife(String receiveShelfLife) {
		this.receiveShelfLife = receiveShelfLife;
	}
	@Override
	public String toString() {
		return "ProductCommandVO [productQr=" + productQr + ", pharmacyCode=" + pharmacyCode + ", productUnit="
				+ productUnit + ", productDate=" + productDate + ", productPosition=" + productPosition + ", mdName="
				+ mdName + ", mdClass=" + mdClass + ", miType=" + miType + ", warnMark=" + warnMark + ", mdNo=" + mdNo
				+ ", productOwnnum=" + productOwnnum + ", productOwnnumStandard=" + productOwnnumStandard
				+ ", dateOver=" + dateOver + ", miCompany=" + miCompany + ", miPrice=" + miPrice + ", receiveNo="
				+ receiveNo + ", orderNo=" + orderNo + ", receiveCartNum=" + receiveCartNum + ", orderCartNum="
				+ orderCartNum + ", receiveCartPrice=" + receiveCartPrice + ", orderCartPrice=" + orderCartPrice
				+ ", receiveShelfLife=" + receiveShelfLife + "]";
	}
	
	
}
