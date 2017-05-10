package com.jxtelecom.pds.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author jxtelecom
 * @email jxtelecom@gmail.com
 * @date 2017-05-10 10:37:22
 */
public class ChargeOverdueEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//
	private String userName;
	//
	private String userCode;
	//
	private String address;
	//
	private String city;
	//
	private Float amount;
	//
	private String accountMonth;
	//
	private Date createDate;
	//
	private Long createUserId;

	/**
	 * 设置：
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * 获取：
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * 设置：
	 */
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	/**
	 * 获取：
	 */
	public String getUserCode() {
		return userCode;
	}
	/**
	 * 设置：
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 获取：
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 设置：
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * 获取：
	 */
	public String getCity() {
		return city;
	}
	/**
	 * 设置：
	 */
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	/**
	 * 获取：
	 */
	public Float getAmount() {
		return amount;
	}
	/**
	 * 设置：
	 */
	public void setAccountMonth(String accountMonth) {
		this.accountMonth = accountMonth;
	}
	/**
	 * 获取：
	 */
	public String getAccountMonth() {
		return accountMonth;
	}
	/**
	 * 设置：
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	/**
	 * 获取：
	 */
	public Date getCreateDate() {
		return createDate;
	}
	/**
	 * 设置：
	 */
	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}
	/**
	 * 获取：
	 */
	public Long getCreateUserId() {
		return createUserId;
	}
}
