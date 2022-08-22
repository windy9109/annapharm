package kr.or.annapharm.dto;

public class RetrieveListVO {
	private String retrieveNo;
	private String RlName;
	private String RlCode;
	private String RlReason;
	private String RlNum;
	private String RlQr;
	private String MiUnit;

	public String getRetrieveNo() {
		return retrieveNo;
	}
	public void setRetrieveNo(String retrieveNo) {
		this.retrieveNo = retrieveNo;
	}
	public String getRlName() {
		return RlName;
	}
	public void setRlName(String rlName) {
		RlName = rlName;
	}
	public String getRlCode() {
		return RlCode;
	}
	public void setRlCode(String rlCode) {
		RlCode = rlCode;
	}
	public String getRlReason() {
		return RlReason;
	}
	public void setRlReason(String rlReason) {
		RlReason = rlReason;
	}
	public String getRlNum() {
		return RlNum;
	}
	public void setRlNum(String rlNum) {
		RlNum = rlNum;
	}
	public String getRlQr() {
		return RlQr;
	}
	public void setRlQr(String rlQr) {
		RlQr = rlQr;
	}
	public String getMiUnit() {
		return MiUnit;
	}
	public void setMiUnit(String miUnit) {
		MiUnit = miUnit;
	}
	@Override
	public String toString() {
		return "RetrieveListVO [retrieveNo=" + retrieveNo + ", RlName=" + RlName + ", RlCode=" + RlCode + ", RlReason="
				+ RlReason + ", RlNum=" + RlNum + ", RlQr=" + RlQr + ", MiUnit=" + MiUnit + "]";
	}

}
