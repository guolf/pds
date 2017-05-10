package com.jxtelecom.pds.entity;

import com.jxtelecom.pds.utils.excel.annotation.ExcelField;
import com.jxtelecom.pds.utils.validator.group.AddGroup;
import org.hibernate.validator.constraints.NotBlank;

import java.io.Serializable;
import java.util.Date;


/**
 * @author jxtelecom
 * @email jxtelecom@gmail.com
 * @date 2017-05-10 10:37:22
 */
public class ChargeOverdueEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Long id;
    // 手机号码
    private String userName;
    // 手机号码
    private String userCode;
    // 地址
    private String address;
    // 地市
    private String city;
    // 欠费金额
    private Float amount;
    // 账期
    private String accountMonth;
    // 创建时间
    private Date createDate;
    // 创建人
    private Long createUserId;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @ExcelField(title = "用户姓名", align = 2, sort = 10)
    @NotBlank(message="用户姓名不能为空", groups = AddGroup.class)
    public String getUserName() {
        return userName;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    @ExcelField(title = "手机号", align = 2, sort = 20)
    @NotBlank(message="手机号不能为空", groups = AddGroup.class)
    public String getUserCode() {
        return userCode;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @ExcelField(title = "地址", align = 2, sort = 30)
    public String getAddress() {
        return address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @ExcelField(title = "地市", align = 2, sort = 40)
    public String getCity() {
        return city;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    @ExcelField(title = "欠费金额", align = 2, sort = 50)
    @NotBlank(message="欠费金额不能为空", groups = AddGroup.class)
    public Float getAmount() {
        return amount;
    }

    public void setAccountMonth(String accountMonth) {
        this.accountMonth = accountMonth;
    }

    @ExcelField(title = "账期", align = 2, sort = 60)
    @NotBlank(message="账期不能为空", groups = AddGroup.class)
    public String getAccountMonth() {
        return accountMonth;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateUserId(Long createUserId) {
        this.createUserId = createUserId;
    }

    public Long getCreateUserId() {
        return createUserId;
    }
}
