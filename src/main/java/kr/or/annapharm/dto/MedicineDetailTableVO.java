package kr.or.annapharm.dto;

import java.util.Arrays;

public class MedicineDetailTableVO {
	private int mdNo;
    private String miName;
    private String mdClass;
    private String unit;
    /**
	 * @return the unit
	 */
	public String getUnit() {
		return unit;
	}
	/**
	 * @param unit the unit to set
	 */
	public void setUnit(String unit) {
		this.unit = unit.substring(1, unit.length()-1);
	}
	/**
	 * @return the miName
	 */
	public String getMiName() {
		return miName;
	}
	/**
	 * @param miName the miName to set
	 */
	public void setMiName(String miName) {
		this.miName = miName;
	}
	/**
	 * @return the mdClass
	 */
	public String getMdClass() {
		return mdClass;
	}
	/**
	 * @param mdClass the mdClass to set
	 */
	public void setMdClass(String mdClass) {
		this.mdClass = mdClass.substring(0,2);
	}
	private String mdNature;
    private String mdComponent;
    private String miCompany;
    private int miPrice;
    private int miType;
    private String className;
	/**
	 * @return the mdNo
	 */
	public int getMdNo() {
		return mdNo;
	}
	/**
	 * @param mdNo the mdNo to set
	 */
	public void setMdNo(int mdNo) {
		this.mdNo = mdNo;
	}
	
	/**
	 * @return the mdNature
	 */
	public String getMdNature() {
		return mdNature;
	}
	/**
	 * @param mdNature the mdNature to set
	 */
	public void setMdNature(String mdNature) {
		this.mdNature = mdNature;
	}
	/**
	 * @return the mdComponent
	 */
	public String getMdComponent() {
		return mdComponent;
	}
	/**
	 * @param mdComponent the mdComponent to set
	 */
	public void setMdComponent(String mdComponent) {
		this.mdComponent = mdComponent.replace('|', ',').split(",")[0].substring(9);
	}
	/**
	 * @return the miCompany
	 */
	public String getMiCompany() {
		return miCompany;
	}
	/**
	 * @param miCompany the miCompany to set
	 */
	public void setMiCompany(String miCompany) {
		this.miCompany = miCompany;
	}
	/**
	 * @return the miPrice
	 */
	public int getMiPrice() {
		return miPrice;
	}
	/**
	 * @param miPrice the miPrice to set
	 */
	public void setMiPrice(int miPrice) {
		this.miPrice = miPrice;
	}
	/**
	 * @return the miType
	 */
	public int getMiType() {
		return miType;
	}
	/**
	 * @param miType the miType to set
	 */
	public void setMiType(int miType) {
		this.miType = miType;
	}
	/**
	 * @return the className
	 */
	public String getClassName() {
		return className;
	}
	/**
	 * @param className the className to set
	 */
	public void setClassName(String className) {
		this.className = className;
	}
    
    
}
