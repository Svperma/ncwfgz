package com.dsib.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 * ����ת��������
 * 
 * @author 
 * @since 2015-04-30
 * @version 1.0
 */
public class DateUtils {
	public static final String YEAR_TO_DAY_EN = "MMMM d,yyyy";

	public static final String YEAR_TO_DAY_CN = "yyyy��M��d��";

	public static final String YEAR_TO_DAY = "yyyy-MM-dd";

	public static final String YEAR_TO_SECOND = "yyyy-MM-dd HH:mm:ss";

	public static final String HOUR_TO_SECOND = "HH:mm:ss";

	public static final String HOUR_TO_MINUTE = "HH:mm";

	public static final String YEAR_TO_DAY_NO_HYPHEN = "yyyyMMdd";

	/**
	 * ����ָ����ʽ�Դ���ʽ���ص�ǰʱ��
	 * 
	 * @param dateString
	 * @param dateFormat
	 * @return
	 * @throws Exception
	 */
	public static String current(String dateFormat) throws Exception {
		return format(new Date(), dateFormat);
	}

	/**
	 * ��һ�����ڴ���ԭ��ʽת����һ��ָ����ʽ
	 * @param dateString
	 * @param fromFormat
	 * @param toFormat
	 * @return
	 * @throws Exception
	 */
	public static String converFormat(String dateString, String fromFormat,
			String toFormat) throws Exception {
		SimpleDateFormat toSDF = new SimpleDateFormat(toFormat,Locale.US);
		return toSDF.format(parse(dateString, fromFormat));
	}
	
	/**
	 * �����ڴ���ָ����ʽת��Ϊ��Ӧ������
	 * 
	 * @param dateString
	 * @param dateFormat
	 * @return
	 * @throws Exception
	 */
	public static Date parse(String dateString, String dateFormat)
			throws Exception {
		SimpleDateFormat dateformat = new SimpleDateFormat(dateFormat);
		return dateformat.parse(dateString);
	}

	/**
	 * �����ڰ�ָ����ʽת��Ϊ��Ӧ�ַ�
	 * 
	 * @param date
	 * @param dateFormat
	 * @return
	 * @throws Exception
	 */
	public static String format(Date date, String dateFormat) throws Exception {
		SimpleDateFormat dateformat = new SimpleDateFormat(dateFormat,
				Locale.US);
		return dateformat.format(date);

	}

