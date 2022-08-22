package kr.or.annapharm.dto;

public class HospitalVO {
	private String hospitalCode; //병원 코드
	private String hospitalName; //병원 이름
	private String hospitalType; //병원 종류(종합병원, 의원...)
	private String hospitalAddr; //병원 주소
	private String hospitalPhone; //병원 전화번호
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
	public String getHospitalType() {
		return hospitalType;
	}
	public void setHospitalType(String hospitalType) {
		this.hospitalType = hospitalType;
	}
	public String getHospitalAddr() {
		return hospitalAddr;
	}
	public void setHospitalAddr(String hospitalAddr) {
		this.hospitalAddr = hospitalAddr;
	}
	public String getHospitalPhone() {
		return hospitalPhone;
	}
	public void setHospitalPhone(String hospitalPhone) {
		this.hospitalPhone = hospitalPhone;
	}
	@Override
	public String toString() {
		return "HospitalVO [hospitalCode=" + hospitalCode + ", hospitalName=" + hospitalName + ", hospitalType="
				+ hospitalType + ", hospitalAddr=" + hospitalAddr + ", hospitalPhone=" + hospitalPhone + "]";
	}
	
	
}
