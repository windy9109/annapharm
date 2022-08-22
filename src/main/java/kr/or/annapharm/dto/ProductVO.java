package kr.or.annapharm.dto;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ProductVO {
	String productQr;
	String pharmacyCode;
	String productUnit;
	String productPosition;
	String mdName;
	String mdClass;
	String miType;
	String warnMark;
	String miCode;
	String miCompany;
	String miUnit;
	String miPrice;
	int mdNo;
	int productOwnnum;
	int productOwnnumStandard;
	int dateOver;
	int distinctNum = 1;
	Date productDate;
	
	public String getMiPrice() {
		return miPrice;
	}
	public void setMiPrice(String miPrice) {
		this.miPrice = miPrice;
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
	public String getMiCompany() {
		return miCompany;
	}
	public void setMiCompany(String miCompany) {
		this.miCompany = miCompany;
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
	public int getMdNo() {
		return mdNo;
	}
	public void setMdNo(int mdNo) {
		this.mdNo = mdNo;
	}
	public int getProductOwnnum() {
		return productOwnnum;
	}
	public void setProductOwnnum(int productOwnnum) {
		this.productOwnnum = productOwnnum;
	}
	public int getProductOwnnumStandard() {
		return productOwnnumStandard;
	}
	public void setProductOwnnumStandard(int productOwnnumStandard) {
		this.productOwnnumStandard = productOwnnumStandard;
	}
	public int getDateOver() {
		return dateOver;
	}
	public void setDateOver(int dateOver) {
		this.dateOver = dateOver;
	}
	public int getDistinctNum() {
		return distinctNum;
	}
	public void setDistinctNum(int distinctNum) {
		this.distinctNum = distinctNum;
	}
	public Date getProductDate() {
		return productDate;
	}
	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	
	
	
	
	
	
}