	/**
	 * <p>
	 * ���ܣ���HH:mm:ssת��ָ��ʱ�䣨ʱ���룩������ָ������ƫ��
	 * </p>
	 * 
	 * @param hourToSec
	 *            HH:mm:ss
	 * @param day
	 *            ��Ҫƫ�Ƶ�����
	 * @return Date
	 * @author
	 */
	public static Date getExeTime(String hourToSec, int offset)
			throws Exception {
		Date configTime = DateUtils.parse(hourToSec, DateUtils.HOUR_TO_SECOND);
		Calendar exeCalendar = Calendar.getInstance();
		exeCalendar.setTime(configTime);

		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, exeCalendar
				.get(Calendar.HOUR_OF_DAY));
		calendar.set(Calendar.MINUTE, exeCalendar.get(Calendar.MINUTE));
		calendar.set(Calendar.SECOND, exeCalendar.get(Calendar.SECOND));
		calendar.add(Calendar.DATE, offset);
		return calendar.getTime();
	}

	/**
	 * <p>
	 * ���ܣ���ָ����ʽת��ָ��ʱ�䴮������ָ������ƫ�ƺ󷵻����ڴ�
	 * </p>
	 * 
	 * @param dateString
	 * @param dateFormat
	 * @param offset
	 *            ��Ҫƫ�Ƶ�����
	 * @return String
	 * @author
	 */
	public static String addDay(String dateString, String dateFormat, int offset)
			throws Exception {
		return getOffsetTime(dateString, dateFormat, Calendar.DATE, offset);
	}

	/**
	 * <p>
	 * ���ܣ���ָ������ƫ��
	 * </p>
	 * 
	 * @param date
	 * @param offset
	 *            ��Ҫƫ�Ƶ�����
	 * @return String
	 * @author
	 */
	public static Date addDay(Date date, int offset)
			throws Exception {
		return getOffsetTime(date, Calendar.DATE, offset);
	}

	/**
	 * <p>
	 * ���ܣ���ָ����ʽת��ָ��ʱ�䴮������ָ��ƫ�Ƶ�λ��ƫ����ƫ�ƺ󷵻����ڴ�
	 * </p>
	 * 
	 * @param dateString
	 * @param dateFormat
	 * @param offsetType
	 *            ƫ�����ͣ��μ�Calendar����
	 * @param offset
	 *            ��Ҫƫ�Ƶ�����
	 * @return String
	 * @author
	 */
	public static String getOffsetTime(String dateString, String dateFormat,
			int offsetType, int offset) throws Exception {
		Date date = DateUtils.parse(dateString, dateFormat);
		date = getOffsetTime(date, offsetType, offset);
		return format(date, dateFormat);
	}

	/**
	 * <p>
	 * ���ܣ�����ƫ�ƺ󷵻�����
	 * </p>
	 * 
	 * @param date
	 * @param offset
	 *            ��Ҫƫ�Ƶ�����
	 * @return Date
	 * @author
	 */
	public static Date getOffsetTime(Date date, int offset) throws Exception {
		return getOffsetTime(date, Calendar.DATE, offset);
	}

	/**
	 * <p>
	 * ���ܣ���ָ��ƫ�Ƶ�λ��ƫ����ƫ�ƺ󷵻�����
	 * </p>
	 * 
	 * @param date
	 * @param offsetType
	 *            ƫ�����ͣ��μ�Calendar����
	 * @param offset
	 *            ��Ҫƫ�Ƶ�����
	 * @return Date
	 * @author
	 */
	public static Date getOffsetTime(Date date, int offsetType, int offset)
			throws Exception {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(offsetType, offset);
		return c.getTime();
	}

	/**
	 * <p>
	 * ���ܣ�����������ڸ�ʽ��ת���ɱ�׼��
	 * </p>
	 * 
	 * @param date
	 * @param offsetType
	 *            ƫ�����ͣ��μ�Calendar����
	 * @param offset
	 *            ��Ҫƫ�Ƶ�����
	 * @return DateTime
	 * @author
	 */
	public static Date getDateTime(Date date, int offsetType, int offset)
			throws Exception {

		Calendar calendar = Calendar.getInstance();
		// ת����Calendar��
		calendar.setTime(date);
		// ���day
		calendar.add(offsetType, offset);
		return calendar.getTime();
	}

	/**
	 * <p>
	 * ���ܣ�����������ڸ�ʽ��ת���ɱ�׼��
	 * </p>
	 * 
	 * @param datetime
	 * 
	 * @param offset
	 *            ��Ҫƫ�Ƶ�����
	 * @return DateTime
	 * @author
	 */
	public static Date getDateTime(Date date, int offset) throws Exception {

		Calendar calendar = Calendar.getInstance();
		// ת����Calendar��
		calendar.setTime(date);
		// ���day
		calendar.add(Calendar.DATE, offset);
		return calendar.getTime();
	}
	
	/**	���ܣ����·ݵĵ�һ������һ�� ������
	 *  @param type F:��һ��  L:���һ��
	 *  @param year ��� month�·�
	 * */
	public static Date getFirstOrLastDayOfMonth(String type,String year, String month) {
		Calendar cal = Calendar.getInstance();
		if("F".equals(type)){
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			cal.set(Calendar.MONTH, Integer.parseInt(month) - 1);
			cal.set(Calendar.DATE, 1);
		}else{
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			cal.set(Calendar.MONTH, Integer.parseInt(month) - 1);
			cal.set(Calendar.DATE, 1);
			cal.add(Calendar.MONTH,1);
			cal.add(Calendar.DATE, -1);
		}
		return cal.getTime();
	}
	
	public static void main(String[] args) {
		try {
			// String startTime = DateUtils.format(new Date(),
			// DateUtils.YEAR_TO_DAY_EN);
			// System.out.println(startTime);
			System.out.println(DateUtils.current(DateUtils.YEAR_TO_DAY_EN));
			System.out.println(DateUtils.current(DateUtils.YEAR_TO_DAY));
			System.out.println(DateUtils.current(DateUtils.YEAR_TO_DAY_CN));
			System.out.println(getOffsetTime(getOffsetTime("2015-05-01", "yyyy-MM-dd", Calendar.YEAR, 1), "yyyy-MM-dd", Calendar.DAY_OF_MONTH, -1));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
