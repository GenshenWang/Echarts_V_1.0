package com.nomico271.model;

import java.util.Date;

/**
 * Created by wanggenshen_sx on 2017/1/22.
 * 模拟统计上单某件商品销售量和留存率
 */
public class StatisticsInfo {
	//日期
	private Date date;
	//剩下商品数量
	private Integer remainGoods = 0;
	//第一天商品留存率
	private Integer d1Retention = 0;
	//一周后商品留存率
	private Integer d7Retention = 0;
	//一月后商品留存率
	private Integer d28Retention =0;

	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getRemainGoods() {
		return remainGoods;
	}
	public void setRemainGoods(Integer remainGoods) {
		this.remainGoods = remainGoods;
	}
	public Integer getD1Retention() {
		return d1Retention;
	}
	public void setD1Retention(Integer d1Retention) {
		this.d1Retention = d1Retention;
	}
	public Integer getD7Retention() {
		return d7Retention;
	}
	public void setD7Retention(Integer d7Retention) {
		this.d7Retention = d7Retention;
	}
	public Integer getD28Retention() {
		return d28Retention;
	}
	public void setD28Retention(Integer d28Retention) {
		this.d28Retention = d28Retention;
	}
}
