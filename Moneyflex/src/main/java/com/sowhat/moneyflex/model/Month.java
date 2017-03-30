package com.sowhat.moneyflex.model;

public class Month {
	private int year;
	private int month;
	//private int[] totalDaysOfMonth = new int[] {0, 31, 28, 31, 30, 31, 30, 31, 31, 30 ,31, 30, 31};
	
	public int getYear()
	{
		return this.year;
	}
	
	public void setYear(int year)
	{
		this.year =year;
	}
	
	public int getMonth()
	{
		return month;
	}
	
	public void setMonth(int month)
	{
		this.month = month;
	}
	
/*	public int getTotalDays()
	{
		return totalDaysOfMonth[month];
	}*/
}
