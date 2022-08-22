package kr.or.annapharm.command;

import kr.or.annapharm.dto.RetrieveVO;

public class RetrieveCommand extends RetrieveVO{
	private String rlName;
	private int rlCount;
	private String memName;

	public String getRlName() {
		return rlName;
	}
	public void setRlName(String rlName) {
		this.rlName = rlName;
	}
	public int getRlCount() {
		return rlCount;
	}
	public void setRlCount(int rlCount) {
		this.rlCount = rlCount;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	@Override
	public String toString() {
		return "RetrieveCommand [rlName=" + rlName + ", rlCount=" + rlCount + ", memName=" + memName + "]";
	}

}
