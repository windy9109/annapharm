package kr.or.annapharm.dto;

import java.util.List;

public class PharmacyInfoMapVO extends PharmacyInfoVO implements Comparable<PharmacyInfoMapVO>{
	private String x = "";
	private String y = "";
	private int distance;
	private String toDayTime;
	private List<ProductVO> pharmacyProductInfo;
	
	/**
	 * @return the toDayTime
	 */
	public String getToDayTime() {
		return toDayTime;
	}
	@Override
	public String toString() {
		return "PharmacyInfoMapVO [x=" + x + ", y=" + y + ", distance=" + distance + ", toDayTime=" + toDayTime
				+ ", pharmacyProductInfo=" + pharmacyProductInfo + "]";
	}
	/**
	 * @param toDayTime the toDayTime to set
	 */
	public void setToDayTime(String toDayTime) {
		this.toDayTime = toDayTime;
	}

	
	/**
	 * @return the pharmacyProductInfo
	 */
	public List<ProductVO> getPharmacyProductInfo() {
		return pharmacyProductInfo;
	}
	/**
	 * @param pharmacyProductInfo the pharmacyProductInfo to set
	 */
	public void setPharmacyProductInfo(List<ProductVO> pharmacyProductInfo) {
		this.pharmacyProductInfo = pharmacyProductInfo;
	}
	/**
	 * @return the distance
	 */
	public int getDistance() {
		return distance;
	}
	/**
	 * @param distance the distance to set
	 */
	public void setDistance(int distance) {
		this.distance = distance;
	}
	/**
	 * @return the x
	 */
	public String getX() {
		return x;
	}
	/**
	 * @param x the x to set
	 */
	public void setX(String x) {
		this.x = x;
	}
	/**
	 * @return the y
	 */
	public String getY() {
		return y;
	}
	/**
	 * @param y the y to set
	 */
	public void setY(String y) {
		this.y = y;
	}
	
	@Override
	public int compareTo(PharmacyInfoMapVO o) {
		if(this.distance < o.getDistance()) return -1;
		else if(this.distance > o.getDistance()) return 1;
		else return 0;
	}
	
	
}
