package com.jxtelecom.pds.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Lists;
import com.jxtelecom.pds.utils.excel.annotation.ExportExcel;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.jxtelecom.pds.entity.AccountManagerRankEntity;
import com.jxtelecom.pds.service.AccountManagerRankService;
import com.jxtelecom.pds.utils.PageUtils;
import com.jxtelecom.pds.utils.Query;
import com.jxtelecom.pds.utils.R;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 
 * 
 * @author guolf
 * @email guolingfa@gmail.com
 * @date 2017-05-11 13:44:37
 */
@Controller
@RequestMapping("accountmanagerrank")
public class AccountManagerRankController {
	@Autowired
	private AccountManagerRankService accountManagerRankService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("accountmanagerrank:list")
	public @ResponseBody
	R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<AccountManagerRankEntity> accountManagerRankList = accountManagerRankService.queryList(query);
		int total = accountManagerRankService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(accountManagerRankList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	@RequestMapping(value = "/exportExcel")
	public String importFileTemplate(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
			Map<String, Object> params = new HashMap();
			params.put("page",1);
			params.put("limit",30000);
			Query query = new Query(params);

			String fileName = "客户经理排行报表.xlsx";
			List<AccountManagerRankEntity> accountManagerRankList = accountManagerRankService.queryList(query);
			new ExportExcel("客户经理排行报表", AccountManagerRankEntity.class, 2).setDataList(accountManagerRankList).write(response, fileName).dispose();
			return null;
		} catch (Exception e) {
			System.out.println("e = " + e);
		}
		return null;
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("accountmanagerrank:info")
	public R info(@PathVariable("id") Long id){
		AccountManagerRankEntity accountManagerRank = accountManagerRankService.queryObject(id);
		
		return R.ok().put("accountManagerRank", accountManagerRank);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("accountmanagerrank:save")
	public R save(@RequestBody AccountManagerRankEntity accountManagerRank){
		accountManagerRankService.save(accountManagerRank);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("accountmanagerrank:update")
	public R update(@RequestBody AccountManagerRankEntity accountManagerRank){
		accountManagerRankService.update(accountManagerRank);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("accountmanagerrank:delete")
	public R delete(@RequestBody Long[] ids){
		accountManagerRankService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
