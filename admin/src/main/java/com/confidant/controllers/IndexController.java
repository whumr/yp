package com.confidant.controllers;

import com.confidant.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2015/1/29.
 */
@Controller("indexController")
@RequestMapping("")
public class IndexController extends BaseController {

    @RequestMapping({"", "/index"})
    public String index() throws Exception {
        return "index";
    }
}
