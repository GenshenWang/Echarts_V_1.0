package com.nomico271.controller;

import com.nomico271.mapper.StatisticsInfoMapper;
import com.nomico271.model.StatisticsInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by wanggenshen_sx on 2017/1/22.
 */
@Controller
public class StatisticsInfoController {

	@Autowired
	StatisticsInfoMapper statisticsInfoMapper;

	@RequestMapping(value="/",method = RequestMethod.GET)
	public ModelAndView index(){
		return new ModelAndView("index");
	}

	@RequestMapping(value = "showStatisticsInfo",method = RequestMethod.GET)
	public ModelAndView showStatisticsInfo(){
		List<StatisticsInfo> statisticsInfo = statisticsInfoMapper.listAll();
		return new ModelAndView("statisticsInfo")
					.addObject("statisticsInfo",statisticsInfo);
	}
}
