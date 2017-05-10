package com.jxtelecom.pds.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.jxtelecom.pds.admin.AbstractController;
import com.jxtelecom.pds.entity.ChargeOverdueEntity;
import com.jxtelecom.pds.utils.RRException;
import com.jxtelecom.pds.utils.excel.ImportExcel;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jxtelecom.pds.entity.CustomerRelaEntity;
import com.jxtelecom.pds.service.CustomerRelaService;
import com.jxtelecom.pds.utils.PageUtils;
import com.jxtelecom.pds.utils.Query;
import com.jxtelecom.pds.utils.R;
import org.springframework.web.multipart.MultipartFile;


/**
 *
 * 客户经理-客户关联表
 * @author guolf
 * @email guolingfa@gmail.com
 * @date 2017-05-10 16:17:24
 */
@RestController
@RequestMapping("customerrela")
public class CustomerRelaController extends AbstractController {
	@Autowired
	private CustomerRelaService customerRelaService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("customerrela:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<CustomerRelaEntity> customerRelaList = customerRelaService.queryList(query);
		int total = customerRelaService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(customerRelaList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("customerrela:info")
	public R info(@PathVariable("id") Long id){
		CustomerRelaEntity customerRela = customerRelaService.queryObject(id);
		
		return R.ok().put("customerRela", customerRela);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("customerrela:save")
	public R save(@RequestBody CustomerRelaEntity customerRela){
		customerRelaService.save(customerRela);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("customerrela:update")
	public R update(@RequestBody CustomerRelaEntity customerRela){
		customerRelaService.update(customerRela);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("customerrela:delete")
	public R delete(@RequestBody Long[] ids){
		customerRelaService.deleteBatch(ids);
		
		return R.ok();
	}



	/**
	 * 上传文件
	 */
	@RequestMapping("/upload")
	@RequiresPermissions("chargeoverdue:upload")
	public R upload(@RequestParam("file") MultipartFile file) throws Exception {
		if (file.isEmpty()) {
			throw new RRException("上传文件不能为空");
		}
		try {
			ImportExcel ei = new ImportExcel(file, 0, 2);
			List<CustomerRelaEntity> list = ei.getDataList(CustomerRelaEntity.class);
			for (CustomerRelaEntity user : list) {
				customerRelaService.save(user);
			}

			return R.ok();
		} catch (Exception e) {
			return R.error("导入失败！失败信息：" + e.getMessage());
		}
	}
	
}
