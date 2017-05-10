package com.jxtelecom.pds.service;

import com.jxtelecom.pds.entity.ChargeOverdueEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author jxtelecom
 * @email jxtelecom@gmail.com
 * @date 2017-05-10 10:37:22
 */
public interface ChargeOverdueService {
	
	ChargeOverdueEntity queryObject(Long id);
	
	List<ChargeOverdueEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ChargeOverdueEntity chargeOverdue);
	
	void update(ChargeOverdueEntity chargeOverdue);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
