package com.manage.entity;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;

public class Support {
	@Enumerated(EnumType.STRING)
	private ResponceStatus status;
	private String comments;

	public Support() {
		super();
	}

	public Support(ResponceStatus status, String comments) {
		super();
		this.status = status;
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "Support [status=" + status + ", comments=" + comments + "]";
	}

	public ResponceStatus getStatus() {
		return status;
	}

	public void setStatus(ResponceStatus status) {
		this.status = status;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getComments() {
		return comments;
	}

}
