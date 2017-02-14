package com.fh.controller.system.company;

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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.JSONSerializer;
import com.alibaba.fastjson.serializer.JSONSerializerMap;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.JsonView;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.system.company.CompanyManager;

/** 
 * 说明：System Company
 * 创建人：SMing
 * 创建时间：2017-02-14
 */
@Controller
@RequestMapping(value="/company")
public class CompanyController extends BaseController {
	
	String menuUrl = "company/list.do"; //菜单地址(权限用)
	@Resource(name="companyService")
	private CompanyManager companyService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Company");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("COMPANY_ID", this.get32UUID());	//主键
		pd.put("COMPNAY_LOGO", "");	//Company Logo
		pd.put("COMPANY_TEL", "");	//Compnay Telephone
		pd.put("COMPANY_FAX", "");	//Company Fax
		pd.put("GSTNO", "");	//GST NO.
		companyService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Company");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		companyService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Company");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		companyService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Company");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = companyService.list(page);	//列出Company列表
		mv.setViewName("system/company/company_list");
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
		mv.setViewName("system/company/company_edit");
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
		pd = companyService.findById(pd);	//根据ID读取
		mv.setViewName("system/company/company_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Company");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			companyService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Company到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("Company Name");	//1
		titles.add("Company Code");	//2
		titles.add("Company Address");	//3
		titles.add("Company Logo");	//4
		titles.add("Compnay Telephone");	//5
		titles.add("Company Fax");	//6
		titles.add("GST NO.");	//7
		dataMap.put("titles", titles);
		List<PageData> varOList = companyService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("COMPANY_CODE"));	    //2
			vpd.put("var3", varOList.get(i).getString("COMPANY_ADDRESS"));	    //3
			vpd.put("var4", varOList.get(i).getString("COMPNAY_LOGO"));	    //4
			vpd.put("var5", varOList.get(i).getString("COMPANY_TEL"));	    //5
			vpd.put("var6", varOList.get(i).getString("COMPANY_FAX"));	    //6
			vpd.put("var7", varOList.get(i).getString("GSTNO"));	    //7
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
	
	
	//-------------------Retrieve All Company--------------------------------------------------------
	@ResponseBody
	@RequestMapping(value="/listSvc")
	public Object listSvc(Page page, HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Company");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = companyService.listAll(pd);	//列出Company列表
		mv.setViewName("system/company/company_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return JsonView.Render(mv, response);
	}
	//-------------------Retrieve Single Company--------------------------------------------------------
	@RequestMapping(value = "/listSvc/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getCompany(@PathVariable("id") long id) throws Exception {
        System.out.println("Fetching Company with id " + id);
        ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
//        User user = userService.findById(id);
//        if (user == null) {
//            System.out.println("User with id " + id + " not found");
//            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
//        }
        return new ResponseEntity<Object>(companyService.findById(pd), HttpStatus.OK);
    }
	//-------------------Create a company--------------------------------------------------------
	@RequestMapping(value = "/listSvc/", method = RequestMethod.POST)
    public ResponseEntity<Void> createUser(@RequestBody Object company,    
    		UriComponentsBuilder ucBuilder) {
  
//        if (userService.isUserExist(user)) {
//            System.out.println("A User with name " + user.getUsername() + " already exist");
//            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
//        }
  
//        userService.saveUser(user);
  
        HttpHeaders headers = new HttpHeaders(); 
        headers.setLocation(ucBuilder.path("/user/{id}").buildAndExpand(1).toUri());//user.getId()
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
	
	//------------------- Update a User --------------------------------------------------------
    
    @RequestMapping(value = "/listSvc/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Object> updateUser(@PathVariable("id") long id, @RequestBody Object company) throws Exception {
        System.out.println("Updating User " + id);
        ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
//        User currentUser = userService.findById(id);
          
//        if (currentUser==null) {
//            System.out.println("User with id " + id + " not found");
//            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
//        }
  
//        currentUser.setUsername(user.getUsername());
//        currentUser.setAddress(user.getAddress());
//        currentUser.setEmail(user.getEmail());
//          
//        userService.updateUser(currentUser);
        return new ResponseEntity<Object>(companyService.findById(pd), HttpStatus.OK);
    }
}
