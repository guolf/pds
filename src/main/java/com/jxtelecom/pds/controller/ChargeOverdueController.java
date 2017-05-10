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

import com.jxtelecom.pds.entity.ChargeOverdueEntity;
import com.jxtelecom.pds.service.ChargeOverdueService;
import com.jxtelecom.pds.utils.PageUtils;
import com.jxtelecom.pds.utils.Query;
import com.jxtelecom.pds.utils.R;


/**
 * 
 * 用户缴费管理
 * @author guolf
 * @email guolingfa@gmail.com
 * @date 2017-05-10 10:37:22
 */
@RestController
@RequestMapping("chargeoverdue")
public class ChargeOverdueController {
	@Autowired
	private ChargeOverdueService chargeOverdueService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("chargeoverdue:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ChargeOverdueEntity> chargeOverdueList = chargeOverdueService.queryList(query);
		int total = chargeOverdueService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(chargeOverdueList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("chargeoverdue:info")
	public R info(@PathVariable("id") Long id){
		ChargeOverdueEntity chargeOverdue = chargeOverdueService.queryObject(id);
		
		return R.ok().put("chargeOverdue", chargeOverdue);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("chargeoverdue:save")
	public R save(@RequestBody ChargeOverdueEntity chargeOverdue){
		chargeOverdueService.save(chargeOverdue);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("chargeoverdue:update")
	public R update(@RequestBody ChargeOverdueEntity chargeOverdue){
		chargeOverdueService.update(chargeOverdue);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("chargeoverdue:delete")
	public R delete(@RequestBody Long[] ids){
		chargeOverdueService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
