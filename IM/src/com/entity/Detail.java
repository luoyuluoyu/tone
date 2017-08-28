package com.entity;

public class Detail {
	private String sender;
	private String getter;
	private String sendTime;
	private Integer id;
	private String content;

	public Detail(String sender, String getter, String sendTime, String content) {
		super();
		this.sender = sender;
		this.getter = getter;
		this.sendTime = sendTime;
		this.content = content;
	}

	public Detail(String sender, String getter, String sendTime, Integer id, String content) {
		super();
		this.sender = sender;
		this.getter = getter;
		this.sendTime = sendTime;
		this.id = id;
		this.content = content;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getGetter() {
		return getter;
	}

	public void setGetter(String getter) {
		this.getter = getter;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return getSender()+getSendTime()+"\n"+getContent() ;
	}


}
