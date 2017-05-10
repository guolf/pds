package com.jxtelecom.pds.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author jxtelecom
 * @email jxtelecom@gmail.com
 * @date 2017-05-10 11:25:19
 */
public class TaskEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//
	private Date createDate;
	//
	private Long createUserId;
	//
	private Long chargeId;
	//
	private String result;
	//
	private String remark;

	// 欠费用户名
	private String userName;

	// 任务创建人
	private String createUserName;
	// 客户经理工号
	private String accountManagerNo;

	// 客户经理姓名
	private String accountManagerName;

	public String getAccountManagerNo() {
		return accountManagerNo;
	}

	public void setAccountManagerNo(String accountManagerNo) {
		this.accountManagerNo = accountManagerNo;
	}

	public String getCreateUserName() {
		return createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
	/**
	 * 设置：
	 */
	public void setChargeId(Long chargeId) {
		this.chargeId = chargeId;
	}
	/**
	 * 获取：
	 */
	public Long getChargeId() {
		return chargeId;
	}
	/**
	 * 设置：
	 */
	public void setResult(String result) {
		this.result = result;
	}
	/**
	 * 获取：
	 */
	public String getResult() {
		return result;
	}
	/**
	 * 设置：
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 获取：
	 */
	public String getRemark() {
		return remark;
	}

	public TaskEntity convert(ChargeOverdueEntity entity){
		this.setChargeId(entity.getId());
		this.setCreateDate(new Date());
		return this;
	}
}
