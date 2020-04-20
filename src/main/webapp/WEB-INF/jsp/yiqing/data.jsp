<%@ page import="com.ruixin.bean.Yiqing" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>map</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <link rel="stylesheet" href="${ctxStatic}/css/layui.css"  media="all">
    <div class="layui-row layui-col-space1" style="margin-top: 20px">
        <div class="layui-col-md3" style="margin-left: 160px;">
            <div class="grid-demo grid-demo-bg1">
                <a class="logo" style="left: 0;" href="#">
                    <span style="font-size: 18px;">累计确诊人数：${confirmedSum}<br></span>
                </a>
                <a class="logo" style="left: 0;" href="#">
                    <span style="font-size: 18px;">较昨日：+：${confirmedPlus}</span>
                </a>
            </div>
        </div>
        <div class="layui-col-md3">
            <div class="grid-demo">
                <a class="logo" style="left: 0;" href="#">
                    <span style="font-size: 18px;">累计治愈人数：${curesSum}<br></span>
                </a>
                <a class="logo" style="left: 0;" href="#">
                    <span style="font-size: 18px;">较昨日：+：${curesPlus}</span>
                </a>
            </div>
        </div>
        <div class="layui-col-md3">
            <div class="grid-demo grid-demo-bg1">
                <a class="logo" style="left: 0;" href="#">
                    <span style="font-size: 18px;">累计死亡人数：${deathsSum}<br></span>
                </a>
                <a class="logo" style="left: 0;" href="#">
                    <span style="font-size: 18px;">较昨日：+：${deathsPlus}</span>
                </a>
            </div>
        </div>
    </div>
    <script src="${ctxStatic}/dist/echarts.js"></script>
    <script src="${ctxStatic}/map/js/china.js"></script>
    <style>
        *{margin:0;padding:0}
        html,body{
            width:100%;
            height:100%;
        }
        #main{
            width:800px;
            height:600px;
            margin: 150px auto;
            border:1px solid #ddd;
        }
        /*默认长宽比0.75*/
    </style>
</head>
<body>
<div id="main">

