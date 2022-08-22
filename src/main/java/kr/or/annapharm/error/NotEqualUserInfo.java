package kr.or.annapharm.error;

public class NotEqualUserInfo extends Exception{
	public NotEqualUserInfo() {
		super("정보를 다시 입력해주세요!");
	}
}
