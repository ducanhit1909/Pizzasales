package com.phuocnga.model;

import java.io.Serializable;
import java.util.Map;

public class UserJsonEntity implements Serializable{
	boolean error;
	Map<String, String> errors;

	public UserJsonEntity(boolean error, Map<String, String> errors) {
		super();
		this.error = error;
		this.errors = errors;
	}

	public UserJsonEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public boolean isError() {
		return error;
	}

	public void setError(boolean error) {
		this.error = error;
	}

	public Map<String, String> getErrors() {
		return errors;
	}

	public void setErrors(Map<String, String> errors) {
		this.errors = errors;
	}

}
