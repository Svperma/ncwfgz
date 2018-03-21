package com.dsib.util;

import com.dsib.entity.GgBuildingmst;
import com.dsib.entity.GgMenu;
import com.dsib.entity.GgUser;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.poi.hssf.usermodel.HSSFBorderFormatting;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

//import com.dsib.entity.GgArrearsMst;
//import com.dsib.entity.GgPaymentPlan;


public class FileUtil {


    static int rowNumPerSheet = 50000;

    /**
     * 将数组内容封装成实体类
     *
     * @param objs bean的各字段的值，数组中值的顺序必须跟实体类中字段定义的顺序一致
     * @return
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     * @throws InstantiationException
     * @throws IllegalArgumentException
     */
    public static Object arrayToBean(Object[] objs, String beanPath) throws Exception {
        Object obj = null;
        Class clazz = null;
        //获取类型
        clazz = Class.forName(beanPath);
        //获取类的构造方法
        Constructor<?> coin[] = clazz.getConstructors();
        for (int i = 0; i < coin.length; i++) {
            Class<?>[] ts = coin[i].getParameterTypes();
            if (ts.length == objs.length) {
                obj = coin[i].newInstance(objs);
                break;
            }
        }
        return obj;
    }

    public static Object generateObject(HttpServletRequest request, Class cla) throws Exception {
        Object obj = cla.newInstance();
        String claName = cla.getSimpleName();
        Method[] methods = cla.getDeclaredMethods();
        for (int i = 0, n = methods.length; i < n; i++) {
            Method m = methods[i];
            String method = m.getName();
            if (method.startsWith("set")) {
                String value = request.getParameter(claName + method.replace("set", ""));

                m.invoke(obj, value);
            } else {
                continue;
            }

        }
        return obj;
    }

    /**
     * @param list  list中的元素是数组，
     * @param index 数组中开始统计的第一个元素的下标
     * @param end   统计结束的最后一个元素的下标，如果为0、负数、大于数组的长度或者小于index，则end等于数组的长度
     * @author xjg
     */
    public static double[] countData(List list, int index, int end) throws Exception {
        double[] data = new double[1];
        if (list != null && list.size() > 0) {
            String[] obj = (String[]) list.get(0);
            if (index - end >= 0 || end < 0 || end > obj.length) {
                end = obj.length;
            }
            data = new double[end - index];
            for (int i = 0; i < list.size(); i++) {
                int m = 0;
                obj = (String[]) list.get(i);
                for (int n = 0; n < obj.length; n++) {
                    if (n >= index && n < end) {
                        data[m] = data[m] + ((obj[n] == null || "null".equals(obj[n].trim())) ? 0.00 : Double.valueOf(((String) obj[n]).trim()));
                        m++;
                    }
                }
            }
        }
        return data;
    }

