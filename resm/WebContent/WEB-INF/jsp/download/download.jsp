<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.OutputStream"%>    
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>        
    
<%

	String fileName = (String)request.getAttribute("fileName");
	HSSFWorkbook hwb = (HSSFWorkbook)request.getAttribute("hwb");
	fileName = new String(fileName.getBytes("GBK"), "iso-8859-1");
	response.reset();
	response.setContentType("application/vnd.ms-excel");
	response.addHeader("Content-Disposition","attachment; filename=" + fileName);
	hwb.write(response.getOutputStream());
	out.clear();
	out=pageContext.pushBody(); 
		 

%>