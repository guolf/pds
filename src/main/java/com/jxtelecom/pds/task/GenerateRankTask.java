package com.jxtelecom.pds.task;

import com.jxtelecom.pds.service.AccountManagerRankService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 客户经理排名定时任务
 * Created by guolf on 17/5/11.
 */
@Component("generateRankTask")
public class GenerateRankTask {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private AccountManagerRankService accountManagerRankService;

    public void generate() {
        logger.info("客户经理定时任务。。。。开始");
        accountManagerRankService.deleteAll();
        accountManagerRankService.generateRank();
        logger.info("客户经理定时任务。。。。结束");
    }


}