    /**
     * 生成Excel
     *
     * @author xjg
     */
    public static void exportToExcel(String[] title, List list, Class cla, String excelName, HttpServletResponse response) {
        System.out.println("报表开始：" + System.currentTimeMillis());
        try {
            //创建一个workbook，对应一个Excel
            HSSFWorkbook workBook = new HSSFWorkbook();
            //创建sheet
        /*	HSSFSheet sheet = workBook.createSheet(excelName);
			//标题行
			HSSFRow row = sheet.createRow(0);*/
            //单元格样式
            HSSFCellStyle style = workBook.createCellStyle();
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            //style.setWrapText(true);
            style.setVerticalAlignment(HSSFCellStyle.ALIGN_FILL);
            style.setBorderBottom(HSSFBorderFormatting.BORDER_THIN);
            style.setBorderLeft(HSSFBorderFormatting.BORDER_THIN);
            style.setBorderRight(HSSFBorderFormatting.BORDER_THIN);
            style.setBorderTop(HSSFBorderFormatting.BORDER_THIN);
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

            //标题样式
            HSSFCellStyle titleStyle = workBook.createCellStyle();
            titleStyle.setBorderBottom(HSSFBorderFormatting.BORDER_THIN);
            titleStyle.setBorderLeft(HSSFBorderFormatting.BORDER_THIN);
            titleStyle.setBorderRight(HSSFBorderFormatting.BORDER_THIN);
            titleStyle.setBorderTop(HSSFBorderFormatting.BORDER_THIN);
            titleStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
            titleStyle.setFillForegroundColor(IndexedColors.GREY_50_PERCENT.getIndex());
            HSSFFont font = workBook.createFont();
            font.setBold(true);
            font.setColor(HSSFColor.WHITE.index);
            font.setFontHeightInPoints((short) 12);
            titleStyle.setFont(font);
            titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            String[] strs = new String[title.length];
            //求和
			/*double[] count = null;
			if(isSum){
				count = new double[title.length];
			}*/
            //添加标题
            HSSFCell cell = null;
            String[] titleNames = new String[title.length];
            for (int i = 0; i < title.length; i++) {
                String[] t = title[i].split(":");
                strs[i] = t[0];
				/*cell = row.createCell(i);
				cell.setCellStyle(titleStyle);
				cell.setCellValue(t[1]);*/
                titleNames[i] = t[1];
            }
            //添加内容
            String claName = cla.getSimpleName();
            if (claName.equals("Map")) {
                doMapClass(workBook, list, 1, style, strs, excelName, titleNames);
            } else {
                doObjectClass(workBook, list, 1, cla, style, excelName, titleNames);
            }
			/*if(isSum){
				int sh = sheet.getLastRowNum();
				HSSFRow countRow = sheet.createRow(sh+1);
				HSSFCellStyle cellStyle = workBook.createCellStyle();
				cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
				cellStyle.setBorderBottom(HSSFBorderFormatting.BORDER_THIN);
				cellStyle.setBorderLeft(HSSFBorderFormatting.BORDER_THIN);
				cellStyle.setBorderRight(HSSFBorderFormatting.BORDER_THIN);
				cellStyle.setBorderTop(HSSFBorderFormatting.BORDER_THIN);
				int sumIndex = sheet.addMergedRegion(new CellRangeAddress(sh+1, sh+1,0 , startColumnIndex-1));
				HSSFCell c= countRow.createCell(sumIndex);
				//c.setCellStyle(cellStyle);
				c.setCellValue("合计");
				if(excelName.contains("保险状况")){
					count[7] = count[9]*100/count[8];
				}
				HSSFCell countCell = null;
				for(int i=0;i<count.length;i++){
					if(i >= startColumnIndex){
						countCell = countRow.createCell(i);
						countCell.setCellValue(count[i]);
						countCell.setCellStyle(cellStyle);
					}
				}
			}*/

            downLoadExcel(workBook, response, excelName + ".xls");
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("报表结束：" + System.currentTimeMillis());
    }

    /**
     * 生成Excel,包含多个sheet
     *
     * @author xjg
     */
    public static void exportMultiToExcel(Object[] titles, Object[] lists, Class[] clas, Object[] sheetName, String excelName, HttpServletResponse response) {

        if (lists == null || lists.length < 1) {
            return;
        }
        //创建一个workbook，对应一个Excel
        HSSFWorkbook workBook = new HSSFWorkbook();
        //单元格样式
        HSSFCellStyle style = workBook.createCellStyle();
        style.setBorderBottom(HSSFBorderFormatting.BORDER_THIN);
        style.setBorderLeft(HSSFBorderFormatting.BORDER_THIN);
        style.setBorderRight(HSSFBorderFormatting.BORDER_THIN);
        style.setBorderTop(HSSFBorderFormatting.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        //标题样式
        HSSFCellStyle titleStyle = workBook.createCellStyle();
        titleStyle.setBorderBottom(HSSFBorderFormatting.BORDER_THIN);
        titleStyle.setBorderLeft(HSSFBorderFormatting.BORDER_THIN);
        titleStyle.setBorderRight(HSSFBorderFormatting.BORDER_THIN);
        titleStyle.setBorderTop(HSSFBorderFormatting.BORDER_THIN);
        titleStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
        titleStyle.setFillForegroundColor(IndexedColors.GREY_50_PERCENT.getIndex());
        HSSFFont font = workBook.createFont();
        font.setBold(true);
        font.setColor(HSSFColor.WHITE.index);
        font.setFontHeightInPoints((short) 12);
        titleStyle.setFont(font);
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        for (int index = 0; index < sheetName.length; index++) {
            int rowNum = 1;
            //创建sheet
            String stname = sheetName[index].toString();
            HSSFSheet sheet = workBook.createSheet(stname);
            //标题行
            HSSFRow row = sheet.createRow(0);
            String[] title = (String[]) titles[index];
            String[] strs = new String[title.length];
            //添加标题
            HSSFCell cell = null;
            for (int i = 0; i < title.length; i++) {
                String[] t = title[i].split(":");
                strs[i] = t[0];
                cell = row.createCell(i);
                cell.setCellStyle(titleStyle);
                cell.setCellValue(t[1]);
            }

            Class cla = clas[index];
            for (int c = 0, t = lists.length; c < t; c++) {
                List list = (List) lists[index];
                if (list == null || list.size() < 1) {
                    continue;
                }
                if (cla.getSimpleName().equals("Map")) {
                    //doMapClass(sheet,list,rowNum,style,strs);
                } else {
                    //doObjectClass(sheet, list, rowNum, cla, style);
                }
            }

        }
        try {
            downLoadExcel(workBook, response, excelName + ".xls");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    //根据map对象生成excel内容
    private static void doMapClass(HSSFWorkbook wb, List list, int rowBeginIndex, HSSFCellStyle style, String[] keyName, String sheetName, String[] titles) {
        System.out.println("数据生成开始：" + System.currentTimeMillis());
        HSSFSheet sheet = null;
        HSSFRow row = null;
        HSSFCell cell = null;
        Map<String, Object> map = null;
        //标题样式
        HSSFCellStyle titleStyle = wb.createCellStyle();
        titleStyle.setBorderBottom(HSSFBorderFormatting.BORDER_THIN);
        titleStyle.setBorderLeft(HSSFBorderFormatting.BORDER_THIN);
        titleStyle.setBorderRight(HSSFBorderFormatting.BORDER_THIN);
        titleStyle.setBorderTop(HSSFBorderFormatting.BORDER_THIN);
        titleStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
        titleStyle.setFillForegroundColor(IndexedColors.GREY_50_PERCENT.getIndex());
        HSSFFont font = wb.createFont();
        font.setBold(true);
        font.setColor(HSSFColor.WHITE.index);
        font.setFontHeightInPoints((short) 12);
        titleStyle.setFont(font);
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        int rowInex = 0;
        for (int i = 0, n = list.size(); i < n; i++) {
            if (i % rowBeginIndex == 0 && i % rowNumPerSheet == 0) {
                sheet = wb.createSheet(sheetName + (i / rowBeginIndex));
                row = sheet.createRow(0);
                for (int m = 0; m < titles.length; m++) {
                    cell = row.createCell(m);
                    cell.setCellStyle(titleStyle);
                    cell.setCellValue(titles[m]);
                }
                rowInex = rowNumPerSheet * (i / rowNumPerSheet);
            }
            row = sheet.createRow(rowBeginIndex + i - rowInex);
            map = (Map<String, Object>) list.get(i);
            for (int m = 0, l = keyName.length; m < l; m++) {
                cell = row.createCell(m);
                cell.setCellStyle(style);
                cell.setCellValue(map.get(keyName[m]) == null ? "" : map.get(keyName[m]).toString());
            }
			/*for(int m=0,l=keyName.length;m<l;m++){
				sheet.autoSizeColumn(m);
			}*/
        }
        System.out.println("数据生成结束：" + System.currentTimeMillis());
    }

    //根据实体类对象生成excel内容
    private static void doObjectClass(HSSFWorkbook wb, List list, int rowBeginIndex, Class cla, HSSFCellStyle style, String sheetName, String[] titles) {
        try {
            Method[] methods = cla.getDeclaredMethods();
            Object obj = cla.newInstance();
            HSSFSheet sheet = null;
            HSSFRow row = null;
            HSSFCell cell = null;
            //标题样式
            HSSFCellStyle titleStyle = wb.createCellStyle();
            titleStyle.setBorderBottom(HSSFBorderFormatting.BORDER_THIN);
            titleStyle.setBorderLeft(HSSFBorderFormatting.BORDER_THIN);
            titleStyle.setBorderRight(HSSFBorderFormatting.BORDER_THIN);
            titleStyle.setBorderTop(HSSFBorderFormatting.BORDER_THIN);
            titleStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
            titleStyle.setFillForegroundColor(IndexedColors.GREY_50_PERCENT.getIndex());
            HSSFFont font = wb.createFont();
            font.setBold(true);
            font.setColor(HSSFColor.WHITE.index);
            font.setFontHeightInPoints((short) 12);
            titleStyle.setFont(font);
            titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            int rowInex = 0;
            for (int m = 0; m < list.size(); m++) {
                if (m % rowBeginIndex == 0 && m % rowNumPerSheet == 0) {
                    sheet = wb.createSheet(sheetName + (m / rowBeginIndex));
                    row = sheet.createRow(0);
                    for (int i = 0; i < titles.length; i++) {
                        cell = row.createCell(i);
                        cell.setCellStyle(titleStyle);
                        cell.setCellValue(titles[i]);
                    }
                    rowInex = rowNumPerSheet * (m / rowNumPerSheet);
                }
                obj = list.get(m);
                if (obj == null) {
                    continue;
                }
                row = sheet.createRow(rowBeginIndex + m - rowInex);
                for (int i = 0; i < methods.length; i++) {
                    Method method = methods[i];
                    String mName = method.getName();
                    if (mName.startsWith("get")) {
                        Object o = method.invoke(obj);
                        cell = row.createCell(i);
                        cell.setCellStyle(style);
                        cell.setCellValue(o == null ? "" : o.toString());
                    }
                }
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    //下载报表
    public static void downLoadExcel(HSSFWorkbook workBook, HttpServletResponse response, String fileName) throws Exception {
        String ieType = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getHeader("USER-AGENT");
        OutputStream out = response.getOutputStream();
        if (ieType.indexOf("Firefox") > 0) {
            response.setHeader("Content-disposition", "attachment;fileName=\"" + new String(fileName.getBytes("GB2312"), "ISO-8859-1") + "\"");
        } else {
            response.setHeader("Content-disposition", "attachment;fileName=\"" + URLEncoder.encode(fileName, "UTF-8") + "\"");
        }
        response.setContentType("application/msexcel;charset=UTF-8");
        workBook.write(out);
        out.close();
    }

    /**
     * 上传文件
     *
     * @param fileData
     */
    public static String uploadFile(MultipartFile fileData, HttpServletRequest request) {
        //获取文件名
        String fileName = fileData.getOriginalFilename();
        if (fileName == null || "".equals(fileName)) {
            return null;
        }
        //获取文件的后缀名
        String subfix = fileName.substring(fileName.lastIndexOf("."));
        //重命名文件
        String newFileName = System.currentTimeMillis() + subfix;
        //读取配置文件
        String url = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
        PropertiesUtil propertiesUtil = new PropertiesUtil(url.replaceFirst("/", "") + "configure.properties");
        //ftp参数
        String serverName = propertiesUtil.getProperty("servername");
        String ftpUrl = propertiesUtil.getProperty("ftp.ftpurl");
        String port = propertiesUtil.getProperty("ftp.port");
        String userName = propertiesUtil.getProperty("ftp.username");
        String password = propertiesUtil.getProperty("ftp.password");

        //文件保存的路径
        String remotePath = serverName + "/image/azbxImage/" + String.valueOf(request.getServerPort()) + "/" + newFileName;

        FTPClient client = new FTPClient();
        try {
            //文件输入流
            InputStream in = fileData.getInputStream();
            //连接ftp

            client.connect(ftpUrl, Integer.valueOf(port));
            client.login(userName, password);

            int reply = client.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                client.disconnect();
                System.err.println("连接失败");
            }
            client.changeWorkingDirectory("/");
            client.setFileType(FTPClient.BINARY_FILE_TYPE);
            client.enterLocalPassiveMode();
            client.storeFile("/azbxImage/" + String.valueOf(request.getServerPort()) + "/" + newFileName, in);
            in.close();
            client.logout();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (client.isConnected()) {
                try {
                    client.disconnect();
                } catch (IOException ioe) {
                }
            }
        }

        return remotePath;
    }

    /**
     * 多文件上传
     *
     * @param request
     * @return
     */
    public static List<String> uploadMultiFiles(HttpServletRequest request) {
        List<String> list = new ArrayList<String>();
        //多文件上传解析器
        CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //判断是否是多文件上传
        if (resolver.isMultipart(request)) {
            //把request转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            //迭代器
            Iterator<String> it = multiRequest.getFileNames();
            MultipartFile file = null;
            String pathName = "";
            while (it.hasNext()) {
                file = multiRequest.getFile(it.next());
                pathName = uploadFile(file, request);
                list.add(pathName);
            }
        }
        return list;
    }

    /**
     * 批量导入
     *
     * @param in        输入流
     * @param rowIndex  开始遍历行下标
     * @param cellIndex 开始遍历的列下标
     * @return
     */
    public static List<Object[]> batchImport(InputStream in, int rowIndex, int cellIndex) {

        try {
            //得到excel
            HSSFWorkbook workBook = new HSSFWorkbook(in);
            //获取第一个sheet
            HSSFSheet sheet = workBook.getSheetAt(0);
            //获取第一行
            HSSFRow firstRow = sheet.getRow(0);
            //获取每行的列数
            int cellNum = firstRow.getPhysicalNumberOfCells();
            //获取行数
            int rowNum = sheet.getPhysicalNumberOfRows();

            List<Object[]> list = new ArrayList<Object[]>();
            //object数组，接收每行的值
            Object[] objs = null;
            HSSFRow row = null;
            HSSFCell cell = null;
            for (int i = rowIndex; i < rowNum; i++) {
                objs = new Object[cellNum - cellIndex];
                row = sheet.getRow(i);
                for (int c = cellIndex, m = 0; c < cellNum; c++, m++) {
                    cell = row.getCell(c);
                    if (cell == null) {
                        objs[m] = "";
                        continue;
                    }
                    int type = cell.getCellType();
                    switch (type) {
                        case HSSFCell.CELL_TYPE_BLANK:
                            objs[m] = "";
                            break;
                        case HSSFCell.CELL_TYPE_BOOLEAN:
                            objs[m] = cell.getBooleanCellValue();
                            break;
                        case HSSFCell.CELL_TYPE_FORMULA:
                            objs[m] = cell.getCellFormula();
                            break;
                        case HSSFCell.CELL_TYPE_NUMERIC:
                            objs[m] = cell.getNumericCellValue();
                            break;
                        case HSSFCell.CELL_TYPE_STRING:
                            objs[m] = cell.getStringCellValue();
                            break;
                        default:
                            objs[m] = cell.getDateCellValue();
                            break;
                    }
                }
                list.add(objs);
            }
            return list;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }

    }

    public static String listToMenuJson(List<GgMenu> list) {
        try {
            StringBuffer navs = new StringBuffer(100);
            if (list != null && list.size() > 0) {
                //navs.append("[");
                for (int i = 0; i < list.size(); i++) {
                    GgMenu ggMenu = list.get(i);
                    if (!ggMenu.getMenuLevel().equals("1")) continue;
                    navs.append("{");
                    navs.append("'title':'" + ggMenu.getMenuName() + "',");
                    navs.append("'icon':'" + ggMenu.getIcon() + "',");
                    if (ggMenu.getActionUrl() != null && !"".equals(ggMenu.getActionUrl()) && !"null".equals(ggMenu.getActionUrl())) {
                        navs.append("'href':'" + ggMenu.getActionUrl() + "',");
                    }
                    if (ggMenu.getFlag() != null && !"".equals(ggMenu.getFlag())) {
                        navs.append("'flag':'true',");
                    }
                    if (i == 0) {
                        navs.append("'spread':'true'");
                    } else {
                        navs.append("'spread':'false'");
                    }
                    if (ggMenu.getChildList() != null && ggMenu.getChildList().size() > 0) {
                        StringBuffer sb = new StringBuffer(100);
                        for (int n = 0; n < ggMenu.getChildList().size(); n++) {
                            GgMenu gm = ggMenu.getChildList().get(n);
                            if (gm.getUpperCode().equals(ggMenu.getMenuCode())) {
                                sb.append("{");
                                sb.append("'title':'" + gm.getMenuName() + "',");
                                sb.append("'icon':'" + gm.getIcon() + "',");
                                sb.append("'href':'" + gm.getActionUrl() + "'");
                                sb.append("}*");
                            }
                        }
                        if (sb.length() > 0) {
                            navs.append(",'children':\"[" + sb.substring(0, sb.lastIndexOf("*")) + "]\"");
                        }
                    }
                    navs.append("};");
                }
                //navs.append("{}]");
            }
            return navs.toString();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "";
    }
//
//	public static List<GgArrearsMst> importFromExcel(HSSFSheet sheet, StringBuffer msg, GgUser ggUser) throws Exception{
//		List<GgArrearsMst> list = new ArrayList<GgArrearsMst>();
//		HSSFRow row = sheet.getRow(0);
//		int length = row.getPhysicalNumberOfCells();
//		HSSFCell cell = null;
//		String[] properties = new String[length];
//		//获取标题
//		for(int i=0;i<length;i++){
//			cell = row.getCell(i);
//			properties[i] = cell.getStringCellValue().split(":")[1];
//		}
//		String datePattern = "^\\d{4}\\D+\\d{2}\\D+\\d{2}$";
//		String numberPattern = "^\\d+(\\.\\d+)?$";
//		Class<GgArrearsMst> cla = GgArrearsMst.class;
//		int rowcount= sheet.getPhysicalNumberOfRows();
//		String propertyName = "";
//		String value = "";
//		Method method = null;
//		Field field = null;
//		String fieldType = null;
//		Object paramValue = null;
//		GgArrearsMst obj = null;
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		for(int n=1;n<rowcount;n++){
//			row = sheet.getRow(n);
//			if(row == null) break;
//			obj = new GgArrearsMst();
//			for(int i=0;i<length;i++){
//				propertyName = properties[i];
//				cell = row.getCell(i);
//				int x = 1;
//				if(cell == null) {
//					continue;
//				}
//				value = getCellValue(cell);
//				if("".equals(value) || value == null){
//					if(i == 0) obj = null;
//					continue;
//				}
//				if("casekind".equals(propertyName)){
//					value = value.substring(0, 1);
//				}
//				if("gradegov".equals(propertyName)){
//					value = value.substring(0, 1);
//				}
//				if("city".equals(propertyName)){
//					value = value.substring(value.length()-6);
//				}
//				if("county".equals(propertyName)){
//					value = value.substring(0, 6);
//				}
//				if("arrearsreason".equals(propertyName)){
//					value = value.substring(0, 1);
//				}
//				if("arrearskind".equals(propertyName)){
//					value = value.substring(0, 1);
//				}
//				field = cla.getDeclaredField(propertyName);
//				fieldType = field.getType().getSimpleName();
//				if("Date".equals(fieldType)){
//					if(!Pattern.matches(datePattern, value)){
//						msg.append("第"+(n+1)+"行，第"+(i+1)+"列日期格式不正确");
//						return null;
//					}
//					paramValue = format.parse(value);
//				}else if("BigDecimal".equals(fieldType)){
//					if(!Pattern.matches(numberPattern, value)){
//						msg.append("第"+(n+1)+"行，第"+(i+1)+"列数字格式不正确");
//						return null;
//					}
//					if(value.length() > 16){
//						msg.append("第"+(n+1)+"行，第"+(i+1)+"列数字超长，请控制在16位以内");
//					}
//					paramValue = new BigDecimal(value);
//				}else{
//					paramValue = value;
//				}
//				method = cla.getDeclaredMethod("set"+propertyName.substring(0, 1).toUpperCase()+propertyName.substring(1), field.getType());
//				method.invoke(obj, paramValue);
//				switch (ggUser.getComLevel()){
//					case "1":
//						obj.setGradegov("1");
//						break;
//					case "2":
//						obj.setGradegov("2");
//						obj.setCity(ggUser.getCity());
//						break;
//					case "3":
//						obj.setGradegov("3");
//						obj.setCity(ggUser.getCity());
//						obj.setCounty(ggUser.getCounty());
//				}
//			}
//			if(obj != null)
//			list.add(obj);
//			obj = null;
//		}
//		return list;
//	}

//	public static List<GgPaymentPlan> importPlanFromExcel(HSSFSheet sheet,StringBuffer msg){
//		List<GgPaymentPlan> list = new ArrayList<GgPaymentPlan>();
//		int rowCount = sheet.getPhysicalNumberOfRows();
//		GgPaymentPlan plan = null;
//		HSSFRow row = null;
//		HSSFCell cell = null;
//		String numberPattern = "^\\d+(\\.\\d+)?$";
//		String value = "";
//		for(int n=1;n<rowCount;n++){
//			row = sheet.getRow(n);
//			for(int i=0;i<4;i++){
//				plan = new GgPaymentPlan();
//				cell = row.getCell(i);
//				value = cell.getStringCellValue();
//				if(!Pattern.matches(numberPattern, value)){
//					msg.append("第"+(n+1)+"行，第"+(i+1)+"列数字格式不正确");
//					return null;
//				}
//				plan.setPayamount(new BigDecimal(value));
//				plan.setPayyear(2016+i);
//				list.add(plan);
//			}
//		}
//		return list;
//	}

    private static String getCellValue(HSSFCell cell) {
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

    public static boolean is18ByteIdCard(String idCard){
        Pattern pattern1 = Pattern.compile("^(\\d{6})(19|20)(\\d{2})(1[0-2]|0[1-9])(0[1-9]|[1-2][0-9]|3[0-1])(\\d{3})(\\d|X|x)?$"); //粗略的校验
        Matcher matcher = pattern1.matcher(idCard);
        if(matcher.matches()){
            return true;
        }
        return false;
    }

    public static List<GgBuildingmst> importExcel(HSSFSheet sheet, GgUser user) throws Exception {
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
            HSSFCell cell = row.getCell(0);
            buildingmst.setHouseholder(getValueByType(cell));
            HSSFCell cell1 = row.getCell(1);
                String identityid = getValueByType(cell1);
                boolean flag = is18ByteIdCard(identityid);
                if(flag) {
                    buildingmst.setIdentityid(identityid);
                }else{
                    throw new Exception("第" + rowNum + "行第1列身份证号错误");
                }
            HSSFCell cell2 = row.getCell(2);
            buildingmst.setPeoplenumber(Integer.valueOf(getValueByType(cell2)));
            HSSFCell cell3 = row.getCell(3);
            String value = getValueByType(cell3);
            buildingmst.setType(value.split(",")[0]);

            HSSFCell cell4 = row.getCell(4);
            buildingmst.setGrade(getValueByType(cell4).split(",")[0]);
            buildingmst.setSunamount(Integer.valueOf((getValueByType(cell4).split(",")[0])));
            HSSFCell cell5 = row.getCell(5);
            buildingmst.setStartyear(getValueByType(cell5).split(",")[0]);
            HSSFCell cell6 = row.getCell(6);
            buildingmst.setBank(getValueByType(cell6).split(",")[0]);
            HSSFCell cell7 = row.getCell(7);
            buildingmst.setAccount(getValueByType(cell7).split(",")[0]);
            HSSFCell cell8 = row.getCell(8);
            buildingmst.setProgress(getValueByType(cell8).split(",")[0]);
            HSSFCell cell9 = row.getCell(9);
            buildingmst.setFinishamount(Integer.valueOf((getValueByType(cell9))));
            HSSFCell cell10 = row.getCell(10);
            buildingmst.setFinishstatus(getValueByType(cell10).split(",")[0]);

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

    private static String getValueByType(HSSFCell cell) {
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
