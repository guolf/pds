package com.jxtelecom.pds.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.jxtelecom.pds.dao.AccountManagerRankDao;
import com.jxtelecom.pds.entity.AccountManagerRankEntity;
import com.jxtelecom.pds.service.AccountManagerRankService;



@Service("accountManagerRankService")
public class AccountManagerRankServiceImpl implements AccountManagerRankService {
	@Autowired
	private AccountManagerRankDao accountManagerRankDao;
	
	@Override
	public AccountManagerRankEntity queryObject(Long id){
		return accountManagerRankDao.queryObject(id);
	}
	
	@Override
	public List<AccountManagerRankEntity> queryList(Map<String, Object> map){
		return accountManagerRankDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return accountManagerRankDao.queryTotal(map);
	}
	
	@Override
	public void save(AccountManagerRankEntity accountManagerRank){
		accountManagerRankDao.save(accountManagerRank);
	}
	
	@Override
	public void update(AccountManagerRankEntity accountManagerRank){
		accountManagerRankDao.update(accountManagerRank);
	}
	
	@Override
	public void delete(Long id){
		accountManagerRankDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		accountManagerRankDao.deleteBatch(ids);
	}

	@Override
	public void generateRank() {
		accountManagerRankDao.generateRank();
	}

	@Override
	public void deleteAll() { accountManagerRankDao.deleteAll();}
}
