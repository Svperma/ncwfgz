package com.dsib.controller;

import com.dsib.dto.UpdateBuildingMst;
import com.dsib.entity.GgMenu;
import com.dsib.entity.GgUser;
import com.dsib.service.GgMenuService;
import com.dsib.service.GgUserService;
import com.dsib.util.FileUtil;
import com.dsib.util.Md5Util;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/loginController")
public class GgLoginController extends BaseController {

    private static final String SYSTEM_SEPARATOR = System.getProperty("file.separator");

    @Resource(name = "ggUserService")
    private GgUserService ggUserService;
    @Resource(name = "ggMenuService")
    private GgMenuService ggMenuService;

    @RequestMapping("/login")
    public void login(@RequestBody GgUser ggUser) {
        String returnStr = "";
        String pwd = ggUser.getPassword();
        ggUser = ggUserService.getUserByUserCode(ggUser.getUserCode());
        if (ggUser != null && !"".equals(ggUser)) {
            String pwdMD5 = Md5Util.md5(pwd);
            String password = ggUser.getPassword();
            if (pwdMD5.equals(password)) {
                String role = ggUser.getRole();
                if ("admin".equals(role)) {
                    returnStr = "admin";
                } else {
                    List<GgMenu> menuList = ggMenuService.listMenus(ggUser.getRole());
                    String menuStr = FileUtil.listToMenuJson(menuList);
                    session.setAttribute("menuList", menuStr);
                    returnStr = "succ";
                }
                session.setAttribute("ggUser", ggUser);
            } else {
                returnStr = "pwdError";
            }
        } else {
            returnStr = "userCodeError";
        }
        try {
            PrintWriter out = response.getWriter();
            JSONObject jo = JSONObject.fromObject("{'str':'" + returnStr + "'}");
            out.write(jo.toString());
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/quit")
    public String quitlogin() {
        session.invalidate();
        return "/login";
    }

    /**
     * 下载操作手册
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/download")
    public ResponseEntity<byte[]> downloadFile() throws IOException {
        System.out.println();
        String path = request.getSession().getServletContext()
                .getRealPath(SYSTEM_SEPARATOR) + "files" + SYSTEM_SEPARATOR + "操作手册.doc";
        System.out.println(path);
        File file = new File(path);
        String fileName = path.substring(path.lastIndexOf("\\" )+ 1);
        HttpHeaders headers = new HttpHeaders();
        fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }

}
