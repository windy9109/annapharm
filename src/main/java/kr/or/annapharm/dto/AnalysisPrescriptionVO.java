package kr.or.annapharm.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class AnalysisPrescriptionVO {
	private int age;
	private int male;
	private int female;
	/**
	 * @return the age
	 */
	public int getAge() {
		return age;
	}
	/**
	 * @param age the age to set
	 */
	public void setAge(int age) {
		this.age = age;
	}
	/**
	 * @return the male
	 */
	public int getMale() {
		return male;
	}
	/**
	 * @param male the male to set
	 */
	public void setMale(int male) {
		this.male = male;
	}
	/**
	 * @return the female
	 */
	public int getFemale() {
		return female;
	}
	/**
	 * @param female the female to set
	 */
	public void setFemale(int female) {
		this.female = female;
	}
	@Override
	public String toString() {
		return "AnalysisPrescriptionVO [age=" + age + ", male=" + male + ", female=" + female + "]";
	}
	
	
}
