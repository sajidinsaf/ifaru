package com.ifaru.util;

import java.util.*;

/**
 * The StringEx class provides useful methods for replacing sub strings in String classes<br>
 * This supports method provided in CString::Replace defined in MSDN<br>
 * @author Akash Kava
 * */
public class StringEx
{
	
	/**
	 * This function replaces each occurance of specified character with specified String to replace<br>
	 * remember String.replace of java.lang gives facility to replace only one character with matched character<br>
	 * where as this function gives full freedom of replacing it by string.<br>
	 * <br>
	 * For Example,<br>
	 * if you want to replace each occurance of ' '(whitespace) with "&nbsp;" then you can use<br>
	 *		ReplacedString = ac.util.StringEx.replace(OldString,' ',"&nbsp;");<br>
	 * <br>
	 * This may be time and resource consuming for longer strings.<br>
	 * <br>
	 * IMP : Comparison is Case Sensitive<br>
	 * @return String
	 * */
	public static String replace(String strText,char chFind,String strReplace)
	{
		String result = "";
		int i,n = strText.length();
		for(i=0;i<n;i++)
		{
			char ch = strText.charAt(i);
			if(ch!=chFind)
				result += ch;
			else
				result += strReplace;
		}
		return result;
	}

	/**
	 * This function replaces each occurance of specified string with specified String to replace<br>
	 * remember String.replace of java.lang gives facility to replace only one character with matched character<br>
	 * where as this function gives full freedom of replacing it by string.<br>
	 * <br>
	 * For Example,<br>
	 * if you want to replace each occurance of "\r\n" with "&ltg;BR&gt;" then you can use<br>
	 *		ReplacedString = ac.util.StringEx.replace(OldString,"\r\n","&ltg;BR&gt;");<br>
	 * <br>
	 * This may be time and resource consuming for longer strings.<br>
	 * <br>
	 * IMP : Comparison is Case Sensitive<br>
	 * @return String
	 * */
	public static String replace(String strText,String strFind,String strReplace)
	{
		String result = "";
		String text = new String(strText);
		while(true)
		{
			int i = text.indexOf(strFind);
			if(i==-1)
				break;
			result += text.substring(0,i);
			result += strReplace;
			text = text.substring(i+strFind.length());
		}
		result += text;
		return result;
	}

	/**
	 * This function splits string text into tokens by given delimters<br>
	 * <br>
	 * IMP : Comparison is Case Sensitive<br>
	 * @return String []
	 * */
	public static String [] split(String text, String delims)
	{
		StringTokenizer st = new StringTokenizer(text,delims);
		int len = st.countTokens();
		
		String [] tokens = new String [len];
		
		for(int i=0;i<len;i++)
		{
			tokens[i] = st.nextToken();
		}
		return tokens;
	}
}
