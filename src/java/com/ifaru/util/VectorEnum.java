package com.ifaru.util;

public class VectorEnum extends java.util.Vector 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7992333107428265742L;
	int nCurrentElement = 0;
	
	// Reset Enumerator
	public synchronized void reset()
	{
		nCurrentElement = 0;
	}
	
	public Object next()
	{
		if(nCurrentElement >= elementCount)
			return null;
		return elementData[nCurrentElement++];
	}
	
	public Object nextReset()
	{
		if(nCurrentElement >= elementCount)
		{
			if(elementCount==0)
				return null;
			nCurrentElement = 0;
		}
		return elementData[nCurrentElement++];
	}
}
