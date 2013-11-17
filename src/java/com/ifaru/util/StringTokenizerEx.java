package com.ifaru.util;

import java.util.*;

/**
 * StringTokenizer Function of java.util package doesnt provide many tokenizing formates directly to parse data<br>
 * however there exits other tokenizers but quite complex to understand and implement<br>
 * <br>
 * This class does same as what StringTokenizer Does but interface is a bit differetn.<br>
 * */
public class StringTokenizerEx
{
	/**
	 * Private variable so you dont need to know for what it is.
	 * */
	Vector tokens = new Vector();
	
	/**
	 * @return int size of tokens
	 * */
	public int getSize()
	{
		return tokens.size();
	}
	
	/**
	 * Parses string, see tokenize(String,String,String) for details<br>
	 * this function is equivalent to tokenize(String,""," \r\n\t")<br>
	 * @see ac.util.StringTokenizertokenize#3
	 * */
	public void tokenize(String text)
	{
		tokenize(text," \r\n\t");
	}
	
	/**
	 * Parses string, see tokenize(String,String,String) for details.<br>
	 * this function is equivalent to tokenize(String,"",String)<br>
	 * */
	public void tokenize(String text,String delim)
	{
		tokenize(text,"",delim);
	}
	
	/**
	 * Well take a look at following data<br>
	 * User ackava "Akash Kava" <br>
	 * The above data has 3 tokens [User] [ackava] [Akash Kava], we often use " for packing data with white spaces.<br>
	 * StringTokenizer does not give this functionality<br>
	 * <br>
	 * But StringTokenizerEx does give. you can use StringTokenizerEx.tokenize(data,""," \r\t\n")<br>
	 * <br>
	 * Take a look at another data<br>
	 * User.ackava name."Akash Kava" NothingAttachedToMe "Nothing With me as well"<br>
	 * here I want tokens to be [User] [.] [ackava] [name] [.] [Akash Kava] [NothingAttachedToMe] [Nothing With me as well]<br>
	 * here I want [.] as delimitor and as well as return for token.<br>
	 * <br>
	 * you can use StringTokenizerEx.tokenize(data,"."," \r\t\n")<br>
	 * */
	public void tokenize(String text,String retdelim,String delim)
	{
		try
		{
			tokens.removeAllElements();
		}catch(Exception e){}
		int nLength = text.length();
		int i = 0;
		char ch;
		boolean bOn = false;
		
		String token = "";
		
		for(i=0;i<nLength;i++)
		{
			ch = text.charAt(i);
			switch(ch)
			{
			case '"':
				if(bOn)
				{
					if(i<nLength-1)
					{
						if(text.charAt(i+1)=='"')
						{
							i++;
							token += '"';
							continue;
						}
					}
					bOn = false;
					if(token.length()>0)
					{
						tokens.addElement(token);
						token = "";
					}
				}
				else
				{
					bOn = true;
				}
				break;
			default:
				if(bOn)
				{
					token += ch;
					continue;
				}
				if(retdelim.indexOf(ch)!=-1)
				{
					if(token.length()>0)
					{
						tokens.addElement(token);
						token = "";
					}
					tokens.addElement(String.valueOf(ch));
					continue;
				}
				if(delim.indexOf(ch) == -1)
				{
					token += ch;
				}
				else
				{
					if(token.length()>0)
					{
						tokens.addElement(token);
						token = "";
					}
				}
			}
		}
		if(token.length()>0)
			tokens.addElement(token);
	}
	
	/**
	 * Returns token at this index, call getSize() to number of tokens found.<br>
	 * */
	public String getAt(int nIndex)
	{
		if(nIndex >= tokens.size())
			return null;
		return (String)tokens.elementAt(nIndex);
	}
}
