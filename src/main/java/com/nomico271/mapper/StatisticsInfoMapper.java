package com.nomico271.mapper;

import com.nomico271.model.StatisticsInfo;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by wanggenshen_sx on 2017/1/22.
 */
public interface StatisticsInfoMapper {

	@Select("select date,remain_goods as remainGoods,d1_retention as d1Retention," +
			"d7_retention as d7Retention,d28_retention as d28Retention from statisticsinfo")
	List<StatisticsInfo> listAll();
}
