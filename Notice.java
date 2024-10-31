package com.kh.git.board.notice;

public class Notice {

	private String tltle;
	private String subject;
	private int age;

	public Notice(String tltle, String subject, int age) {
		super();
		this.tltle = tltle;
		this.subject = subject;
		this.age = age;
	}

	public String getTltle() {
		return tltle;
	}

	public void setTltle(String tltle) {
		this.tltle = tltle;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "Notice [tltle=" + tltle + ", subject=" + subject + ", age=" + age + "]";
	}

}
