package com.gjc.hrm.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
    public static Date DateChangeAndAdd(String time) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date endDate = null;
        try {
            endDate = format.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Calendar c = Calendar.getInstance();
        c.setTime(endDate);
        c.add(Calendar.DAY_OF_MONTH, 1);// +1天
        Date d = c.getTime();
        return d;
    }
}
