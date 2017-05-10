package com.jxtelecom.pds.service;

import com.jxtelecom.pds.entity.TaskEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author jxtelecom
 * @email jxtelecom@gmail.com
 * @date 2017-05-10 11:25:19
 */
public interface TaskService {
	
	TaskEntity queryObject(Long id);
	
	List<TaskEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TaskEntity task);
	
	void update(TaskEntity task);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
