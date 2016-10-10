package net.ktds.drink.support;

import javax.servlet.http.HttpServletRequest;

public class Param {
	
	public static String getStringParam( HttpServletRequest request, String paramName ) {
		
		return getStringParam(request, paramName, "");
		
	}
	
	public static String getStringParam( HttpServletRequest request, String paramName, String defaultValue ) {
		
		String value = request.getParameter(paramName);
		
		//paramName?�� null ?��?�� 길이�? 0 ?��?���? defaultValue?�� ""�? 리턴?��?��.
		if( value == null || value.length() == 0 ) {
			value = defaultValue;
		}
		//paramName?�� 값이 ?��?���? �? 값을 리턴?��?��. 
		return value;
				
	}
	
	public static int getIntParam( HttpServletRequest request, String paramName ) {
		//defaultValue?�� 0?�� ?��?��미터�? ?��?�� 리턴?��?��. 
		return getIntParam(request, paramName, 0);
	}
	
	public static int getIntParam( HttpServletRequest request, String paramName, int defaultValue ) {
		
		String value = getStringParam(request, paramName);
		
		try {
			int intValue = Integer.parseInt(value);
			return intValue;
		} catch (NumberFormatException nfe) {
			return defaultValue;
		}
		
		
	}

}
