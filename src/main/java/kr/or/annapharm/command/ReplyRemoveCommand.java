package kr.or.annapharm.command;

public class ReplyRemoveCommand {
	private String rno;
	private String bno;
	private String page;
	
	public void setPage(String page) {
		this.page = page;
	}
	public void setRno(String rno) {
		this.rno = rno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public int getPage() {
		return Integer.parseInt(page);
	}
	public int getRno() {
		return Integer.parseInt(rno);
	}
	public int getBno() {
		return Integer.parseInt(bno);
	}
}
