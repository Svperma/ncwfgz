package com.dsib.util;

import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Field;
import java.util.Date;

import javax.swing.text.html.HTMLDocument.HTMLReader.IsindexAction;

public final class SQLUtil {

	/**
	 * 根据实体类生成SQL语句（条件）
	 * @param cla
	 * @return
	 * @throws IllegalAccessException 
	 * @throws Exception 
	 */
	public static String getSqlCondition(Object obj) throws Exception{
		StringBuffer sql = new StringBuffer(100);
		//获取类中声明的字段
		Field[] fields = obj.getClass().getDeclaredFields();
		if(fields == null || fields.length == 0){
			return "";
		}
		//设置字段属性为可以访问
		AccessibleObject.setAccessible(fields, true);
		//遍历字段
		for(int i=0;i<fields.length;i++){
			Field f = fields[i];
			if(f.get(obj) != null && String.class.isInstance(f.get(obj))){
				sql.append(" and "+f.getName()+" = '"+f.get(obj).toString()+"'");
			}else if(f.get(obj) != null && double.class.isInstance(f.get(obj))){
				sql.append(" and "+f.getName()+" = "+f.get(obj));
			}else if(f.get(obj) != null && int.class.isInstance(f.get(obj))){
				sql.append(" and "+f.getName()+" = "+f.get(obj));
			}else if(f.get(obj) != null && float.class.isInstance(f.get(obj))){
				sql.append(" and "+f.getName()+" = "+f.get(obj));
			}else if(f.get(obj) != null && Byte.class.isInstance(f.get(obj))){
				sql.append(" and "+f.getName()+" = "+f.get(obj));
			}else if(f.get(obj) != null && Character.class.isInstance(f.get(obj))){
				sql.append(" and "+f.getName()+" = '"+f.get(obj)+"'");
			}else if(f.get(obj) != null && Long.class.isInstance(f.get(obj))){
				sql.append(" and "+f.getName()+" = "+f.get(obj));
			}else if(f.get(obj) != null && Date.class.isInstance(f.get(obj))){
				sql.append(" and "+f.getName()+" = '"+(Date)f.get(obj)+"'");
			}
		}
		return sql.toString().replace("and serialVersionUID = 1", "");
	}
}
