package com.kh.doit.event.model.vo;

import org.springframework.stereotype.Component;

@Component
public class HashTag {
	
	private String tagName;

	public HashTag() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HashTag(String tagName) {
		super();
		this.tagName = tagName;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	@Override
	public String toString() {
		return "HashTag [tagName=" + tagName + "]";
	}
	
	

}
