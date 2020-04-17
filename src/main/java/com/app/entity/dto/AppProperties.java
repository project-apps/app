package com.app.entity.dto;

public enum AppProperties {
	AUTH_USER("authuser"), AUTH_USER_FIRST_LAST_NAME("authUserFirstLastName");
	
	private String value;
	private AppProperties(String value) {
		this.value = value;
	}
	public String value() {
		return value;
	}
}
