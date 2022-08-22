package kr.or.annapharm.dto;

public class QRVO {
	String mdName;
	String qrName;
	String medi;
	String year;
	String date;
	int mdNum;
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMedi() {
		return medi;
	}
	public void setMedi(String medi) {
		this.medi = medi;
	}
	public String getMdName() {
		return mdName;
	}
	public void setMdName(String mdName) {
		this.mdName = mdName;
	}
	public String getQrName() {
		return qrName;
	}
	public void setQrName(String qrName) {
		this.qrName = qrName;
	}
	public int getMdNum() {
		return mdNum;
	}
	public void setMdNum(int mdNum) {
		this.mdNum = mdNum;
	}
	@Override
	public String toString() {
		return "QRVO [mdName=" + mdName + ", qrName=" + qrName + ", mdNum=" + mdNum + "]";
	}
	
	
	
}
