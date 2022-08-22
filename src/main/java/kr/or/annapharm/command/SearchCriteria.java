package kr.or.annapharm.command;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SearchCriteria extends Criteria {

	private String keyword;
	private String searchType;
	private String searchType1;
	private String searchType2;
	private String searchType3;
	private String searchType4;
	private String searchType5;
	private String startDate;
	private String endDate;
	private String pharmacyCode;
	private String doctorCode;
	private String patientCode;
	private String psCode;

	public String getPsCode() {
		return psCode;
	}

	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}

	public String getPatientCode() {
		return patientCode;
	}

	public void setPatientCode(String patientCode) {
		this.patientCode = patientCode;
	}

	public String getDoctorCode() {
		return doctorCode;
	}

	public void setDoctorCode(String doctorCode) {
		this.doctorCode = doctorCode;
	}

	public String getSearchType1() {
		return searchType1;
	}

	public void setSearchType1(String searchType1) {
		this.searchType1 = searchType1;
	}

	public String getSearchType5() {
		return searchType5;
	}

	public void setSearchType5(String searchType5) {
		this.searchType5 = searchType5;
	}

	public String getSearchType4() {
		return searchType4;
	}

	public void setSearchType4(String searchType4) {
		this.searchType4 = searchType4;
	}

	public String getPharmacyCode() {
		return pharmacyCode;
	}

	public void setPharmacyCode(String pharmacyCode) {
		this.pharmacyCode = pharmacyCode;
	}

	public String getSearchType3() {
		return searchType3;
	}

	public void setSearchType3(String searchType3) {
		this.searchType3 = searchType3;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getSearchType2() {
		return searchType2;
	}

	public void setSearchType2(String searchType2) {
		this.searchType2 = searchType2;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
