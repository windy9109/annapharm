package kr.or.annapharm.dto;

public class DoctorVO extends MemberVO {

	private String doctorNum;
	private String hospitalCode;
	private String hospitalName;
	private String doctorCode;
	private String memName;

	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getDoctorCode() {
		return doctorCode;
	}
	public void setDoctorCode(String doctorCode) {
		this.doctorCode = doctorCode;
	}

	public String getDoctorNum() {
		return doctorNum;
	}

	public void setDoctorNum(String doctorNum) {
		this.doctorNum = doctorNum;
	}

	public String getHospitalCode() {
		return hospitalCode;
	}

	public void setHospitalCode(String hospitalCode) {
		this.hospitalCode = hospitalCode;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	@Override
	public String toString() {
		return "DoctorVO [doctorNum=" + doctorNum + ", hospitalCode=" + hospitalCode + ", hospitalName=" + hospitalName
				+ "]";
	}

}
