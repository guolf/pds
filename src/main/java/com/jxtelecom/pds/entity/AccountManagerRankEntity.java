package com.jxtelecom.pds.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author guolf
 * @email guolingfa@gmail.com
 * @date 2017-05-11 13:44:37
 */
public class AccountManagerRankEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//
	private Long accountManagerId;
	//
	private String accountManagerName;
	//
	private String city;
	//
	private Integer taskNum;
	//
	private Integer taskSuccessNum;
	//
	private Float taskSuccessRatio;
	//
	private Integer taskFailNum;
	//
	private Float taskFailRatio;
	//
	private Integer taskIncompleteNum;
	//
	private Float taskIncompleteRatio;


	private String  accountDay;

	private Date createDate;

	private Integer rank;

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

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
	public void setAccountManagerId(Long accountManagerId) {
		this.accountManagerId = accountManagerId;
	}
	/**
	 * 获取：
	 */
	public Long getAccountManagerId() {
		return accountManagerId;
	}
	/**
	 * 设置：
	 */
	public void setAccountManagerName(String accountManagerName) {
		this.accountManagerName = accountManagerName;
	}
	/**
	 * 获取：
	 */
	public String getAccountManagerName() {
		return accountManagerName;
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
	public void setTaskNum(Integer taskNum) {
		this.taskNum = taskNum;
	}
	/**
	 * 获取：
	 */
	public Integer getTaskNum() {
		return taskNum;
	}
	/**
	 * 设置：
	 */
	public void setTaskSuccessNum(Integer taskSuccessNum) {
		this.taskSuccessNum = taskSuccessNum;
	}
	/**
	 * 获取：
	 */
	public Integer getTaskSuccessNum() {
		return taskSuccessNum;
	}
	/**
	 * 设置：
	 */
	public void setTaskSuccessRatio(Float taskSuccessRatio) {
		this.taskSuccessRatio = taskSuccessRatio;
	}
	/**
	 * 获取：
	 */
	public Float getTaskSuccessRatio() {
		return taskSuccessRatio;
	}
	/**
	 * 设置：
	 */
	public void setTaskFailNum(Integer taskFailNum) {
		this.taskFailNum = taskFailNum;
	}
	/**
	 * 获取：
	 */
	public Integer getTaskFailNum() {
		return taskFailNum;
	}
	/**
	 * 设置：
	 */
	public void setTaskFailRatio(Float taskFailRatio) {
		this.taskFailRatio = taskFailRatio;
	}
	/**
	 * 获取：
	 */
	public Float getTaskFailRatio() {
		return taskFailRatio;
	}
	/**
	 * 设置：
	 */
	public void setTaskIncompleteNum(Integer taskIncompleteNum) {
		this.taskIncompleteNum = taskIncompleteNum;
	}
	/**
	 * 获取：
	 */
	public Integer getTaskIncompleteNum() {
		return taskIncompleteNum;
	}
	/**
	 * 设置：
	 */
	public void setTaskIncompleteRatio(Float taskIncompleteRatio) {
		this.taskIncompleteRatio = taskIncompleteRatio;
	}
	/**
	 * 获取：
	 */
	public Float getTaskIncompleteRatio() {
		return taskIncompleteRatio;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public void setAccountDay(String accountDay) {
		this.accountDay = accountDay;
	}

	public String getAccountDay() {
		return accountDay;
	}
}
