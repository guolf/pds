package com.jxtelecom.pds.controller;

import com.jxtelecom.pds.admin.AbstractController;
import com.jxtelecom.pds.entity.SysRoleEntity;
import com.jxtelecom.pds.entity.SysUserEntity;
import com.jxtelecom.pds.entity.TaskEntity;
import com.jxtelecom.pds.service.TaskService;
import com.jxtelecom.pds.utils.PageUtils;
import com.jxtelecom.pds.utils.Query;
import com.jxtelecom.pds.utils.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


/**
 * @author jxtelecom
 * @email jxtelecom@gmail.com
 * @date 2017-05-10 11:25:19
 */
@RestController
@RequestMapping("task")
public class TaskController extends AbstractController {
    @Autowired
    private TaskService taskService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("task:list")
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据

        SysUserEntity user = getUser();
        List<SysRoleEntity> sysRoleEntityList = user.getRoleEntities();
        if (sysRoleEntityList == null || (sysRoleEntityList.size() == 1 && sysRoleEntityList.get(0).getRoleName().equals("客户经理"))) {
            params.put("isAdmin", '0');
        } else {
            params.put("isAdmin", '1');
        }
        // status == 1 => 已完成
        // status == 0 => 已完成
        params.put("userId",getUserId());
        Query query = new Query(params);
        List<TaskEntity> taskList = taskService.queryList(query);
        int total = taskService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(taskList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("task:info")
    public R info(@PathVariable("id") Long id) {
        TaskEntity task = taskService.queryObject(id);

        return R.ok().put("task", task);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("task:save")
    public R save(@RequestBody TaskEntity task) {
        taskService.save(task);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("task:update")
    public R update(@RequestBody TaskEntity task) {
        taskService.update(task);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("task:delete")
    public R delete(@RequestBody Long[] ids) {
        taskService.deleteBatch(ids);

        return R.ok();
    }

}
