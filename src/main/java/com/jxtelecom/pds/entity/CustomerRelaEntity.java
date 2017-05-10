package com.jxtelecom.pds.entity;

import com.jxtelecom.pds.utils.excel.annotation.ExcelField;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author jxtelecom
 * @email jxtelecom@gmail.com
 * @date 2017-05-10 16:17:24
 */
public class CustomerRelaEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//客户号码
	private String custTelnum;
	//客户姓名
	private String custName;
	//地市
	private String city;
	//客户经理工号
	private String accountManagerNo;
	//
	private String accountManagerName;

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
	 * 设置：客户号码
	 */
	public void setCustTelnum(String custTelnum) {
		this.custTelnum = custTelnum;
	}
	/**
	 * 获取：客户号码
	 */
	@ExcelField(title = "手机号", align = 2, sort = 10)
	public String getCustTelnum() {
		return custTelnum;
	}
	/**
	 * 设置：客户姓名
	 */
	@ExcelField(title = "用户姓名", align = 2, sort = 20)
	public void setCustName(String custName) {
		this.custName = custName;
	}
	/**
	 * 获取：客户姓名
	 */
	public String getCustName() {
		return custName;
	}
	/**
	 * 设置：地市
	 */
	@ExcelField(title = "地市", align = 2, sort = 30)
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * 获取：地市
	 */
	public String getCity() {
		return city;
	}
	/**
	 * 设置：客户经理工号
	 */
	public void setAccountManagerNo(String accountManagerNo) {
		this.accountManagerNo = accountManagerNo;
	}
	/**
	 * 获取：客户经理工号
	 */
	@ExcelField(title = "客户经理工号", align = 2, sort = 40)
	public String getAccountManagerNo() {
		return accountManagerNo;
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
	@ExcelField(title = "客户经理姓名", align = 2, sort = 50)
	public String getAccountManagerName() {
		return accountManagerName;
	}
}
