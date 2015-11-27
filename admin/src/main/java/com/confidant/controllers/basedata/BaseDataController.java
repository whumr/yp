package com.confidant.controllers.basedata;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.confidant.common.BaseController;
import com.confidant.entity.Member;
import com.confidant.entity.Province;
import com.confidant.service.basedata.BasedataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * Created by Administrator on 2015/1/29.
 */
@Controller("basedataController")
@RequestMapping("/basedata")
public class BaseDataController extends BaseController {

    private static String BATH_PATH = "basedata/";

    @Autowired
    private BasedataService basedataService;

    @RequestMapping({"", "/index"})
    public String index(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setAttribute("tree_data", getProvinceTree());
        return BATH_PATH + "index";
    }

    public JSONArray getProvinceTree() {
        List<Province> list = basedataService.getAllProvinces();
        Map<Integer, JSONObject> country_map = new HashMap<Integer, JSONObject>();
        JSONArray array = new JSONArray();
        for (Province province : list) {
            int country_id = province.getCountry_id();
            //新国家、分类
            if (!country_map.containsKey(country_id)) {
                JSONObject country = new JSONObject();
                country.put("id", country_id);
                country.put("name", province.getCountry().getName());
                array.add(country);
                country_map.put(country_id, country);
            }
            if (province.getName() != null) {
                JSONObject country = country_map.get(country_id);
                JSONArray children;
                if (country.containsKey("children"))
                    children = country.getJSONArray("children");
                else {
                    children = new JSONArray();
                    country.put("children", children);
                }
                JSONObject json = new JSONObject();
                json.put("id", province.getId());
                json.put("name", province.getName());
                children.add(json);
            }
        }
        return array;
    }

    @RequestMapping("/getAllProvinces")
    public void getAllProvinces(HttpServletRequest request, HttpServletResponse response) {
        JSONObject result = successJson();
        result.put("data", getProvinceTree());
        renderJson(response, result);
    }
}
