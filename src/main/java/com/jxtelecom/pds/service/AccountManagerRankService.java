package com.jxtelecom.pds.service;

import com.jxtelecom.pds.entity.AccountManagerRankEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author guolf
 * @email guolingfa@gmail.com
 * @date 2017-05-11 13:44:37
 */
public interface AccountManagerRankService {
	
	AccountManagerRankEntity queryObject(Long id);
	
	List<AccountManagerRankEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(AccountManagerRankEntity accountManagerRank);
	
	void update(AccountManagerRankEntity accountManagerRank);
	
	void delete(Long id);

	void deleteAll();

	void deleteBatch(Long[] ids);

	void generateRank();
}
