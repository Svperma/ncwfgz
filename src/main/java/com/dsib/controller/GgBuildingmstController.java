package com.dsib.controller;

import com.dsib.common.Pagination;
import com.dsib.dao.GgAuditConfigMapper;
import com.dsib.dao.GgAuditMapper;
import com.dsib.dto.UpdateBuildingMst;
import com.dsib.dto.UpdateBuildingMstOne;
import com.dsib.entity.*;
import com.dsib.service.*;
import com.dsib.util.FileUtil;
import com.dsib.util.StringUtil;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping(value = "/init")
@SessionAttributes(value = {"messages", "message", "pagination", "cityList", "countyList"})
public class GgBuildingmstController extends BaseController {

    private static final String SYSTEM_SEPARATOR = System.getProperty("file.separator");

    @Resource(name = "ggBuildingMstService")
    private GgBuildingMstService ggBuildingMstService;
    @Resource(name = "ggAuditConfigService")
    private GgAuditConfigService ggAuditConfigService;
    @Resource(name = "ggAuditService")
    private GgAuditService ggAuditService;
    @Resource(name = "ggCodeService")
    private GgCodeService ggCodeService;
    @Resource(name = "ggBuildingMstHisService")
    private GgBuildingMstHisService ggBuildingMstHisService;
    @Autowired
    private GgAuditMapper ggAuditMapper;


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    /**
     * init 初始化数据
     */
    @RequestMapping(value = "/buildings")
    public String initDate(Model model) throws Exception {
        GgUser ggUser = (GgUser) session.getAttribute("ggUser");
        String comLevel = ggUser.getComLevel();
        GgCode cityCode = new GgCode();
        GgCode countyCode = new GgCode();
        Map<String, Object> map = new HashMap<>();
        if (comLevel.equals("2")) {
            cityCode.setCodecode(ggUser.getCity());
            countyCode.setRemark(ggUser.getCity());
            map.put("province", ggUser.getProvince());
            map.put("city", ggUser.getCity());
        } else if ("3".equals(comLevel)) {
            cityCode.setCodecode(ggUser.getCity());
            countyCode.setCodecode(ggUser.getCounty());
            map.put("province", ggUser.getProvince());
            map.put("city", ggUser.getCity());
            map.put("county", ggUser.getCounty());
        } else if ("1".equals(comLevel)) {
            cityCode.setRemark(ggUser.getProvince());
            countyCode.setCodecode("empty");
            map.put("province", ggUser.getProvince());
        }
        List<GgCode> cityList = ggCodeService.getGgCodeByObj(cityCode);
        List<GgCode> countyList = ggCodeService.getGgCodeByObj(countyCode);

//        Map<String, Object> stringObjectMap = ggBuildingMstService.initData(map);
        Map<String, String> stringObjectMap = ggBuildingMstService.initData2(map);
        model.addAttribute("data", stringObjectMap);
        model.addAttribute("cityList", cityList);
        model.addAttribute("countyList", countyList);
        return "/jsp/init";
    }

    /**
     * 改造户信息查看-初始化功能
     * 实现人：安伟卫
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/binglistcom")
    public String getBingListCom(Model model) {
        Pagination pagination = new Pagination();
        GgUser user = (GgUser) session.getAttribute("ggUser");
        Map<String, Object> map = getMap(request, user);

        pagination.setQueryCondition(map);
        List<Map<String, Object>> buildings = ggBuildingMstService.getAllMessageBuildingMst(pagination);
        pagination.setResultList(buildings);
        model.addAttribute("pagination", pagination);

        return "/jsp/messageCompleteResult";
    }

    /**
     * 修改银行卡信息
     * @param id
     * @param bank
     * @param account
     * @return
     */
    @RequestMapping(value = "/updateBank")
    public String updateBuildingBank(@RequestParam(value = "id") String id,
                                     @RequestParam(value = "bank") String bank,
                                     @RequestParam(value = "account") String account) {
        ggBuildingMstService.updateGgBuildingMstByBank(id,bank,account);
        return "redirect:/init/binglistcom";
    }

