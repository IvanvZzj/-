package cn.edu.lynu.service.impl;

import cn.edu.lynu.entity.JobCate;
import cn.edu.lynu.mapper.JobCateMapper;
import cn.edu.lynu.service.JobCateService;
import cn.edu.lynu.vo.PageBean;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedHashMap;
import java.util.List;

/*
 * 功能描述:JobCateService
 * @param null
 * @return:
 * @Author: Zhaozj
 * @Date: 2019/11/21 20:18
 */
@Service
@Transactional
public class JobCateServiceImpl implements JobCateService {

    @Autowired
    private JobCateMapper jobCateMapper;

    //前台 -- 主页类别查询展示
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public LinkedHashMap<JobCate, List<JobCate>> indexFindJobCategory() {
        /**
         * 现查询 一级类别 及该大类下的热门推荐
         * 在根据一级类别遍历查询二级三及
         * 将一级类别 与下面的二级三级类别进行关联
         */
        //声明存储数据
        LinkedHashMap<JobCate, List<JobCate>> jobcates = new LinkedHashMap();
        //查询一级及该大类下的热门推荐
        List<JobCate> jobCates1 = jobCateMapper.queryFistAndHotCate();
        //根据一级类别查询该大类别下的二级及三级
        for (JobCate jobCate : jobCates1) {
            String id = jobCate.getId();               //一级类别的id
            //根据id查询
            List<JobCate> jobCates = jobCateMapper.querySecondAndThree(id);
            //将查询结果存入如集合
            jobcates.put(jobCate, jobCates);
        }
        //将结果返回
        return jobcates;
    }

    //后台 -- 查询所有岗位类别
    @Transactional(propagation = Propagation.SUPPORTS)
    public PageBean<JobCate> findAllJobCate(PageBean<JobCate> pageBean) {
        /*
        1、查询数据总条数
        2、根据总条数 每页展示数据 rows求出总页数
        3、先判断页码是否为空 如果页码为空 说明是第一次登陆 给页码设置为1
        4、页码如果不为空 判断是否大于总页码数 如果大于 则改为总页码数
        5、如果页码小于0 则置页码为1
         */
        int sum = jobCateMapper.queryAllJobSum();   //总数居量
        int rows = 10;                              //每页展示数据
        int pageCount = sum % rows == 0 ? sum / rows : sum / rows + 1;      //总页码
        pageBean.setRows(rows);
        pageBean.setPageCount(pageCount);
        //判断前台传递的页码
        if (pageBean.getPageIndex() == null || pageBean.getPageIndex() <= 0) {
            pageBean.setPageIndex(1);           //null或者小于0
        }
        if (pageBean.getPageIndex() > pageCount) {
            pageBean.setPageIndex(pageCount);    //大于总页码数
        }

        //做分页查询
        Page<JobCate> startPage = PageHelper.startPage(pageBean.getPageIndex(), pageBean.getRows());
        jobCateMapper.queryAllJobCate();
        List<JobCate> jobCates1 = startPage.getResult();
        pageBean.setList(jobCates1);
        //返回值
        return pageBean;
    }

    //后台 -- 根据岗位类别的等级查询所对应等级的所有类别
    @Transactional
    public List<JobCate> findJobByJobeType(Integer type) {
        List<JobCate> jobCates = jobCateMapper.queryJobCateByType(type);
        return jobCates;
    }

    //后台 -- 根据父类别id查询该类别下的所有字类别
    @Transactional
    public List<JobCate> findJobCateByParentId(String pid) {
        List<JobCate> jobCates = jobCateMapper.queryJobCateByParentId(pid);
        return jobCates;
    }

    //添加一个类别
    public void addJobCate(JobCate jobCate) {
        jobCateMapper.insertJobCate(jobCate);
    }

    //后台 -- 根据id删除对应的岗位类别信息
    public String deleteJobCateById(String jid) {
        String msg = "";        //提示信息
        //根据id查询该id下是否还有其他子类 如果存在 则不允许删除
        List<JobCate> jobCates = jobCateMapper.queryJobCateByParentId(jid);
        if (jobCates.size() > 0) { //还有子类
            msg = "There are other types under this category, please check!";
        } else {
            jobCateMapper.deleteJobCateById(jid);
            msg = "Delete successful!";
        }
        return msg;
    }

    //后台 -- 修改岗位的热门推荐
    public String updateJobCateHot(String jid) {
        String msg = null;                             //返回判断条件
        //根据id查询
        JobCate jobCate = jobCateMapper.queryJobCateById(jid);
        JobCate updateJobCate = new JobCate();
        updateJobCate.setId(jid);               //设置id
        /*
         *  根据查询结果 如果查询到的对象的hotId 不为空 则将hotId置为null
         *              如果查询到的对象的hotid 为null 则需要将该类别所对应的一级类别设置为该对象的hotid
         *              如果 该对象的type = 1 则说明 其为一级类别 不做修改 返回提示信息
         *              如果 该对象的type = 2 则直接将其parentid设置为hotid
         *              如果 该对象的type = 3 则需查询其夫类型的夫类型 然后设置为hotid
         **/
        if (jobCate.getHotid() != null) {
            updateJobCate.setHotid(null);
        } else if (jobCate.getType() == 1) {
            return msg = "This category is a level 1 category. It is not allowed to be set as a hot recommendation. Please check!";
        } else if (jobCate.getType() == 2) {
            updateJobCate.setHotid(jobCate.getParentId());
        } else if (jobCate.getType() == 3) {
            //是3类型 需要拿到二级 然后根据二级 拿到一级
            JobCate sercond = jobCateMapper.queryJobCateById(jobCate.getParentId());
            JobCate fiset = jobCateMapper.queryJobCateById(sercond.getParentId());
            updateJobCate.setHotid(fiset.getId());
        }
        //调用方法进行修改
        try {
            jobCateMapper.updateHotId(updateJobCate);
            msg = "Modification succeeded!";
        } catch (Exception e) {
            e.printStackTrace();
            msg = "Modification failed!";
        } finally {
            return msg;
        }
    }
}