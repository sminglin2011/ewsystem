package com.fh.service.system.accountnumberctrl.impl;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.fh.service.system.accountnumberctrl.AccountNumberCtrlManager;

/** 
 * 说明： ACCOUNT NUMBER CONTROL
 * 创建人：SMing
 * 创建时间：2017-02-15
 * @version
 */
@Service("accountnumberctrlService")
public class AccountNumberCtrlService implements AccountNumberCtrlManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("AccountNumberCtrlMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("AccountNumberCtrlMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("AccountNumberCtrlMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("AccountNumberCtrlMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("AccountNumberCtrlMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AccountNumberCtrlMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("AccountNumberCtrlMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * get next AR number
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String getARNextNumber(PageData pd) throws Exception {
		if(pd.get("YEAR") == null)
			pd.put("YEAR", new Date().getYear());
		if(pd.get("PREFIX") == null)
			pd.put("PREFIX", Const.AR_PREFIX);
		pd = (PageData)dao.findForObject("AccountNumberCtrlMapper.getNextNumber", pd);
		
		if(pd.get("NEXT_NO") == null)
			pd.put("NEXT_NO", 0);
		if (pd.get("NEXT_NO").equals("0")) {
			dao.save("AccountNumberCtrlMapper.save", pd);
		} else {
			pd.put("NEXT_NO", Integer.parseInt(pd.get("NEXT_NO").toString())+1); // 加 1 
			dao.update("AccountNumberCtrlMapper.edit", pd);
		}
		return appendNO(pd);
	}
	
	/**
	 * get next AP number
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String getAPNextNumber(PageData pd) throws Exception {
		if(pd.get("YEAR") == null)
			pd.put("YEAR", new Date().getYear());
		if(pd.get("PREFIX") == null)
			pd.put("PREFIX", Const.AP_PREFIX);
		Object o = dao.findForObject("AccountNumberCtrlMapper.getNextNumber", pd);
		if (o == null) {
			pd.put("NEXT_NO", 0);
			dao.save("AccountNumberCtrlMapper.save", pd);
		} else {
			pd.put("NEXT_NO", Integer.parseInt(pd.get("NEXT_NO").toString())+1); // 加 1 
			dao.update("AccountNumberCtrlMapper.edit", pd);
		}
		return appendNO(pd);
	}
	
	/**
	 * 拼接 number
	 * @param pd
	 * @return
	 */
	protected String appendNO(PageData pd) {
		String year = pd.get("YEAR").toString();
		String prefix = pd.get("PREFIX").toString();
		String next_no = pd.get("NEXT_NO").toString();
		String no = prefix + year + next_no;
		return no;
	}
}

