package com.confidant.controllers.basedata;

import com.confidant.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2015/1/29.
 */
@Controller("basedataController")
@RequestMapping("/basedata")
public class BaseDataController extends BaseController {

    private static String BATH_PATH = "basedata/";

    @RequestMapping({"", "/index"})
    public String index() throws Exception {
        return BATH_PATH + "index";
    }
}