    @RequestMapping("/messageContextCom")
    public ModelAndView messageContextCom(@RequestParam("pageNo") String pageNo) {
        ModelAndView mad = new ModelAndView();
        Pagination pagination = (Pagination) session.getAttribute("pagination");
        pagination.setPageNo(Integer.parseInt(pageNo));
        Pagination allBuildingMstContext = ggBuildingMstService.getAllMessageBuildingMstContext(pagination);
        mad.addObject("pagination", allBuildingMstContext);
        mad.setViewName("/jsp/messageCompleteResult");
        return mad;
    }
    /**
     * 改造户信息查看-初始化功能
     * 实现人：安伟卫
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/binglist")
    public String getBingList(Model model) {
        Pagination pagination = new Pagination();
        GgUser user = (GgUser) session.getAttribute("ggUser");
        Map<String, Object> map = getMap(request, user);

        pagination.setQueryCondition(map);
        List<Map<String, Object>> buildings = ggBuildingMstService.getAllMessageBuildingMst(pagination);
        pagination.setResultList(buildings);
        model.addAttribute("pagination", pagination);

        return "/jsp/messageResult";
    }



    @RequestMapping(value = "/binglistExcel")
    public void binglistExcel() {
        GgUser user = (GgUser) session.getAttribute("ggUser");
        List<Map<String, Object>> buildings = ggBuildingMstService.getAllBuildingExcel(getMap(request, user));
        String[] title = {"CITY:市", "COUNTY:县", "HOUSEHOLDER:户主姓名", "IDENTITYID:身份证号", "BANK:开户行", "ACCOUNT:账号",
                "TYPE:贫困类型", "GRADE:危房等级", "STARTYEAR:纳入改造时间","SUNAMOUNT:应兑付金额(元)","FINISHAMOUNT:已兑付金额(元)", "FINISHSTATUS:是否销户"};
        FileUtil.exportToExcel(title, buildings, Map.class, "危房信息", response);
    }

    /**
     * 改造户信息查看-分页功能
     * 实现人：安伟卫
     *
     * @param pageNo
     * @return
     */
    @RequestMapping("/messageContext")
    public ModelAndView messageContext(@RequestParam("pageNo") String pageNo) {
        ModelAndView mad = new ModelAndView();
        Pagination pagination = (Pagination) session.getAttribute("pagination");
        pagination.setPageNo(Integer.parseInt(pageNo));
        Pagination allBuildingMstContext = ggBuildingMstService.getAllMessageBuildingMstContext(pagination);
        mad.addObject("pagination", allBuildingMstContext);
        mad.setViewName("/jsp/messageResult");
        return mad;
    }

    /**
     * 危房管理初始化
     * 实现人：安伟卫
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/bings")
    public String getBings(Model model) {
        Pagination pagination = new Pagination();
        pagination.setQueryCondition(getMap(request, (GgUser) session.getAttribute("ggUser")));
        pagination.setResultList(ggBuildingMstService.getAllBuildingMst(pagination));
        model.addAttribute("pagination", pagination);
        return "/jsp/managerResult";
    }

    /**
     * 危房管理分页
     *
     * @param pageNo
     * @return
     */
    @RequestMapping("/bingspage")
    public ModelAndView bingsPage(@RequestParam("pageNo") String pageNo) {
        ModelAndView mad = new ModelAndView();
        Pagination pagination = (Pagination) session.getAttribute("pagination");
        pagination.setPageNo(Integer.parseInt(pageNo));
        Pagination paginations = ggBuildingMstService.getAllBuildingMstContext(pagination);
        mad.addObject("pagination", paginations);
        mad.setViewName("/jsp/managerResult");
        return mad;
    }

    @RequestMapping("/building1")
    @ResponseBody
    public Map<String, Object> getBuildinga(@RequestParam("id") String id) {
        System.out.println(id);

        Map<String, Object> buildingMstMap = ggBuildingMstService.getBuildingMstMap(id);
        return buildingMstMap;
    }

    @RequestMapping("/building")
    @ResponseBody
    public UpdateBuildingMst getBuilding(@RequestParam("id") String id,
                                         @RequestParam("businessno") String businessno,
                                         @RequestParam("status") String status) {
        UpdateBuildingMst buildingMst = null;
        if("3".equals(status)) {
            // 查询正式表
            buildingMst = ggBuildingMstService.getBuildingMst(id);
        }else{
//            查询临时表
            buildingMst = ggBuildingMstHisService.getGgBuildingMstHis(businessno);
        }

        // 添加审核记录
        buildingMst.setAudits(ggAuditMapper.listAudits(businessno));
        // 添加审核人
        if(buildingMst.getTown() != null) {
            switch (buildingMst.getTown()) {
                case "countyAuditor":
                case "countyHousingAudit":
                    buildingMst.setNextAudit("县级审核");
                    break;
                case "cityAuditor":
                case "cityHousingAudit":
                    buildingMst.setNextAudit("市级审核");
                    break;
                case "provinceAuditor":
                case "provinceHousingAuditor":
                    buildingMst.setNextAudit("省级审核");
                    break;
                default:
                    buildingMst.setNextAudit("无");
            }
        }
        return buildingMst;
    }

