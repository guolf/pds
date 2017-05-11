package com.jxtelecom.pds.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jxtelecom.pds.entity.AccountManagerRankEntity;
import com.jxtelecom.pds.service.AccountManagerRankService;
import com.jxtelecom.pds.utils.PageUtils;
import com.jxtelecom.pds.utils.Query;
import com.jxtelecom.pds.utils.R;


/**
 * 
 * 
 * @author guolf
 * @email guolingfa@gmail.com
 * @date 2017-05-11 13:44:37
 */
@RestController
@RequestMapping("accountmanagerrank")
public class AccountManagerRankController {
	@Autowired
	private AccountManagerRankService accountManagerRankService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("accountmanagerrank:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<AccountManagerRankEntity> accountManagerRankList = accountManagerRankService.queryList(query);
		int total = accountManagerRankService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(accountManagerRankList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
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
