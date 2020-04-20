package com.ruixin.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruixin.bean.Yiqing;
import com.ruixin.bean.YiqingNews;
import com.ruixin.common.utils.Views;
import com.ruixin.util.HttpClient;
import jdk.nashorn.internal.runtime.JSONListAdapter;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.json.JSONString;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/yiqing")
public class YiqingController {

    @GetMapping("/data")
    @RequiresPermissions("base:yiqing:views")
    public String dataList(Model model ){
        String url="http://www.dzyong.top:3005/yiqing/province";
        String data=HttpClient.sendGetRequest(url);
        String response = JSONObject.parseObject(data).getString("data");
        List<Yiqing> list=JSONArray.parseArray(response,Yiqing.class);
        for(int i=0;i<list.size();i++){
            list.get(i).setNowNum(list.get(i).getConfirmedNum()-list.get(i).getCuresNum()-list.get(i).getDeathsNum());
        }
        int confirmedSum=0;
        int curesSum=0;
        int deathsSum=0;
        for(int i=0;i<list.size();i++){
            confirmedSum+=list.get(i).getConfirmedNum();
            curesSum+=list.get(i).getCuresNum();
            deathsSum+=list.get(i).getDeathsNum();
        }
        String url1="http://www.dzyong.top:3005/yiqing/history";
        String data1=HttpClient.sendGetRequest(url1);
        String response1 = JSONObject.parseObject(data1).getString("data");
        List<Yiqing> list1=JSONArray.parseArray(response1,Yiqing.class);
        Yiqing history=list1.get(list1.size()-2);
        int confirmedPlus=confirmedSum-history.getConfirmedNum();
        int curesPlus=curesSum-history.getCuresNum();
        int deathsPlus=deathsSum-history.getDeathsNum();
        model.addAttribute("data", list);
        model.addAttribute("confirmedSum", confirmedSum);
        model.addAttribute("curesSum", curesSum);
        model.addAttribute("deathsSum", deathsSum);
        model.addAttribute("confirmedPlus", confirmedPlus);
        model.addAttribute("curesPlus", curesPlus);
        model.addAttribute("deathsPlus", deathsPlus);
        return Views.YIQING_DATA_LIST;
    }

    @GetMapping("/news")
    @RequiresPermissions("base:yiqing:news")
    public String newsList(Model model ){
        String url="http://www.dzyong.top:3005/yiqing/news";
        String data=HttpClient.sendGetRequest(url);
        String response = JSONObject.parseObject(data).getString("data");
        List<YiqingNews> list=JSONArray.parseArray(response,YiqingNews.class);
        for(int i=0;i<list.size();i++){
            list.get(i).setXuhao(i+1);
        }
        List<YiqingNews> list1=new ArrayList<>(20);
        for(int i=0;i<20;i++){
            list1.add(list.get(i));
        }
        model.addAttribute("data", list1);
        return Views.YIQING_NEWS_LIST;
    }
}
