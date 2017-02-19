package com.fh.service.account.accountreceiptablemx;

import java.util.List;
import com.fh.entity.Page;
import com.fh.entity.account.AccountReceiptable;
import com.fh.entity.account.AccountReceiptableMx;
import com.fh.util.PageData;

/** 
 * 说明： Account Receiptable(明细)接口
 * 创建人：SMing
 * 创建时间：2017-02-18
 * @version
 */
public interface AccountReceiptableMxManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**新增
	 * @param arMx
	 * @throws Exception
	 */
	public void saveArMx(AccountReceiptableMx arMx)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	/**
	 * 不做实际删除,只是修改明细表的主表 ID
	 * @param zhubiao_ID
	 * @throws Exception
	 */
	public void deleteAll(String zhubiao_ID) throws Exception;
	
	/**查询明细总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCount(PageData pd)throws Exception;
	
	/**
	 * 明细列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> mxList (String accountreceiptable_ID) throws Exception;
	
}

