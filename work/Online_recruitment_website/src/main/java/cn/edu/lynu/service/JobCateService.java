package cn.edu.lynu.service;

import cn.edu.lynu.entity.JobCate;
import cn.edu.lynu.vo.PageBean;

import java.util.LinkedHashMap;
import java.util.List;

public interface JobCateService {
    /**
     * 功能描述:前台 -- 首页类别的展示
     *
     * @param
     * @return:集合的key值存储一级类别和热门岗位类型 集合的value存储该一级类别所对应的二级类别及二级类别所对应下属的三级类别
     * @Author: Zhaozj
     * @Date: 2019/11/24 21:51
     */
    LinkedHashMap<JobCate, List<JobCate>> indexFindJobCategory();

    /**
     * 功能描述: 后台--查询所有岗位类别
     *
     * @param pageBean 页面查询时封装的类型
     * @return:
     * @Author: Zhaozj
     * @Date: 2019/11/28 20:36
     */
    PageBean<JobCate> findAllJobCate(PageBean<JobCate> pageBean);

    /**
     * 功能描述 :后台 --根据类别查询该类别下的所有岗位类别信息
     *
     * @param type：具体的类型值
     * @return:
     * @Author: Zhaozj
     * @Date: 2019/12/2 16:32
     */
    List<JobCate> findJobByJobeType(Integer type);

    /**
     * 功能描述: 后台 -- 根据父类别id查询该类别下的所有字类别
     *
     * @Author: Zhaozj
     * @Date: 2019/12/2 19:06
     */
    List<JobCate> findJobCateByParentId(String pid);

    /**
     * 功能描述: 后台 -- 添加一个类别
     *
     * @Author: Zhaozj
     * @Date: 2019/12/2 19:52
     */
    void addJobCate(JobCate jobCate);

    /**
     * 功能描述:后台 -- 根据id删除对应的数据
     *
     * @Author: Zhaozj
     * @Date: 2019/12/2 20:54
     */
    String deleteJobCateById(String jid);

    /**
     * 功能描述:后台 -- 修改岗位的热门推荐
     *
     * @Author: Zhaozj
     * @Date: 2019/12/2 21:26
     */
    String updateJobCateHot(String jid);
}