</div>
<script type="text/javascript">
    <% List<Yiqing> list = (List<Yiqing>)request.getAttribute("data");%>
    var dataList=[
        {name:'<%=list.get(0).getProvinceName()%>', value: <%=list.get(0).getConfirmedNum()%> ,nowNum:<%=list.get(0).getNowNum()%>  , curesNum: <%=list.get(0).getCuresNum()%> , deathsNum: <%=list.get(0).getDeathsNum()%>},
        {name: '<%=list.get(1).getProvinceName()%>', value: <%=list.get(1).getConfirmedNum()%> ,nowNum:<%=list.get(1).getNowNum()%>  , curesNum: <%=list.get(1).getCuresNum()%> , deathsNum: <%=list.get(1).getDeathsNum()%>},
        {name:'<%=list.get(2).getProvinceName()%>', value: <%=list.get(2).getConfirmedNum()%> ,nowNum:<%=list.get(2).getNowNum()%>  , curesNum: <%=list.get(2).getCuresNum()%> , deathsNum: <%=list.get(2).getDeathsNum()%>},
        {name:'<%=list.get(3).getProvinceName()%>', value: <%=list.get(3).getConfirmedNum()%> ,nowNum:<%=list.get(3).getNowNum()%>  , curesNum: <%=list.get(3).getCuresNum()%> , deathsNum: <%=list.get(3).getDeathsNum()%>},
        {name:'<%=list.get(4).getProvinceName()%>', value: <%=list.get(4).getConfirmedNum()%> ,nowNum:<%=list.get(4).getNowNum()%>  , curesNum: <%=list.get(4).getCuresNum()%> , deathsNum: <%=list.get(4).getDeathsNum()%>},
        {name:'<%=list.get(5).getProvinceName()%>', value: <%=list.get(5).getConfirmedNum()%> ,nowNum:<%=list.get(5).getNowNum()%>  , curesNum: <%=list.get(5).getCuresNum()%> , deathsNum: <%=list.get(5).getDeathsNum()%>},
        {name:'<%=list.get(6).getProvinceName()%>', value: <%=list.get(6).getConfirmedNum()%> ,nowNum:<%=list.get(6).getNowNum()%>  , curesNum: <%=list.get(6).getCuresNum()%> , deathsNum: <%=list.get(6).getDeathsNum()%>},
        {name:'<%=list.get(7).getProvinceName()%>', value: <%=list.get(7).getConfirmedNum()%> ,nowNum:<%=list.get(7).getNowNum()%>  , curesNum: <%=list.get(7).getCuresNum()%> , deathsNum: <%=list.get(7).getDeathsNum()%>},
        {name:'<%=list.get(8).getProvinceName()%>', value: <%=list.get(8).getConfirmedNum()%> ,nowNum:<%=list.get(8).getNowNum()%>  , curesNum: <%=list.get(8).getCuresNum()%> , deathsNum: <%=list.get(8).getDeathsNum()%>},
        {name:'<%=list.get(9).getProvinceName()%>', value: <%=list.get(9).getConfirmedNum()%> ,nowNum:<%=list.get(9).getNowNum()%>  , curesNum: <%=list.get(9).getCuresNum()%> , deathsNum: <%=list.get(9).getDeathsNum()%>},
        {name:'<%=list.get(10).getProvinceName()%>', value: <%=list.get(10).getConfirmedNum()%> ,nowNum:<%=list.get(10).getNowNum()%>  , curesNum: <%=list.get(10).getCuresNum()%> , deathsNum: <%=list.get(10).getDeathsNum()%>},
        {name:'<%=list.get(11).getProvinceName()%>', value: <%=list.get(11).getConfirmedNum()%> ,nowNum:<%=list.get(11).getNowNum()%>  , curesNum: <%=list.get(11).getCuresNum()%> , deathsNum: <%=list.get(11).getDeathsNum()%>},
        {name:'<%=list.get(12).getProvinceName()%>', value: <%=list.get(12).getConfirmedNum()%> ,nowNum:<%=list.get(12).getNowNum()%>  , curesNum: <%=list.get(12).getCuresNum()%> , deathsNum: <%=list.get(12).getDeathsNum()%>},
        {name:'<%=list.get(13).getProvinceName()%>', value: <%=list.get(13).getConfirmedNum()%> ,nowNum:<%=list.get(13).getNowNum()%>  , curesNum: <%=list.get(13).getCuresNum()%> , deathsNum: <%=list.get(13).getDeathsNum()%>},
        {name:'<%=list.get(14).getProvinceName()%>', value: <%=list.get(14).getConfirmedNum()%> ,nowNum:<%=list.get(14).getNowNum()%>  , curesNum: <%=list.get(14).getCuresNum()%> , deathsNum: <%=list.get(14).getDeathsNum()%>},
        {name:'<%=list.get(15).getProvinceName()%>', value: <%=list.get(15).getConfirmedNum()%> ,nowNum:<%=list.get(15).getNowNum()%>  , curesNum: <%=list.get(15).getCuresNum()%> , deathsNum: <%=list.get(15).getDeathsNum()%>},
        {name:'<%=list.get(16).getProvinceName()%>', value: <%=list.get(16).getConfirmedNum()%> ,nowNum:<%=list.get(16).getNowNum()%>  , curesNum: <%=list.get(16).getCuresNum()%> , deathsNum: <%=list.get(16).getDeathsNum()%>},
        {name:'<%=list.get(17).getProvinceName()%>', value: <%=list.get(17).getConfirmedNum()%> ,nowNum:<%=list.get(17).getNowNum()%>  , curesNum: <%=list.get(17).getCuresNum()%> , deathsNum: <%=list.get(17).getDeathsNum()%>},
        {name:'<%=list.get(18).getProvinceName()%>', value: <%=list.get(18).getConfirmedNum()%> ,nowNum:<%=list.get(18).getNowNum()%>  , curesNum: <%=list.get(18).getCuresNum()%> , deathsNum: <%=list.get(18).getDeathsNum()%>},
        {name:'<%=list.get(19).getProvinceName()%>', value: <%=list.get(19).getConfirmedNum()%> ,nowNum:<%=list.get(19).getNowNum()%>  , curesNum: <%=list.get(19).getCuresNum()%> , deathsNum: <%=list.get(19).getDeathsNum()%>},
        {name:'<%=list.get(20).getProvinceName()%>', value: <%=list.get(20).getConfirmedNum()%> ,nowNum:<%=list.get(20).getNowNum()%>  , curesNum: <%=list.get(20).getCuresNum()%> , deathsNum: <%=list.get(20).getDeathsNum()%>},
        {name:'<%=list.get(21).getProvinceName()%>', value: <%=list.get(21).getConfirmedNum()%> ,nowNum:<%=list.get(21).getNowNum()%>  , curesNum: <%=list.get(21).getCuresNum()%> , deathsNum: <%=list.get(21).getDeathsNum()%>},
        {name:'<%=list.get(22).getProvinceName()%>', value: <%=list.get(22).getConfirmedNum()%> ,nowNum:<%=list.get(22).getNowNum()%>  , curesNum: <%=list.get(22).getCuresNum()%> , deathsNum: <%=list.get(22).getDeathsNum()%>},
        {name:'<%=list.get(23).getProvinceName()%>', value: <%=list.get(23).getConfirmedNum()%> ,nowNum:<%=list.get(23).getNowNum()%>  , curesNum: <%=list.get(23).getCuresNum()%> , deathsNum: <%=list.get(23).getDeathsNum()%>},
        {name:'<%=list.get(24).getProvinceName()%>', value: <%=list.get(24).getConfirmedNum()%> ,nowNum:<%=list.get(24).getNowNum()%>  , curesNum: <%=list.get(24).getCuresNum()%> , deathsNum: <%=list.get(24).getDeathsNum()%>},
        {name:'<%=list.get(25).getProvinceName()%>', value: <%=list.get(25).getConfirmedNum()%> ,nowNum:<%=list.get(25).getNowNum()%>  , curesNum: <%=list.get(25).getCuresNum()%> , deathsNum: <%=list.get(25).getDeathsNum()%>},
        {name:'<%=list.get(26).getProvinceName()%>', value: <%=list.get(26).getConfirmedNum()%> ,nowNum:<%=list.get(26).getNowNum()%>  , curesNum: <%=list.get(26).getCuresNum()%> , deathsNum: <%=list.get(26).getDeathsNum()%>},
        {name:'<%=list.get(27).getProvinceName()%>', value: <%=list.get(27).getConfirmedNum()%> ,nowNum:<%=list.get(27).getNowNum()%>  , curesNum: <%=list.get(27).getCuresNum()%> , deathsNum: <%=list.get(27).getDeathsNum()%>},
        {name:'<%=list.get(28).getProvinceName()%>', value: <%=list.get(28).getConfirmedNum()%> ,nowNum:<%=list.get(28).getNowNum()%>  , curesNum: <%=list.get(28).getCuresNum()%> , deathsNum: <%=list.get(28).getDeathsNum()%>},
        {name:'<%=list.get(29).getProvinceName()%>', value: <%=list.get(29).getConfirmedNum()%> ,nowNum:<%=list.get(29).getNowNum()%>  , curesNum: <%=list.get(29).getCuresNum()%> , deathsNum: <%=list.get(29).getDeathsNum()%>},
        {name:'<%=list.get(30).getProvinceName()%>', value: <%=list.get(30).getConfirmedNum()%> ,nowNum:<%=list.get(30).getNowNum()%>  , curesNum: <%=list.get(30).getCuresNum()%> , deathsNum: <%=list.get(30).getDeathsNum()%>},
        {name:'<%=list.get(31).getProvinceName()%>', value: <%=list.get(31).getConfirmedNum()%> ,nowNum:<%=list.get(31).getNowNum()%>  , curesNum: <%=list.get(31).getCuresNum()%> , deathsNum: <%=list.get(31).getDeathsNum()%>},
        {name:'<%=list.get(32).getProvinceName()%>', value: <%=list.get(32).getConfirmedNum()%> ,nowNum:<%=list.get(32).getNowNum()%>  , curesNum: <%=list.get(32).getCuresNum()%> , deathsNum: <%=list.get(32).getDeathsNum()%>},
        {name:'<%=list.get(33).getProvinceName()%>', value: <%=list.get(33).getConfirmedNum()%> ,nowNum:<%=list.get(33).getNowNum()%>  , curesNum: <%=list.get(33).getCuresNum()%> , deathsNum: <%=list.get(33).getDeathsNum()%>},
        {name: '南海诸岛', value: 0}
    ]
    var myChart = echarts.init(document.getElementById('main'));
    function randomValue() {
        return Math.round(Math.random()*1000);
    }
    option = {
        tooltip: {
            formatter:function(params,ticket, callback){
                return params.name+'<br />'+'现有确诊：'+ params.data.nowNum
                +'<br />'+'累计确诊：'+ params.value
                +'<br />'+'治愈：'+ params.data.curesNum
                +'<br />'+'死亡：'+ params.data.deathsNum
            }//数据格式化
        },
        visualMap: {
            min: 0,
            max: 3000,
            left: 'left',
            top: 'bottom',
            text: ['高','低'],//取值范围的文字
            inRange: {
                color: ['#ffb6ac', '#dd0f09']//取值范围的颜色
            },
            show:true//图注
        },
        geo: {
            map: 'china',
            roam: false,//不开启缩放和平移
            zoom:1.23,//视角缩放比例
            label: {
                normal: {
                    show: true,
                    fontSize:'10',
                    color: 'rgba(0,0,0,0.7)'
                }
            },
            itemStyle: {
                normal:{
                    borderColor: 'rgba(0, 0, 0, 0.2)'
                },
                emphasis:{
                    areaColor: '#F3B329',//鼠标选择区域颜色
                    shadowOffsetX: 0,
                    shadowOffsetY: 0,
                    shadowBlur: 20,
                    borderWidth: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        },
        series : [
            {
                name: '信息量',
                type: 'map',
                geoIndex: 0,
                data:dataList
            }
        ]
    };
    myChart.setOption(option);
    myChart.on('click', function (params) {
        alert(params.name+'：'+params.seriesName+params.value);
    });

    /*  setTimeout(function () {
          myChart.setOption({
              series : [
                  {
                      name: '信息量',
                      type: 'map',
                      geoIndex: 0,
                      data:dataList
                  }
              ]
          });
      },1000)*/
</script>
</body>
</html>