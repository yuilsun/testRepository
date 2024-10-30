package com.kh.git.board.member;

public class Member {
	
	String title;
	 int age;
	 String subject;
	public Member(String title, int age, String subject) {
		super();
		this.title = title;
		this.age = age;
		this.subject = subject;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	@Override
	public String toString() {
		return "Member [title=" + title + ", age=" + age + ", subject=" + subject + "]";
	}
	 
	 

}
