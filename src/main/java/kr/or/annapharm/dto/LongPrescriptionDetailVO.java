package kr.or.annapharm.dto;

public class LongPrescriptionDetailVO extends PrescriptionDetailVO {
	private int ownNum;
	private String ownNumCheck = "-";
	private String selectMd = "far fa-plus-square";
	/**
	 * @return the selectMd
	 */
	public String getSelectMd() {
		return selectMd;
	}
	/**
	 * @param selectMd the selectMd to set
	 */
	public void setSelectMd(String selectMd) {
		this.selectMd = selectMd;
	}
	/**
	 * @return the ownNum
	 */
	public int getOwnNum() {
		return ownNum;
	}
	/**
	 * @param ownNum the ownNum to set
	 */
	public void setOwnNum(int ownNum) {
		this.ownNum = ownNum;
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
		return "LongPrescriptionDetailVO [ownNum=" + ownNum + ", ownNumCheck=" + ownNumCheck + "]";
	}
	
	
	
}
