package com.jxtelecom.pds.controller;

import com.jxtelecom.pds.admin.AbstractController;
import com.jxtelecom.pds.entity.ChargeOverdueEntity;
import com.jxtelecom.pds.service.ChargeOverdueService;
import com.jxtelecom.pds.utils.PageUtils;
import com.jxtelecom.pds.utils.Query;
import com.jxtelecom.pds.utils.R;
import com.jxtelecom.pds.utils.RRException;
import com.jxtelecom.pds.utils.excel.ImportExcel;
import com.jxtelecom.pds.utils.validator.ValidatorUtils;
import com.jxtelecom.pds.utils.validator.group.AddGroup;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.ConstraintViolationException;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * 用户缴费管理
 *
 * @author guolf
 * @email guolingfa@gmail.com
 * @date 2017-05-10 10:37:22
 */
@RestController
@RequestMapping("chargeoverdue")
public class ChargeOverdueController extends AbstractController {
    @Autowired
    private ChargeOverdueService chargeOverdueService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("chargeoverdue:list")
    public R list(@RequestParam Map<String, Object> params) {
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
    public R info(@PathVariable("id") Long id) {
        ChargeOverdueEntity chargeOverdue = chargeOverdueService.queryObject(id);

        return R.ok().put("chargeOverdue", chargeOverdue);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("chargeoverdue:save")
    public R save(@RequestBody ChargeOverdueEntity chargeOverdue) {
        chargeOverdueService.save(chargeOverdue);

        return R.ok();
    }

    /**
     * 上传文件
     */
    @RequestMapping("/upload")
    @RequiresPermissions("chargeoverdue:save")
    public R upload(@RequestParam("file") MultipartFile file) throws Exception {
        if (file.isEmpty()) {
            throw new RRException("上传文件不能为空");
        }

        try {
            ImportExcel ei = new ImportExcel(file, 0, 1);
            List<ChargeOverdueEntity> list = ei.getDataList(ChargeOverdueEntity.class);
            for (ChargeOverdueEntity user : list) {
//                ValidatorUtils.validateEntity(user, AddGroup.class);
                user.setCreateDate(new Date());
                user.setCreateUserId(getUserId());
                chargeOverdueService.save(user);
            }

            return R.ok();
        } catch (Exception e) {
            return R.error("导入失败！失败信息：" + e.getMessage());
        }
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("chargeoverdue:update")
    public R update(@RequestBody ChargeOverdueEntity chargeOverdue) {
        chargeOverdueService.update(chargeOverdue);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("chargeoverdue:delete")
    public R delete(@RequestBody Long[] ids) {
        chargeOverdueService.deleteBatch(ids);

        return R.ok();
    }

}
