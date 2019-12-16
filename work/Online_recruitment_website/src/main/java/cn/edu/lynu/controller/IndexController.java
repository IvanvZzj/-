package cn.edu.lynu.controller;

import cn.edu.lynu.entity.JobCate;
import cn.edu.lynu.service.JobCateService;
import lombok.experimental.Accessors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

/*
 * 功能描述:主页数据展示控制器
 * @param null
 * @return:
 * @Author: Zhaozj
 * @Date: 2019/11/24 21:40
 */
@Controller
@RequestMapping("index")
public class IndexController {

    @Autowired
    private JobCateService jobCateService;                  //声明岗位业务层service

    /*
     * 功能描述: 主页数据查询
     * @param
     * @return: java.lang.String 返回路径
     * @Author: Zhaozj
     * @Date: 2019/11/24 21:42
     */
    @RequestMapping("indexShow")
    public String indexShow(HttpServletRequest request) {
        /**
         * 该集合用户主页所展示的类别信息
         *     集合的key值存储一级类别和热门岗位类型
         *     集合的value存储该一级类别所对应的二级类别及二级类别所对应下属的三级类别
         */
        LinkedHashMap<JobCate, List<JobCate>> jobcates = jobCateService.indexFindJobCategory();
        request.setAttribute("jobcates",jobcates);
        return "forward:/static/front/main/index.jsp";
    }





}
