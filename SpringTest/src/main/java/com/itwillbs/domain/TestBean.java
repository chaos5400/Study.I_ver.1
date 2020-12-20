package com.itwillbs.domain;

public class TestBean {
	private String name;
	private String tel;
	private int age;
	
	public TestBean() {}
	public TestBean(String name,String tel,int age) {
		this.name = name;
		this.tel = tel;
		this.age = age;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
	@Override
	public String toString() {
		return "ITWILLBean [name=" + name + ", tel=" + tel + ", age=" + age + "]";
	}
}
