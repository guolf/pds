package com.jxtelecom.pds.dao;

import com.jxtelecom.pds.entity.TaskEntity;

/**
 * 
 * 
 * @author jxtelecom
 * @email jxtelecom@gmail.com
 * @date 2017-05-10 11:25:19
 */
public interface TaskDao extends BaseDao<TaskEntity> {

    void saveFromAdd(TaskEntity t);
	
}
