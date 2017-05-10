package com.jxtelecom.pds.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.jxtelecom.pds.dao.CustomerRelaDao;
import com.jxtelecom.pds.entity.CustomerRelaEntity;
import com.jxtelecom.pds.service.CustomerRelaService;



@Service("customerRelaService")
public class CustomerRelaServiceImpl implements CustomerRelaService {
	@Autowired
	private CustomerRelaDao customerRelaDao;
	
	@Override
	public CustomerRelaEntity queryObject(Long id){
		return customerRelaDao.queryObject(id);
	}
	
	@Override
	public List<CustomerRelaEntity> queryList(Map<String, Object> map){
		return customerRelaDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return customerRelaDao.queryTotal(map);
	}
	
	@Override
	public void save(CustomerRelaEntity customerRela){
		customerRelaDao.save(customerRela);
	}
	
	@Override
	public void update(CustomerRelaEntity customerRela){
		customerRelaDao.update(customerRela);
	}
	
	@Override
	public void delete(Long id){
		customerRelaDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		customerRelaDao.deleteBatch(ids);
	}
	
}
