package com.app.entity.dto;

public enum AppProperties {
	AUTH_USER("authuser"), AUTH_USER_FIST_LAST_NAME("authUserFrstLastName");
	
	private String value;
	private AppProperties(String value) {
		this.value = value;
	}
	public String value() {
		return value;
	}
}
