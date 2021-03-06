package com.fh.service.account.accountpayablemx;

import java.util.List;
import com.fh.entity.Page;
import com.fh.entity.account.AccountPayableMx;
import com.fh.util.PageData;

/** 
 * 说明： Account payable(明细)接口
 * 创建人：SMing
 * 创建时间：2017-02-15
 * @version
 */
public interface AccountPayableMxManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**新增
	 * @param mx
	 * @throws Exception
	 */
	public void saveAPMX(AccountPayableMx mx)throws Exception;
	
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
	
	/**
	 * 修改
	 * @param mx
	 * @throws Exception
	 */
	public void edit(AccountPayableMx mx) throws Exception;
	
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
	
	/**查询明细总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCount(PageData pd)throws Exception;
	
	/**
	 * 批量添加
	 * @param list
	 * @throws Exception
	 */
	public void batchInsert(List<AccountPayableMx> list) throws Exception;
	/**
	 * 明细列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> mxList (String accountpayable_ID) throws Exception;
	
}