    @RequestMapping("/buildingas")
    @ResponseBody
    public GgBuildingmst getBuildingas(@RequestParam("id") String id) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        return ggBuildingMstService.getBuildingMstas(id);
    }


    @RequestMapping("/buildingas1")
    @ResponseBody
    public List<GgBuildingmst> getBuildingas(@RequestParam("householder") String householder,
                                             @RequestParam("identityid") String identityid,
                                             @RequestParam(value = "ids") List<String> ids) {

        System.out.println(ids.toString());

        StringBuffer sb = new StringBuffer();
        if(ids.size() >=1){
            sb.append("(");
           for(int x = 0; x<ids.size(); x++){
               sb.append(ids.get(x));
               sb.append(",");
           }
            sb.append(")");
        }
        String idss = sb.toString();
        String aaa = idss.replace("[", "").replace("]", "").replace(",)", ")");

        System.out.println(aaa);
        GgUser user = (GgUser) session.getAttribute("ggUser");
        Map<String, Object> map = new HashMap<>();
        map.put("householder", householder);
        map.put("identityid", identityid);
        switch (user.getComLevel()) {
            case "1":
                map.put("province", request.getParameter("province") == null ? user.getProvince() : request.getParameter("province"));
            case "2":
                map.put("province", request.getParameter("province") == null ? user.getProvince() : request.getParameter("province"));
                map.put("city", request.getParameter("city") == null ? user.getCity() : request.getParameter("city"));
                break;
            case "3":
                map.put("province", request.getParameter("province") == null ? user.getProvince() : request.getParameter("province"));
                map.put("city", request.getParameter("city") == null ? user.getCity() : request.getParameter("city"));
                map.put("county", request.getParameter("county") == null ? user.getCounty() : request.getParameter("county"));
                break;
        }
        if(aaa.length() > 5) {
            map.put("ids", aaa);
        }
        List<GgBuildingmst> resultMap = ggBuildingMstService.getBuildingMstas(map);
        return resultMap;
    }

    /**
     * 修改危房信息
     */
    @RequestMapping("/updatemst")
    public String updateBuildingMst(UpdateBuildingMstOne ggBuildingmst, MultipartFile file) throws FileUploadException {
        ggBuildingmst.setFilePath(this.uploadFileAndGetPath(file));

        if (ggBuildingmst.getProgress() == null) {
            ggBuildingmst.setProgress("9");
        }
        GgUser ggUser = (GgUser) session.getAttribute("ggUser");
        GgAuditConfigKey key = new GgAuditConfigKey();
        key.setAuditType("1");
        key.setRoleCode(ggUser.getRole());
        GgAuditConfig auditConfig = ggAuditConfigService.selectByPrimaryKey(key);  //判断是否有上级需要审核
        String auditRoleCode = "";
        ggBuildingmst.setProvince(ggUser.getProvince());
        ggBuildingmst.setInputcode(ggUser.getUserCode());
        ggBuildingmst.setCounty(ggUser.getCounty());
        ggBuildingmst.setCity(ggUser.getCity());
        ggBuildingmst.setUpdatecode(ggBuildingmst.getInputcode()); // 修改人为提交申请的人
        ggBuildingmst.setUpdatetime(new Date());
        if (auditConfig != null) {
            auditRoleCode = auditConfig.getAuditCode();
            ggBuildingmst.setTown(auditRoleCode);
            ggBuildingmst.setStatus("1");
            ggBuildingMstService.updateBuilding(ggBuildingmst);
        } else {
            ggBuildingmst.setStatus("3");
            ggBuildingmst.setConfirmcode(ggUser.getUserCode());
            ggBuildingmst.setConfirmtime(new Date());
            ggBuildingMstService.installGgBuilding(ggBuildingmst);
        }
        return "redirect:/init/bings";
    }

    @RequestMapping("/repetition")
    @ResponseBody
    public Integer getRepetitionByIdentityId(@RequestParam("identityid") String identityid){
        int count = ggBuildingMstService.getGgBuildingMstByIdentityId(identityid);
        return count;
    }

    /**
     * 兑付信息查看-初始化功能
     * 兑付信息查看-查询功能
     * 功能实现人：安伟卫
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/cashbuild")
    public String retrieveCashBuild(Model model) {
        Pagination pagination = new Pagination();
        pagination.setQueryCondition(getMap(request, (GgUser) session.getAttribute("ggUser")));
        pagination.setResultList(ggBuildingMstService.getAllBuildingMstjoin(pagination));
        model.addAttribute("pagination", pagination);
        return "/jsp/cashMessages";
    }

    @RequestMapping(value = "/cashbuildExcel")
    public void retrieveCashBuildExcel() {
        Pagination pagination = new Pagination();
        Map<String, Object> map = getMap(request, (GgUser) session.getAttribute("ggUser"));
        List<Map<String, Object>> resultList = ggBuildingMstService.getAllBuildingMstjoinMap(map);
        String[] title = {"CITY:市", "COUNTY:区", "HOUSEHOLDER:用户姓名", "IDENTITYID:身份证号",
                "BANK:开户行", "ACCOUNT:账号", "TYPE:贫困类型", "GRADE:危房等级", "STARTYEAR:纳入改造时间",
                "PROGRESS:工程进度", "FINISHAMOUNT:兑付金额(元)", "PAYMENTDATE:兑付日期"};
        FileUtil.exportToExcel(title, resultList, Map.class, "兑付信息记录", response);
    }

    /**
     * 兑付信息查看-分页功能
     * 功能实现人：安伟卫
     *
     * @param model
     * @param pageNo
     * @param session
     * @return
     */
    @RequestMapping(value = "/cashbuildPage")
    public String retrieveCashBuildPage(Model model, @RequestParam("pageNo") String pageNo, HttpSession session) {
        Pagination pagination = (Pagination) session.getAttribute("pagination");
        pagination.setPageNo(Integer.parseInt(pageNo));
        pagination.setResultList(ggBuildingMstService.getAllBuildingMstjoin(pagination));
        model.addAttribute("pagination", pagination);
        return "/jsp/cashMessages";
    }

    private Map<String, Object> getMap(HttpServletRequest request, GgUser user) {
        Map<String, Object> map = new HashMap<>();
        String province = request.getParameter("province") == null ? "" : request.getParameter("province");
        String city = request.getParameter("city") == null ? "" : request.getParameter("city");
        String county = request.getParameter("county") == null ? "" : request.getParameter("county");
        String vacancy = "".intern();

        switch (user.getComLevel()) {
            case "1":
                map.put("province", vacancy.equals(province) ? user.getProvince() : province);
                if (!vacancy.equals(city.trim())) {
                    map.put("city", city);
                }
                if (!vacancy.intern().equals(county.trim())) {
                    map.put("county", county);
                }
                break;
            case "2":
                map.put("province", vacancy.equals(province) ? user.getProvince() : province);
                map.put("city", vacancy.equals(city.trim()) ? user.getCity() : city);
                if (!vacancy.intern().equals(city.trim())) {
                    map.put("county", request.getParameter("county"));
                }
                break;
            case "3":
                map.put("province", vacancy.intern().equals(province) ? user.getProvince() : province);
                map.put("city", vacancy.equals(city) ? user.getCity() : city);
                map.put("county", vacancy.equals(county) ? user.getCounty() : county);
                break;
        }
        map.put("type", request.getParameter("type"));
        map.put("grade", request.getParameter("grade"));
        map.put("startyear", request.getParameter("startyear"));
        map.put("progress", request.getParameter("progress"));
        map.put("finishStatus", request.getParameter("finishStatus"));
        map.put("householder", request.getParameter("householder"));
        map.put("identityid", request.getParameter("identityid"));
        map.put("bank", request.getParameter("bank"));
        map.put("account", request.getParameter("account"));
        map.put("startDate", request.getParameter("startDate"));
        map.put("endDate", request.getParameter("endDate"));
        map.put("startYear", request.getParameter("startyear"));
        map.put("progress",request.getParameter("progress"));
        return map;
    }

    /**
     * 各地兑付情况-初始化方法
     * 各地兑付情况-查询方法
     * 功能实现人：安伟卫
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/statistics")
    public String getCityCashStatistics(Model model) {
        Pagination pagination = new Pagination();
        pagination.setQueryCondition(getMap(request, (GgUser) session.getAttribute("ggUser")));
        pagination.setResultList(ggBuildingMstService.getCityCashStatistics(pagination));
        model.addAttribute("pagination", pagination);
        return "/jsp/statisticeList";
    }

    @RequestMapping(value = "/statisticsExcel")
    public void getCityCashStatisticsExcel(Model model) throws IOException {
        GgUser ggUser = (GgUser) session.getAttribute("ggUser");
        List<Map<String, Object>> cityCashStatistics = ggBuildingMstService.getCityCashStatisticsExcel(getMap(request, ggUser));
        statisticsExcel(cityCashStatistics);
    }

    /**
     * 各地兑付情况-分页功能
     * 功能实现人：安伟卫
     *
     * @param model
     * @param pageNo
     * @return
     */
    @RequestMapping(value = "/statisticsPage")
    public String getCityCashStatisticsPage(Model model, @RequestParam("pageNo") String pageNo) {
        Pagination pagination = (Pagination) session.getAttribute("pagination");
        pagination.setPageNo(Integer.parseInt(pageNo));
        pagination.setResultList(ggBuildingMstService.getCityCashStatistics(pagination));
        model.addAttribute("pagination", pagination);
        return "/jsp/statisticeList";
    }

    /**
     * 改造危房列表
     * @return
     */
    @RequestMapping("/gaizaoaudit")
    public ModelAndView gaiZaoAudit() {
        ModelAndView mad = new ModelAndView();
        GgUser ggUser = (GgUser) session.getAttribute("ggUser");
        String comLevel = ggUser.getComLevel();
        String roleCode = ggUser.getRole();
        Map<String, String> conMap = new HashMap<String, String>();
        conMap.put("town", roleCode);
        GgCode cityCode = new GgCode();
        GgCode countyCode = new GgCode();
        if (comLevel.equals("2")) {
            conMap.put("city", ggUser.getCity());
            cityCode.setCodecode(ggUser.getCity());
            countyCode.setRemark(ggUser.getCity());
        } else if ("3".equals(comLevel)) {
            conMap.put("county", ggUser.getCounty());
            cityCode.setCodecode(ggUser.getCity());
            countyCode.setCodecode(ggUser.getCounty());
        } else if ("1".equals(comLevel)) {
            cityCode.setRemark(ggUser.getProvince());
            countyCode.setCodecode(" ");
        }
        List<GgCode> cityList = ggCodeService.getGgCodeByObj(cityCode);
        List<GgCode> countyList = ggCodeService.getGgCodeByObj(countyCode);
        Pagination pagination = new Pagination();
        pagination.setQueryCondition(conMap);
        List<GgBuildingmstHis> hisList = ggBuildingMstService.listBuildingAudits(pagination);
        pagination.setResultList(hisList);
        mad.addObject("pagination", pagination);
        mad.addObject("cityList", cityList);
        mad.addObject("countyList", countyList);
        mad.setViewName("/jsp/gaizaoauditresult");
        return mad;
    }

    @RequestMapping("/gaizaoauditquery")
    public ModelAndView gaiZaoAuditQuery() {
        ModelAndView mad = new ModelAndView();
        GgUser ggUser = (GgUser) session.getAttribute("ggUser");
        String city = request.getParameter("city");
        String county = request.getParameter("county");
        String type = request.getParameter("type");
        String grade = request.getParameter("grade");
        String startYear = request.getParameter("startYear");
        //String progress =request.getParameter("progress").trim();
        String finishStatus = request.getParameter("finishStatus");
        String houseHolder = request.getParameter("houseHolder");
        String identityNo = request.getParameter("identityNo");
        String bank = request.getParameter("bank");
        String account = request.getParameter("account");
        Map<String, String> conMap = new HashMap<String, String>();
        conMap.put("city", ggUser.getCity());
        conMap.put("county", ggUser.getCounty());
        conMap.put("type", type);
        conMap.put("grade", grade);
        conMap.put("startYear", startYear);
        conMap.put("finishStatus", finishStatus);
        conMap.put("houseHolder", houseHolder);
        conMap.put("identityNo", identityNo);
        conMap.put("bank", bank);
        conMap.put("account", account);
        conMap.put("town", ggUser.getRole());
        Pagination pagination = new Pagination();
        pagination.setQueryCondition(conMap);
        List<GgBuildingmstHis> hisList = ggBuildingMstService.listBuildingAudits(pagination);
        pagination.setResultList(hisList);
        mad.addObject("pagination", pagination);
        mad.setViewName("/jsp/gaizaoauditresult");
        return mad;
    }

    @RequestMapping("/gaiZaoAuditQueryContinue")
    public ModelAndView gaiZaoAuditQueryContinue() {
        ModelAndView mad = new ModelAndView();
        String pageNo = request.getParameter("pageNo");
        Pagination pagination = (Pagination) session.getAttribute("pagination");
        pagination.setPageNo(Integer.valueOf(pageNo));
        List<GgBuildingmstHis> hisList = ggBuildingMstService.listBuildingAudits(pagination);
        pagination.setResultList(hisList);
        mad.addObject("pagination", pagination);
        mad.setViewName("/jsp/gaizaoauditresult");
        return mad;
    }

    /**
     * 根据businessNo 查询需要审核的危房
     */
    @RequestMapping("/prepareAudit")
    public void prepareAudit() {
        String businessNo = request.getParameter("businessNo");
        GgBuildingmstHis buildingmstHis = ggBuildingMstService.getBuildingMstHisByKey(businessNo);
        List<GgAudit> auditList = ggAuditService.listAudits(businessNo);
        GgBuildingmst ggBuildingmst = ggBuildingMstService.getBuildingMsts(buildingmstHis.getId());
        session.setAttribute("ggBuildingmst", ggBuildingmst);
        session.setAttribute("buildingmstHis", buildingmstHis);
        session.setAttribute("auditList", auditList);
    }

    @RequestMapping("/buildingAudit")
    @Transactional
    public String buildingAudit(GgAudit ggAudit, UpdateBuildingMstOne ggBuildingmstOne) {
        GgUser ggUser = (GgUser) session.getAttribute("ggUser");
        String id = request.getParameter("ggBuildingmst.id");
        String type = request.getParameter("ggBuildingmst.type");
        ggBuildingmstOne.setId(id);
        ggBuildingmstOne.setType(type);
        ggBuildingmstOne.setProvince(ggUser.getProvince());
        GgAuditConfig auditConfig = new GgAuditConfig();
        auditConfig.setRoleCode(ggUser.getRole());
        auditConfig.setAuditType("1");
        auditConfig = ggAuditConfigService.selectByPrimaryKey(auditConfig);


        if("1".intern().equals(ggAudit.getAuditStatus())){
//            通过 修改his
                ggBuildingmstOne.setConfirmcode(ggUser.getUserCode());
                ggBuildingmstOne.setConfirmtime(new Date());
                ggBuildingmstOne.setProvince(ggUser.getProvince());
            if(auditConfig != null){
//                通过审核并有上级审核  只更新his表
                ggBuildingmstOne.setTown(auditConfig.getAuditCode());
                ggBuildingmstOne.setStatus(ggAudit.getAuditStatus());
                ggBuildingMstHisService.updateGgBuildingMstAudit(ggBuildingmstOne);
            }else {
//                通过审核没有上级审核， 修改his表。更新主表
                ggBuildingmstOne.setStatus("3");
                ggBuildingMstHisService.installGgBuildingMstHis(ggBuildingmstOne); //修改his 表为审核通过
                ggBuildingMstService.installGgBuilding(ggBuildingmstOne); // 添加主表 或 修改主表
            }
        }else {
//            未通过审核 更新his 表状态
            ggBuildingMstHisService.updateGgBuildingMstNoneAudit(ggBuildingmstOne);
        }


        ggAudit.setAuditCode(ggUser.getUserCode());
        ggAudit.setAuditTime(new Date());
        ggAuditService.insert(ggAudit);
//        return this.gaiZaoAudit();
        return "redirect:/init/gaizaoaudit";
    }

    @RequestMapping("/createBuilding")
    public String createBuilding(UpdateBuildingMstOne updateBuildingMstOne, MultipartFile file) throws FileUploadException {
        GgUser ggUser = (GgUser) session.getAttribute("ggUser");

        updateBuildingMstOne.setFilePath(this.uploadFileAndGetPath(file));
        GgAuditConfig auditConfig = new GgAuditConfig();
        auditConfig.setRoleCode(ggUser.getRole());
        auditConfig.setAuditType("1");
        auditConfig = ggAuditConfigService.selectByPrimaryKey(auditConfig);


        updateBuildingMstOne.setProvince("520000");
        updateBuildingMstOne.setFinishstatus("0");
        updateBuildingMstOne.setInputcode(ggUser.getUserCode());
        updateBuildingMstOne.setInputtime(new Date());
        //获取记录数据
        //有下级审核
        if (auditConfig != null) {
            updateBuildingMstOne.setTown(auditConfig.getAuditCode());
            updateBuildingMstOne.setStatus("1");

        }else{
            updateBuildingMstOne.setStatus("3");
            updateBuildingMstOne.setId(StringUtil.getBusinessNo());
            ggBuildingMstService.installGgBuilding(updateBuildingMstOne);
        }

        ggBuildingMstHisService.installGgBuildingMstHis(updateBuildingMstOne);
        return "redirect:/init/bings";
    }


    private String uploadFileAndGetPath(MultipartFile file) throws FileUploadException {
        String filepath = "";
        if(!file.isEmpty()){
            try {
                filepath = request.getSession().getServletContext()
                        .getRealPath(SYSTEM_SEPARATOR) + "files" + SYSTEM_SEPARATOR + file.getOriginalFilename();
                filepath = filepath.replace("\\", "\\\\");
                File saveFile = new File(filepath);
                if(!saveFile.getParentFile().exists()){
                    saveFile.getParentFile().mkdirs();
                }
                file.transferTo(saveFile);

            } catch (IOException e) {
                throw new FileUploadException("文件上传失败" + file.getOriginalFilename());
            }

        }
        return filepath;
    }

    @RequestMapping(value = "/download")
    public ResponseEntity<byte[]> downloadFile(@RequestParam("id") String id) throws IOException {
        UpdateBuildingMst orderByNo = ggBuildingMstHisService.getGgBuildingMstHis(id);
        String path = orderByNo.getFilePath();
        System.out.println(path);
        File file = new File(path);
        String filename = path.substring(path.lastIndexOf("\\\\" )+ 2);
        HttpHeaders headers = new HttpHeaders();
        String fileName = new String(filename.getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }


    private void statisticsExcel(List<Map<String, Object>> list) throws IOException {
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet();
        HSSFRow row = sheet.createRow(0);
        row.createCell(0).setCellValue("市");
        row.createCell(1).setCellValue("区");
        row.createCell(2).setCellValue("危房数量");
        row.createCell(6).setCellValue("工程进度");
        row.createCell(10).setCellValue("应付金额(元)");
        row.createCell(11).setCellValue("已兑付金额(元)");
        row.createCell(12).setCellValue("兑付率");
        HSSFRow row01 = sheet.createRow(1);
        row01.createCell(2).setCellValue("一级危房");
        row01.createCell(3).setCellValue("二级危房");
        row01.createCell(4).setCellValue("三级危房");
        row01.createCell(5).setCellValue("合计");
        row01.createCell(6).setCellValue("未开工");
        row01.createCell(7).setCellValue("开工");
        row01.createCell(8).setCellValue("主基础工程");
        row01.createCell(9).setCellValue("完工");

        int rowNumber = 2;
        for(Map<String,Object> m : list){
            int sum = 0;
            HSSFRow row1 = sheet.createRow(rowNumber++);
            row1.createCell(0).setCellValue(m.get("市").toString());
            row1.createCell(1).setCellValue(m.get("县").toString());
            String one = m.get("一级危房").toString();
            row1.createCell(2).setCellValue(one);
            String tow = m.get("二级危房").toString();
            row1.createCell(3).setCellValue(tow);
            String three = m.get("三级危房").toString();
            row1.createCell(4).setCellValue(three);
            row1.createCell(5).setCellValue(Integer.parseInt(one) + Integer.parseInt(tow) + Integer.parseInt(three));
            row1.createCell(6).setCellValue(m.get("未开工").toString());
            row1.createCell(7).setCellValue(m.get("开工").toString());
            row1.createCell(8).setCellValue(m.get("主基础工程").toString());
            row1.createCell(9).setCellValue(m.get("完工").toString());
            row1.createCell(10).setCellValue(m.get("应付金额").toString());
            row1.createCell(11).setCellValue(m.get("已兑付金额").toString());
            row1.createCell(12).setCellValue(m.get("兑付率").toString() + "%");
        }

        sheet.addMergedRegion(new CellRangeAddress(0,1,0,0));
        sheet.addMergedRegion(new CellRangeAddress(0,1,1,1));
        sheet.addMergedRegion(new CellRangeAddress(0,0,2,5));
        sheet.addMergedRegion(new CellRangeAddress(0,0,6,9));
        sheet.addMergedRegion(new CellRangeAddress(0,1,10,10));
        sheet.addMergedRegion(new CellRangeAddress(0,1,11,11));
        sheet.addMergedRegion(new CellRangeAddress(0,1,12,12));

        String fileName = "各地兑付情况.xls";
        String ieType = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getHeader("USER-AGENT");
        OutputStream out = response.getOutputStream();
        if (ieType.indexOf("Firefox") > 0) {
            response.setHeader("Content-disposition", "attachment;fileName=\"" + new String(fileName.getBytes("GB2312"), "ISO-8859-1") + "\"");
        } else {
            response.setHeader("Content-disposition", "attachment;fileName=\"" + URLEncoder.encode(fileName, "UTF-8") + "\"");
        }
        response.setContentType("application/msexcel;charset=UTF-8");
        workbook.write(out);
        out.close();
    }

    @RequestMapping(value = "/input")
    public void inputAll(MultipartFile file) {
        StringBuffer msg = new StringBuffer(100);
        PrintWriter out = null;
        try {
            response.setContentType("application/json;charset=utf-8");
            out = response.getWriter();
            GgUser ggUser = (GgUser) session.getAttribute("ggUser");
            HSSFWorkbook workbook = new HSSFWorkbook(file.getInputStream());
            HSSFSheet sheet = workbook.getSheetAt(0);
            List<GgBuildingmst> list = null;
            list = importExcel(sheet, ggUser);
            if(msg.toString().length() > 0){
                out.write(JSONObject.fromObject("{'res':"+msg.toString()+"}").toString());
            }else{
                if(list != null ){
                    ggBuildingMstService.insertAll(list);
                    out.write(JSONObject.fromObject("{'res':'导入成功'}").toString());
                }
                else{
                    out.write(JSONObject.fromObject("{'res':'导入失败'}").toString());
                }
            }
        } catch (Exception e) {

            out.write(JSONObject.fromObject("{'res':'"+"上传文件错误或数据不规范，请重新确认再提交: " + e.getMessage()+"'}").toString());
            e.printStackTrace();
        }

    }

    private String getCellValue(HSSFCell cell) {
        String cellValue = "";
        DecimalFormat df = new DecimalFormat("#");
        switch (cell.getCellType()) {
            case HSSFCell.CELL_TYPE_STRING:
                cellValue = cell.getRichStringCellValue().getString().trim();
                break;
            case HSSFCell.CELL_TYPE_NUMERIC:
                cellValue = df.format(cell.getNumericCellValue()).toString();
                break;
            case HSSFCell.CELL_TYPE_BOOLEAN:
                cellValue = String.valueOf(cell.getBooleanCellValue()).trim();
                break;
            case HSSFCell.CELL_TYPE_FORMULA:
                cellValue = cell.getCellFormula();
                break;
            default:
                cellValue = "";
        }
        return cellValue;
    }

    public boolean is18ByteIdCard(String idCard){
        Pattern pattern1 = Pattern.compile("^(\\d{6})(19|20)(\\d{2})(1[0-2]|0[1-9])(0[1-9]|[1-2][0-9]|3[0-1])(\\d{3})(\\d|X|x)?$"); //粗略的校验
        Matcher matcher = pattern1.matcher(idCard);
        if(matcher.matches()){
            return true;
        }
        return false;
    }

    public List<GgBuildingmst> importExcel(HSSFSheet sheet, GgUser user) throws Exception {
        List<GgBuildingmst> list = new ArrayList<>();
        List<String> title = new ArrayList<>();
        int rowNum = 0;
        int lastRowNum = sheet.getLastRowNum();
        HSSFRow lastRow = sheet.getRow(rowNum);
        short lastCellNum = lastRow.getLastCellNum();
        for (int x = 0; x < lastCellNum; x++) {
            HSSFCell cell = lastRow.getCell(x);
            title.add(cell.getStringCellValue());
        }

        rowNum++;

        for (; rowNum < lastRowNum; rowNum++) {
            HSSFRow row = sheet.getRow(rowNum);
            if (row == null) continue;
            GgBuildingmst buildingmst = new GgBuildingmst();
            String householder = getValueByType(row.getCell(0));
            if(householder == null || householder.length() > 30){
                throw new Exception("第" + rowNum + "行第1列户主姓名格式错误");
            }
            buildingmst.setHouseholder(householder);

            String identityid = getValueByType(row.getCell(1));
            boolean flag = is18ByteIdCard(identityid);
            if(flag) {
                int ggBuildingMstByIdentityId = ggBuildingMstService.getGgBuildingMstByIdentityId(identityid);
                if(ggBuildingMstByIdentityId > 1) {
                    throw new Exception("第" + rowNum + "行第2列身份证号重复");
                }

                buildingmst.setIdentityid(identityid);
            }else{
                throw new Exception("第" + rowNum + "行第2列身份证号错误");
            }
            buildingmst.setPeoplenumber(Integer.valueOf(getValueByType(row.getCell(2))));
            buildingmst.setType(getValueByType(row.getCell(3)).split(",")[0]);

            buildingmst.setGrade(getValueByType(row.getCell(4)).split(",")[0]);
            buildingmst.setSunamount(Integer.valueOf((getValueByType(row.getCell(4)).split(",")[0])));

            buildingmst.setStartyear(getValueByType(row.getCell(5)).split(",")[0]);

            buildingmst.setBank(getValueByType(row.getCell(6)).split(",")[0]);
            String account = getValueByType(row.getCell(7)).split(",")[0];
            if(!Pattern.matches("^\\d+$", account)|| account.length() > 25){
                throw new Exception("第" + rowNum + "行第10列银行卡错误");
            }
            buildingmst.setAccount(account);

            buildingmst.setProgress(getValueByType(row.getCell(8)).split(",")[0]);
            HSSFCell cell = row.getCell(9);
            int finishamount = 0;
            if(cell != null) {
                finishamount = Integer.valueOf(getValueByType(cell));
            }
            buildingmst.setFinishamount(finishamount);

            buildingmst.setFinishstatus(getValueByType(row.getCell(10)).split(",")[0]);

            buildingmst.setId(StringUtil.getBusinessNo());
            buildingmst.setStatus("3");
            buildingmst.setProvince("520000");
            buildingmst.setCity(user.getCity());
            buildingmst.setCounty(user.getCounty());
            buildingmst.setInputcode(user.getUserCode());
            buildingmst.setInputtime(new Date());
            buildingmst.setConfirmtime(new Date());

            list.add(buildingmst);
        }
        return list;
    }

    private String getValueByType(HSSFCell cell) {
        String value;
        switch (cell.getCellType()) {
            case HSSFCell.CELL_TYPE_NUMERIC: // 数字
                //如果为时间格式的内容
                if (HSSFDateUtil.isCellDateFormatted(cell)) {
                    //注：format格式 yyyy-MM-dd hh:mm:ss 中小时为12小时制，若要24小时制，则把小h变为H即可，yyyy-MM-dd HH:mm:ss
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                    value = sdf.format(HSSFDateUtil.getJavaDate(cell.
                            getNumericCellValue())).toString();
                    break;
                } else {
                    value = new DecimalFormat("0").format(cell.getNumericCellValue());
                }
                break;
            case HSSFCell.CELL_TYPE_STRING: // 字符串
                value = cell.getStringCellValue();
                break;
            case HSSFCell.CELL_TYPE_BOOLEAN: // Boolean
                value = cell.getBooleanCellValue() + "";
                break;
            case HSSFCell.CELL_TYPE_FORMULA: // 公式
                value = cell.getCellFormula() + "";
                break;
            case HSSFCell.CELL_TYPE_BLANK: // 空值
                value = "";
                break;
            case HSSFCell.CELL_TYPE_ERROR: // 故障
                value = "非法字符";
                break;
            default:
                value = "未知类型";
                break;
        }

        return value;
    }
}
