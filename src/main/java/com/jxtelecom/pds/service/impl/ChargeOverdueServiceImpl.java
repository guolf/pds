package com.jxtelecom.pds.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.jxtelecom.pds.dao.ChargeOverdueDao;
import com.jxtelecom.pds.entity.ChargeOverdueEntity;
import com.jxtelecom.pds.service.ChargeOverdueService;



@Service("chargeOverdueService")
public class ChargeOverdueServiceImpl implements ChargeOverdueService {
	@Autowired
	private ChargeOverdueDao chargeOverdueDao;
	
	@Override
	public ChargeOverdueEntity queryObject(Long id){
		return chargeOverdueDao.queryObject(id);
	}
	
	@Override
	public List<ChargeOverdueEntity> queryList(Map<String, Object> map){
		return chargeOverdueDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return chargeOverdueDao.queryTotal(map);
	}
	
	@Override
	public void save(ChargeOverdueEntity chargeOverdue){
		chargeOverdueDao.save(chargeOverdue);
	}
	
	@Override
	public void update(ChargeOverdueEntity chargeOverdue){
		chargeOverdueDao.update(chargeOverdue);
	}
	
	@Override
	public void delete(Long id){
		chargeOverdueDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		chargeOverdueDao.deleteBatch(ids);
	}
	
}
