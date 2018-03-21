package com.dsib.controller;

import com.dsib.common.Pagination;
import com.dsib.entity.GgRole;
import com.dsib.entity.GgUser;
import com.dsib.service.GgRoleService;
import com.dsib.service.GgUserService;
import com.dsib.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.alibaba.fastjson.JSONObject;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import com.alibaba.fastjson.JSON;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
@SessionAttributes({"pagination"})
public class GgUserController extends BaseController {


    @Autowired
    private GgUserService userService;
    @Autowired
    private GgRoleService ggRoleService;


    @RequestMapping("/addUser")
    public String addUser(GgUser user) {
        GgUser ggUser = (GgUser) session.getAttribute("ggUser");
        user.setPassword(Md5Util.md5(user.getPassword()));
        switch (user.getRole()){
            case "provinceAuditor": user.setComLevel("1");break;
            case "cityAuditor": user.setComLevel("2");break;
            case "countyAuditor": user.setComLevel("3"); break;
        }
        user.setRemark(ggUser.getUserCode());  //添加谁管理的
        user.setProvince("520000");
        user.setUserInd("99");
        user.setValidStatus("1");
        userService.saveUser(user);
        return "redirect:/user/initUser";
    }

    @RequestMapping("/initUser")
    public String retrieveAllUser(Model model) {
        Pagination pagination = new Pagination();
        GgUser user = (GgUser) session.getAttribute("ggUser");
        Map<String, Object> map = new HashMap<>();
        this.getParameter(user, map);
        pagination.setQueryCondition(map);
        pagination.setResultList(userService.getUserAll(pagination));
        List<GgRole> roles = ggRoleService.listRolesAll();
        model.addAttribute("pagination", pagination);
        model.addAttribute("roles", roles);

        return "/jsp/userList";
    }

    @RequestMapping("/pageUser")
    public String retrievePageAllUser(@RequestParam("pageNo") String pageNo) {
        Pagination pagination = (Pagination) session.getAttribute("pagination");
        pagination.setPageNo(Integer.parseInt(pageNo));
        //GgUser user = (GgUser) session.getAttribute("ggUser");
        //Map<String, Object> map = new HashMap<>();
        //this.getParameter(user, map);
        //pagination.setQueryCondition(map);
        pagination.setResultList(userService.getUserAll(pagination));
        return "/jsp/userList";
    }


    @RequestMapping("/deleteUser")
    @ResponseBody
    public Integer deleteUser(@RequestParam("userCode") String userCode) {
        System.out.println(userCode);
        Integer count = userService.getUserByRemark(userCode);
//        userService.deleteUser(userCode);
        return count;
    }

    @RequestMapping("/deleteUserTrue")
    public String deleteUserTrue(@RequestParam("userCode") String userCode) {
        System.out.println(userCode);
        userService.updateUser(userCode);
        return "redirect:/user/initUser";
    }


    @RequestMapping("/update")
    public String update(GgUser user) {
        System.out.println(user);
        user.setUpdateDate(new Date());
        userService.updateUser(user);
        return "redirect:/user/initUser";
    }

    @RequestMapping("/retrieveUser")
    public String retrieveUser(Model model, @RequestParam("usercode") String usercode) {
        model.addAttribute("user", userService.getUserByUserCode(usercode));
        return "";
    }

    @RequestMapping("/getUser")
    @ResponseBody
    public GgUser retrieveUser(@RequestParam("usercode") String usercode) {
        return userService.getUserByUserCode(usercode);
    }

    @RequestMapping("/checkUser")
    @ResponseBody
    public boolean checkUser(String userCode){
        GgUser userByUserCode = userService.getUserByUserCode(userCode);
        if(userByUserCode != null) {
            return true;
        }
        return false;
    }


    @RequestMapping(value = "/ChangePassword")
    public void ChangePassword(@RequestBody JSONObject obj,PrintWriter writer,
                                 HttpServletResponse response) {

        String pass = obj.getString("mpass");
        String pass1 = obj.getString("newpass");
        String md5pass = Md5Util.md5(pass);
        String md5pass1 = Md5Util.md5(pass1);
        GgUser ggUser = (GgUser) session.getAttribute("ggUser");
        String result = "";
        if(ggUser.getPassword().equals(md5pass)){
            ggUser.setPassword(md5pass1);
            userService.updateUser(ggUser);
            /*ggUser = userMapper.getUser(ggUser.getUserCode());
            session.setAttribute("ggUser", ggUser);*/
            session.invalidate();
            result = "passwordSuccess";
        }else{
            result = "passwordError";
        }
        writer.write(JSON.toJSONString(result));
    }

    private void getParameter(GgUser user, Map map) {
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
        if (request.getParameter("username") != null) {
            map.put("username", request.getParameter("username"));
        }
        map.put("remark",user.getUserCode());
    }

}
