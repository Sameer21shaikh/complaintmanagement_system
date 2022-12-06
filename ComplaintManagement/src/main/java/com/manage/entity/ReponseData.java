package com.manage.entity;

public class ReponseData<T> {
	private T data;
	public ReponseData(T data, String message) {
		super();
		this.data = data;
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "ReponseData [data=" + data + ", message=" + message + "]";
	}

	public ReponseData(String message) {
		super();
		this.message = message;
	}

}
