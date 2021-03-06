package com.fh.service.account.accountpayablemx.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.account.AccountPayableMx;
import com.fh.util.PageData;
import com.google.gson.internal.Excluder;
import com.fh.service.account.accountpayablemx.AccountPayableMxManager;

/** 
 * 说明： Account payable(明细)
 * 创建人：SMing
 * 创建时间：2017-02-15
 * @version
 */
@Service("accountpayablemxService")
public class AccountPayableMxService implements AccountPayableMxManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("AccountPayableMxMapper.save", pd);
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveAPMX(AccountPayableMx mx)throws Exception{
		dao.save("AccountPayableMxMapper.saveAPMX", mx);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("AccountPayableMxMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("AccountPayableMxMapper.edit", pd);
	}
	/**
	 * 修改
	 * @param mx
	 * @throws Exception
	 */
	public void edit(AccountPayableMx mx) throws Exception{
		dao.update("AccountPayableMxMapper.edit", mx);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("AccountPayableMxMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("AccountPayableMxMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AccountPayableMxMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("AccountPayableMxMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**查询明细总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCount(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AccountPayableMxMapper.findCount", pd);
	}

	public void batchInsert(List<AccountPayableMx> list) throws Exception {
		dao.batchSave("AccountPayableMxMapper.batchInsert", list);
	}
	
	/**
	 * 明细列表
	 * @param accountpayable_ID
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> mxList (String accountpayable_ID) throws Exception{
		return (List<PageData>)dao.findForList("AccountPayableMxMapper.mxList", accountpayable_ID);
	}
}

