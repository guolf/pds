package com.jxtelecom.pds.service;

import com.jxtelecom.pds.entity.CustomerRelaEntity;

import java.util.List;
import java.util.Map;

/**
 *
 *
 * @author guolf
 * @email guolingfa@gmail.com
 * @date 2017-05-10 16:17:24
 */
public interface CustomerRelaService {
	
	CustomerRelaEntity queryObject(Long id);
	
	List<CustomerRelaEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(CustomerRelaEntity customerRela);
	
	void update(CustomerRelaEntity customerRela);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
