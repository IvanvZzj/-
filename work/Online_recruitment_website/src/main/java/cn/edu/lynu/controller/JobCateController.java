package cn.edu.lynu.controller;

import cn.edu.lynu.entity.JobCate;
import cn.edu.lynu.service.JobCateService;
import cn.edu.lynu.vo.PageBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

/*
 * 功能描述:JobeCate控制器
 * @param null
 * @return:
 * @Author: Zhaozj
 * @Date: 2019/11/21 20:15
 */
@Controller
@RequestMapping("/jobcate")
public class JobCateController {


    @Autowired
    private JobCateService jobCateService;

    /**
     * 功能描述:后台--查询所有职位类别信息
     *
     * @param
     * @return:
     * @Author: Zhaozj
     * @Date: 2019/11/28 20:07
     */
    @RequestMapping("backqueryAllJobCategory")
    public String backQueryAllJobCateGory(HttpServletRequest request,
                                          Integer pageIndex, String msg) {
        //声明一个pageBean对象
        PageBean<JobCate> pageBean = new PageBean<>();
        //将前台页码赋值给pagebean对象
        pageBean.setPageIndex(pageIndex);
        //进行查询
        pageBean = jobCateService.findAllJobCate(pageBean);
        //存域
        request.setAttribute("pageBean", pageBean);
        //判断删除的提示信息是否为空
        if (msg != null) {
            System.out.println(msg);
            request.setAttribute("msg", msg);
        }
        //请求转发展示页面
        return "forward:/static/back/jsp/job/jobcatejory.jsp";
    }

    /**
     * 功能描述:后台 -- 根据前台所传递的类型的级别值进行查所对应的类型具体信息
     *
     * @param type 所需要查询的等级类别
     * @return:
     * @Author: Zhaozj
     * @Date: 2019/12/2 16:29
     */
    @RequestMapping("findCateByType")
    @ResponseBody
    public List<JobCate> findCateByType(Integer type) {
        List<JobCate> jobCates = jobCateService.findJobByJobeType(type);
        return jobCates;
    }

    /**
     * 功能描述:后台-- 根据父类别id查询该类别下的所有字类别
     *
     * @Author: Zhaozj
     * @Date: 2019/12/2 19:06
     */
    @RequestMapping("findCateByParentId")
    @ResponseBody
    public List<JobCate> findCateByParentId(String pid) {
        List<JobCate> jobCates = jobCateService.findJobCateByParentId(pid);
        return jobCates;
    }

    /**
     * 功能描述: 后台--添加一个类别
     *
     * @Author: Zhaozj
     * @Date: 2019/12/2 19:36
     */
    @RequestMapping("addJobCate")
    public String addJobCate(JobCate jobCate, HttpServletRequest request, String fistJobCate) {
        /*
        进行判断
                如果 父id为空 则说明是一级类别
                如果 父id为空 不为空  fistJobCate 为空 则说明是二级类别
                如果 父id 不为空 fistJobCate 不为空 则说明添加的是三级类别
         */
        jobCate.setId(UUID.randomUUID().toString());
        if (jobCate.getParentId() == null) {
            jobCate.setType(1);
        } else if (jobCate.getParentId() != null && fistJobCate == null) {
            jobCate.setType(2);
        } else if (jobCate.getParentId() != null && fistJobCate != null) {
            jobCate.setType(3);
        }
        jobCateService.addJobCate(jobCate);
        return "redirect:/jobcate/backqueryAllJobCategory";
    }

    /**
     * 功能描述:后台 -- 根据id删除一条类别数据对象
     *
     * @Author: Zhaozj
     * @Date: 2019/12/2 20:53
     */
    @RequestMapping("daleteJobCate")
    public String daleteJobCate(String jid, HttpServletRequest request) {
        String msg = jobCateService.deleteJobCateById(jid);
        return "redirect:/jobcate/backqueryAllJobCategory?msg="+msg;
    }

     /**
       * 功能描述:后台 -- 修改岗位类别的热门推荐
       * @Author: Zhaozj
       * @Date: 2019/12/2 21:24
       */
    @RequestMapping("updateJobCateHot")
    public String updateJobCateHot(HttpServletRequest request,String jid){
        String msg = jobCateService.updateJobCateHot(jid);
        return "redirect:/jobcate/backqueryAllJobCategory?msg="+msg;
    }

}
