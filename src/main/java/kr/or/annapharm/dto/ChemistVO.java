package kr.or.annapharm.dto;

public class ChemistVO extends MemberVO {

	private String chemistCode;
	private String pharmacyCode;
	private String pharmacyName;
	private String memName;


	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
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

	public String getPharmacyName() {
		return pharmacyName;
	}

	public void setPharmacyName(String pharmacyName) {
		this.pharmacyName = pharmacyName;
	}

	@Override
	public String toString() {
		return "ChemistVO [chemistCode=" + chemistCode + ", pharmacyCode=" + pharmacyCode + ", pharmacyName="
				+ pharmacyName + "]";
	}
}
