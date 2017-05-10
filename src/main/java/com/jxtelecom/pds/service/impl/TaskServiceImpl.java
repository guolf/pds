package com.jxtelecom.pds.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.jxtelecom.pds.dao.TaskDao;
import com.jxtelecom.pds.entity.TaskEntity;
import com.jxtelecom.pds.service.TaskService;



@Service("taskService")
public class TaskServiceImpl implements TaskService {
	@Autowired
	private TaskDao taskDao;
	
	@Override
	public TaskEntity queryObject(Long id){
		return taskDao.queryObject(id);
	}
	
	@Override
	public List<TaskEntity> queryList(Map<String, Object> map){
		return taskDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return taskDao.queryTotal(map);
	}
	
	@Override
	public void save(TaskEntity task){
		taskDao.save(task);
	}
	
	@Override
	public void update(TaskEntity task){
		taskDao.update(task);
	}
	
	@Override
	public void delete(Long id){
		taskDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		taskDao.deleteBatch(ids);
	}
	
}
