package kr.or.annapharm.dto;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author PC-09
 * 	개요 : 매출 Dashboard에 들어갈 값을 저장할 VO
 * 	작성자 : 이병진
 *
 */
@SuppressWarnings("serial")
public class SalesDashboardResultVO implements Serializable {

	private double day7;
	private double day14;
	private double day21;
	private double day28;
	private double month1;
	private double month2;
	private double month3;
	private double month4;
	private double month5;
	private double month6;
	private double month7;
	private double month8;
	private double month9;
	private double month10;
	private double month11;
	private double month12;
	private double mon;
	private double tue;
	private double wed;
	private double thur;
	private double fri;
	private double sat;
	private double sun;


	public double getDay7() {
		return day7;
	}
	public void setDay7(double day7) {
		this.day7 = day7;
	}
	public double getDay14() {
		return day14;
	}
	public void setDay14(double day14) {
		this.day14 = day14;
	}
	public double getDay21() {
		return day21;
	}
	public void setDay21(double day21) {
		this.day21 = day21;
	}
	public double getDay28() {
		return day28;
	}
	public void setDay28(double day28) {
		this.day28 = day28;
	}
	public double getMonth1() {
		return month1;
	}
	public void setMonth1(double month1) {
		this.month1 = month1;
	}
	public double getMonth2() {
		return month2;
	}
	public void setMonth2(double month2) {
		this.month2 = month2;
	}
	public double getMonth3() {
		return month3;
	}
	public void setMonth3(double month3) {
		this.month3 = month3;
	}
	public double getMonth4() {
		return month4;
	}
	public void setMonth4(double month4) {
		this.month4 = month4;
	}
	public double getMonth5() {
		return month5;
	}
	public void setMonth5(double month5) {
		this.month5 = month5;
	}
	public double getMonth6() {
		return month6;
	}
	public void setMonth6(double month6) {
		this.month6 = month6;
	}
	public double getMonth7() {
		return month7;
	}
	public void setMonth7(double month7) {
		this.month7 = month7;
	}
	public double getMonth8() {
		return month8;
	}
	public void setMonth8(double month8) {
		this.month8 = month8;
	}
	public double getMonth9() {
		return month9;
	}
	public void setMonth9(double month9) {
		this.month9 = month9;
	}
	public double getMonth10() {
		return month10;
	}
	public void setMonth10(double month10) {
		this.month10 = month10;
	}
	public double getMonth11() {
		return month11;
	}
	public void setMonth11(double month11) {
		this.month11 = month11;
	}
	public double getMonth12() {
		return month12;
	}
	public void setMonth12(double month12) {
		this.month12 = month12;
	}
	public double getMon() {
		return mon;
	}
	public void setMon(double mon) {
		this.mon = mon;
	}
	public double getTue() {
		return tue;
	}
	public void setTue(double tue) {
		this.tue = tue;
	}
	public double getWed() {
		return wed;
	}
	public void setWed(double wed) {
		this.wed = wed;
	}
	public double getThur() {
		return thur;
	}
	public void setThur(double thur) {
		this.thur = thur;
	}
	public double getFri() {
		return fri;
	}
	public void setFri(double fri) {
		this.fri = fri;
	}
	public double getSat() {
		return sat;
	}
	public void setSat(double sat) {
		this.sat = sat;
	}
	public double getSun() {
		return sun;
	}
	public void setSun(double sun) {
		this.sun = sun;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}



}
