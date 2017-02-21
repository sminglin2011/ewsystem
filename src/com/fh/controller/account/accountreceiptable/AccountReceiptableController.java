package com.fh.controller.account.accountreceiptable;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.account.AccountPayable;
import com.fh.entity.account.AccountPayableMx;
import com.fh.entity.account.AccountReceiptable;
import com.fh.entity.account.AccountReceiptableMx;
import com.fh.util.AppUtil;
import com.fh.util.JsonView;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.account.accountreceiptable.AccountReceiptableManager;
import com.fh.service.account.accountreceiptablemx.AccountReceiptableMxManager;

/** 
 * 说明：Account Receiptable
 * 创建人：SMing
 * 创建时间：2017-02-18
 */
@Controller
@RequestMapping(value="/accountreceiptable")
public class AccountReceiptableController extends BaseController {
	
	String menuUrl = "accountreceiptable/list.do"; //菜单地址(权限用)
	@Resource(name="accountreceiptableService")
	private AccountReceiptableManager accountreceiptableService;
	
	@Resource(name="accountreceiptablemxService")
	private AccountReceiptableMxManager accountreceiptablemxService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增AccountReceiptable");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("accountreceiptable_ID", this.get32UUID());	//主键
		pd.put("debitor", "");	//Debitor
		pd.put("gl_status", "O");	//GL Status
		accountreceiptableService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	//------------------- Save Object --------------------------------------------------------
	/**
	 * 保存 angular AJAX
	 * @param response
	 * @param ar
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
    @RequestMapping(value = "/saveAr", method = RequestMethod.POST)
    public Object saveAccountPayable(HttpServletResponse response, @RequestBody AccountReceiptable ar) throws Exception { //ResponseEntity<Object>
    	System.out.println("coming saving controller");
    	ModelAndView mv = this.getModelAndView();
		System.out.println("ar =========== " + ar);
		List<AccountReceiptableMx> list = ar.getMx();
		
		if(ar.getAccountreceiptable_ID() != null) { // 修改情况下
			accountreceiptableService.editAR(ar);
			for(AccountReceiptableMx mx : list) {
				if(mx.getAccountreceiptablemx_ID().length()<32 && !Tools.isEmpty(mx.getSales_type())) {
					mx.setAccountreceiptable_ID(ar.getAccountreceiptable_ID());
					mx.setAccountreceiptablemx_ID(get32UUID());
					accountreceiptablemxService.saveArMx(mx);
				} else if(mx.getAccountreceiptablemx_ID().length() == 32 && !Tools.isEmpty(mx.getSales_type())) {
					accountreceiptablemxService.edit(mx);
				}
			}
		} else { //  新建情况下
			ar.setAccountreceiptable_ID(get32UUID());
			accountreceiptableService.saveAr(ar);
			for(AccountReceiptableMx mx : list) {
				if(mx.getSales_type() != null && !mx.getSales_type().equals("")) {
					mx.setAccountreceiptable_ID(ar.getAccountreceiptable_ID());
					mx.setAccountreceiptablemx_ID(get32UUID());
					accountreceiptablemxService.saveArMx(mx);
				}
			}
		}
		return JsonView.Render(mv, response);
    }
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除AccountReceiptable");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null ;} //校验权限
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "success";
		if(Integer.parseInt(accountreceiptablemxService.findCount(pd).get("zs").toString()) > 0){
			errInfo = "false";
		}else{
			accountreceiptableService.delete(pd);
		}
		map.put("result", errInfo);
//		return AppUtil.returnObject(new PageData(), map);
		return JsonView.Render(map, response);
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改AccountReceiptable");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		accountreceiptableService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表AccountReceiptable");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = accountreceiptableService.list(page);	//列出AccountReceiptable列表
		mv.setViewName("account/accountreceiptable/accountreceiptable_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	//-------------------Retrieve All Objects--------------------------------------------------------
	/**
	 * 列表 angular AJAX
	 * @param page
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/listSvc")
	public Object listSvc(Page page, HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表AccountReceiptable");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = accountreceiptableService.listAll(pd);	//列出AccountReceiptable列表
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return JsonView.Render(mv, response);
	}
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("account/accountreceiptable/accountreceiptable_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = accountreceiptableService.findById(pd);	//根据ID读取
		mv.setViewName("account/accountreceiptable/accountreceiptable_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	//-------------------Retrieve One Objects--------------------------------------------------------
	/**
	 * 获取 AR 对象 angular AJAX
	 * @param page
	 * @param response
	 * @param object_ID
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/listSvc/{accountreceiptable_ID}")
	public Object getObjectById(Page page, HttpServletResponse response, 
			@PathVariable("accountreceiptable_ID") String object_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取 Account receiptable 单个对象");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("accountreceiptable_ID", object_ID);
		pd = accountreceiptableService.findById(pd);	//返回 Object
		page.setPd(pd);
		List<PageData> mx = accountreceiptablemxService.mxList(object_ID);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC()); //按钮权限
		mv.addObject("mx", mx);
		return JsonView.Render(mv, response);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出AccountReceiptable到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("AR Number");	//1
		titles.add("Customr ID");	//2
		titles.add("Customer Name");	//3
		titles.add("Debitor");	//4
		titles.add("Date");	//5
		titles.add("Terms");	//6
		titles.add("GL Status");	//7
		dataMap.put("titles", titles);
		List<PageData> varOList = accountreceiptableService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ar_number"));	    //1
			vpd.put("var2", varOList.get(i).getString("customer_id"));	    //2
			vpd.put("var3", varOList.get(i).getString("customer_name"));	    //3
			vpd.put("var4", varOList.get(i).getString("debitor"));	    //4
			vpd.put("var5", varOList.get(i).getString("date"));	    //5
			vpd.put("var6", varOList.get(i).getString("terms"));	    //6
			vpd.put("var7", varOList.get(i).getString("gl_status"));	    //7
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	//------------------- Receipt --------------------------------------------------------
	
	
}
