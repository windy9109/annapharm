package kr.or.annapharm.dto;

public class LongPrescriptionVO {
	private String psCode;
	private String psCompleteDate;
	private String patientName;
	private int preDrugDay;
	private String hospitalName;
	private String doctorName;
	private String chemistName;
	private String ownNumCheck = "-";
	/**
	 * @return the psCode
	 */
	public String getPsCode() {
		return psCode;
	}
	/**
	 * @param psCode the psCode to set
	 */
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	/**
	 * @return the psCompleteDate
	 */
	public String getPsCompleteDate() {
		return psCompleteDate;
	}
	/**
	 * @param psCompleteDate the psCompleteDate to set
	 */
	public void setPsCompleteDate(String psCompleteDate) {
		this.psCompleteDate = psCompleteDate;
	}
	/**
	 * @return the patientName
	 */
	public String getPatientName() {
		return patientName;
	}
	/**
	 * @return the preDrugDay
	 */
	public int getPreDrugDay() {
		return preDrugDay;
	}
	/**
	 * @param preDrugDay the preDrugDay to set
	 */
	public void setPreDrugDay(int preDrugDay) {
		this.preDrugDay = preDrugDay;
	}
	/**
	 * @param patientName the patientName to set
	 */
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	/**
	 * @return the hospitalName
	 */
	public String getHospitalName() {
		return hospitalName;
	}
	/**
	 * @param hospitalName the hospitalName to set
	 */
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	/**
	 * @return the doctorName
	 */
	public String getDoctorName() {
		return doctorName;
	}
	/**
	 * @param doctorName the doctorName to set
	 */
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	/**
	 * @return the chemistName
	 */
	public String getChemistName() {
		return chemistName;
	}
	/**
	 * @param chemistName the chemistName to set
	 */
	public void setChemistName(String chemistName) {
		this.chemistName = chemistName;
	}
	/**
	 * @return the ownNumCheck
	 */
	public String getOwnNumCheck() {
		return ownNumCheck;
	}
	/**
	 * @param ownNumCheck the ownNumCheck to set
	 */
	public void setOwnNumCheck(String ownNumCheck) {
		this.ownNumCheck = ownNumCheck;
	}
	@Override
	public String toString() {
		return "LongPrescriptionVO [psCode=" + psCode + ", psCompleteDate=" + psCompleteDate + ", patientName="
				+ patientName + ", preDrugDay=" + preDrugDay + ", hospitalName=" + hospitalName + ", doctorName="
				+ doctorName + ", chemistName=" + chemistName + ", ownNumCheck=" + ownNumCheck + "]";
	}
	
	
}
