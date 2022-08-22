package kr.or.annapharm.command;

import java.util.List;
import java.util.Map;

public class ReceiveOrderCommand {
	private List<Map<String,Object>> arr;

	public List<Map<String, Object>> getArr() {
		return arr;
	}

	public void setArr(List<Map<String, Object>> arr) {
		this.arr = arr;
	}

	@Override
	public String toString() {
		return "ReceiveOrderCommand [arr=" + arr + ", getArr()=" + getArr() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	
	
	
}
