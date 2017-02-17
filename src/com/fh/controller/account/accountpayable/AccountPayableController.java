package com.fh.controller.account.accountpayable;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.account.AccountPayable;
import com.fh.util.AppUtil;
import com.fh.util.JsonView;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.account.accountpayable.AccountPayableManager;
import com.fh.service.account.accountpayablemx.AccountPayableMxManager;
import com.fh.service.system.accountnumberctrl.impl.AccountNumberCtrlService;

/** 
 * 说明：Account payable
 * 创建人：SMing
 * 创建时间：2017-02-15
 */
@Controller
@RequestMapping(value="/accountpayable")
public class AccountPayableController extends BaseController {
	
	String menuUrl = "accountpayable/list.do"; //菜单地址(权限用)
	@Resource(name="accountpayableService")
	private AccountPayableManager accountpayableService;
	
	@Resource(name="accountpayablemxService")
	private AccountPayableMxManager accountpayablemxService;
	
	@Resource(name="accountnumberctrlService")
	private AccountNumberCtrlService noCtrlSvc;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增AccountPayable");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 测试用
		for(int i=0; i<2; i++) {
			pd.put("ACCOUNTNUMBERCTRL_ID", this.get32UUID());
			pd.put("ACCOUNTPAYABLE_ID", this.get32UUID());	//主键
			accountpayableService.save(pd);
		}
		
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除AccountPayable");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null ;} //校验权限
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "success";
		if(Integer.parseInt(accountpayablemxService.findCount(pd).get("zs").toString()) > 0){
			errInfo = "false";
		}else{
			accountpayableService.delete(pd);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改AccountPayable");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		accountpayableService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表AccountPayable");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = accountpayableService.list(page);	//列出AccountPayable列表
		mv.setViewName("account/accountpayable/accountpayable_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
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
		mv.setViewName("account/accountpayable/accountpayable_edit");
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
		pd = accountpayableService.findById(pd);	//根据ID读取
		mv.setViewName("account/accountpayable/accountpayable_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出AccountPayable到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("AP Number");	//1
		titles.add("Supplier Name");	//2
		titles.add("Supplier Name");	//3
		titles.add("Date");	//4
		titles.add("Terms");	//5
		titles.add("Vender Invoice");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = accountpayableService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("AP_NUNBER"));	    //1
			vpd.put("var2", varOList.get(i).getString("SUPPLIER_ID"));	    //2
			vpd.put("var3", varOList.get(i).getString("SUPPLIER_NAME"));	    //3
			vpd.put("var4", varOList.get(i).getString("DATE"));	    //4
			vpd.put("var5", varOList.get(i).getString("TERMS"));	    //5
			vpd.put("var6", varOList.get(i).getString("VENDER_INVOICE"));	    //6
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
//	@InitBinder
//	public void initBinder(WebDataBinder binder){
//		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
//	}
	
	//------------------- Save Object --------------------------------------------------------
    @ResponseBody
    @RequestMapping(value = "/saveAp", method = RequestMethod.POST)
    public Object updateCompany(HttpServletResponse response, @RequestBody AccountPayable ap) throws Exception { //ResponseEntity<Object>
    	System.out.println("coming saving controller");
    	ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		System.out.println("ap =========== " + ap);
		ap.setAccountpayable_ID(get32UUID());
		accountpayableService.saveAP(ap);
		return JsonView.Render(mv, response);
    }
}
