package com.jxtelecom.pds.dao;

import com.jxtelecom.pds.entity.SysRoleEntity;

import java.util.List;
import java.util.Map;

/**
 * 角色管理
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年9月18日 上午9:33:33
 */
public interface SysRoleDao extends BaseDao<SysRoleEntity> {
	
	/**
	 * 查询用户创建的角色ID列表
	 */
	List<Long> queryRoleIdList(Long createUserId);

	/**
	 * 根据用户ID查询角色
	 * @param userId
	 * @return
	 */
	List<SysRoleEntity> queryListByUser(Map<String,String> map);
}
