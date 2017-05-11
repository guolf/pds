package com.jxtelecom.pds.dao;

import com.jxtelecom.pds.entity.AccountManagerRankEntity;

/**
 * 
 * 
 * @author guolf
 * @email guolingfa@gmail.com
 * @date 2017-05-11 13:44:37
 */
public interface AccountManagerRankDao extends BaseDao<AccountManagerRankEntity> {

    void deleteAll();

    void generateRank();
	
}
