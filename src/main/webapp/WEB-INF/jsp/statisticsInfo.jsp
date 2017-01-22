<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: wanggenshen_sx
  Date: 2017/1/22
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品信息统计</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script src="//cdn.bootcss.com/echarts/3.3.2/echarts.min.js"></script>
    <script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>

    <!--折线图显示-->
    <div class="box">
        <div class="box-header">
           [ --------图表显示-------------]
        </div>
        <div class="box-body">
            <div id="echarts-line" style="height: 400px; width :800px;"></div>
        </div>
    </div>

    <!--Table表格显示-->
    <div class="row">
        <div class="col-xs-12">

            <div class="box">
                <div class="box-header">
                    [ --------商品信息统计-------------]
                </div>
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-echarts" style="width: 800px">
                            <thread>
                                <tr>
                                    <th>日期</th>
                                    <th>商品剩余</th>
                                    <th>商品一日留存率</th>
                                    <th>商品一周留存率</th>
                                    <th>商品一月日留存率</th>
                                </tr>
                            </thread>
                            <tbody>
                            <c:forEach var="info" items="${statisticsInfo}">
                                <tr>
                                    <td class="td-date"><fmt:formatDate value="${info.date}" pattern="yyyy-MM-dd"/></td>
                                    <td class="td-remainGoods">${info.remainGoods}</td>
                                    <td class="td-d1Retention">${info.d1Retention}</td>
                                    <td class="td-d7Retention">${info.d7Retention}</td>
                                    <td class="td-d28Retention">${info.d28Retention}</td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
            $(function () {
                var echartsDate = [];
                var ehcartsRemainGoods= [];
                var echartsD1Retention= [];
                var echartsD7Retention= [];
                var echartsD28Retention= [];

                $(".table-echarts tbody tr").each(function () {
                    echartsDate.push($(this).find(".td-date").html());
                    ehcartsRemainGoods.push($(this).find(".td-remainGoods").html());
                    echartsD1Retention.push($(this).find(".td-d1Retention").html());
                    echartsD7Retention.push($(this).find(".td-d7Retention").html());
                    echartsD28Retention.push($(this).find(".td-d28Retention").html());
                });
                
                var lineEchart = echarts.init(document.getElementById('echarts-line'));
                option = {
                    title: {
                        text: '商品信息统计'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data:['商品剩余','商品一日留存率','商品一周留存率','商品一月留存率']
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data:echartsDate
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            name:'商品剩余',
                            type:'line',
                            stack: '总量',
                            data:ehcartsRemainGoods
                        },
                        {
                            name:'商品一日留存率',
                            type:'line',
                            stack: '总量',
                            data:echartsD1Retention
                        },
                        {
                            name:'商品一周留存率',
                            type:'line',
                            stack: '总量',
                            data:echartsD7Retention
                        },
                        {
                            name:'商品一月留存率',
                            type:'line',
                            stack: '总量',
                            data:echartsD28Retention
                        }
                    ]
                };

                lineEchart.setOption(option);

            })
    </script>
</body>
</html>
