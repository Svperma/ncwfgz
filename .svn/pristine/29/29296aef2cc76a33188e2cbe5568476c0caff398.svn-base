package com.dsib.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dsib.entity.GgCode;
import com.dsib.service.GgBuildingMstService;
import com.dsib.service.GgCodeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping(value = "/code")
public class GgCodeController extends BaseController{
    private static final String POVERTY_TYPE = "povertyType";
    private static final String BUILDING_LEVEL = "buildingLevel";
    private static final String BUILDING_AMOUNT = "buildingAmount";
    private static final String BANK_TYPE = "bankType";
    private static final String START_TIME = "startTime";
    private static final String PROGRESS = "Progress";
    private static final String FINISH_STATUS = "FinishStatus";
    private static final String PROVINCE_CODE = "520000";
    private static final String CITY = "City";
    private static final String COUNTY = "County";

    @Resource(name = "ggCodeService")
    private GgCodeService ggCodeService;
    @Resource(name = "ggBuildingMstService")
    private GgBuildingMstService ggBuildingMstService;

    @RequestMapping(value = "/initvalue")
    public String initValue(Model model) {
        model.addAttribute("povertyType", ggCodeService.getCodeTypes(POVERTY_TYPE));
        model.addAttribute("buildingLevel", ggCodeService.getCodeTypes(BUILDING_LEVEL));
        model.addAttribute("buildingAmount", ggCodeService.getCodeTypes(BUILDING_AMOUNT));
        model.addAttribute("bankType", ggCodeService.getCodeTypes(BANK_TYPE));
        model.addAttribute("startTime", ggCodeService.getCodeTypes(START_TIME));
        model.addAttribute("progress", ggCodeService.getCodeTypes(PROGRESS));
        model.addAttribute("finishStatus", ggCodeService.getCodeTypes(FINISH_STATUS));
        model.addAttribute("citys", ggCodeService.getCitys(CITY, PROVINCE_CODE));
        return "/jsp/message";

    }

    @RequestMapping(value = "/countys")
    @ResponseBody
    public List<GgCode> getCountys(@RequestParam("code") String code) {
        List<GgCode> citys = ggCodeService.getCitys(COUNTY, code);
        for (GgCode g : citys) {
            System.out.println(g.getCodecode() + ":" + g.getCodecname());
        }
        return citys;
    }
    
    @RequestMapping("/getArea")
    public void getArea(){
    	try {
    		String remark = request.getParameter("remark");
    		GgCode ggCode = new GgCode();
    		ggCode.setRemark(remark);
			List<GgCode> list = ggCodeService.getGgCodeByObj(ggCode);
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(JSON.toJSONString(list));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}
