package kr.or.annapharm.dto;

public class SelectListVO extends CompareMedicineVO {

	private String chemistCode;
	private String miCode;
	private String miUnit;

	/**
	 * @return the miCode
	 */
	public String getMiCode() {
		return miCode;
	}

	/**
	 * @param miCode the miCode to set
	 */
	public void setMiCode(String miCode) {
		this.miCode = miCode;
	}

	/**
	 * @return the miUnit
	 */
	public String getMiUnit() {
		return miUnit;
	}

	/**
	 * @param miUnit the miUnit to set
	 */
	public void setMiUnit(String miUnit) {
		this.miUnit = miUnit;
	}

	/**
	 * @return the chemistCode
	 */
	public String getChemistCode() {
		return chemistCode;
	}

	/**
	 * @param chemistCode the chemistCode to set
	 */
	public void setChemistCode(String chemistCode) {
		this.chemistCode = chemistCode;
	}
	
}
