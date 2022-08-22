package kr.or.annapharm.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class FindPharmacyCommandVO {
	private String addressName;
	private String categoryGroupCode;
	private String categoryGroupName;
	private String categoryName;
	private String distance;
	private String id;
	private String phone;
	private String placeName;
	private String placeUrl;
	private String roadAddressName;
	private String x;
	private String y;
	/**
	 * @return the addressName
	 */
	public String getAddressName() {
		return addressName;
	}
	/**
	 * @param addressName the addressName to set
	 */
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	/**
	 * @return the categoryGroupCode
	 */
	public String getCategoryGroupCode() {
		return categoryGroupCode;
	}
	/**
	 * @param categoryGroupCode the categoryGroupCode to set
	 */
	public void setCategoryGroupCode(String categoryGroupCode) {
		this.categoryGroupCode = categoryGroupCode;
	}
	/**
	 * @return the categoryGroupName
	 */
	public String getCategoryGroupName() {
		return categoryGroupName;
	}
	/**
	 * @param categoryGroupName the categoryGroupName to set
	 */
	public void setCategoryGroupName(String categoryGroupName) {
		this.categoryGroupName = categoryGroupName;
	}
	/**
	 * @return the categoryName
	 */
	public String getCategoryName() {
		return categoryName;
	}
	/**
	 * @param categoryName the categoryName to set
	 */
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	/**
	 * @return the distance
	 */
	public String getDistance() {
		return distance;
	}
	/**
	 * @param distance the distance to set
	 */
	public void setDistance(String distance) {
		this.distance = distance;
	}
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the placeName
	 */
	public String getPlaceName() {
		return placeName;
	}
	/**
	 * @param placeName the placeName to set
	 */
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	/**
	 * @return the placeUrl
	 */
	public String getPlaceUrl() {
		return placeUrl;
	}
	/**
	 * @param placeUrl the placeUrl to set
	 */
	public void setPlaceUrl(String placeUrl) {
		this.placeUrl = placeUrl;
	}
	/**
	 * @return the roadAddressName
	 */
	public String getRoadAddressName() {
		return roadAddressName;
	}
	/**
	 * @param roadAddressName the roadAddressName to set
	 */
	public void setRoadAddressName(String roadAddressName) {
		this.roadAddressName = roadAddressName;
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
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
}
