package cn.edu.lynu.mapper;

import cn.edu.lynu.entity.JobCate;
import org.apache.ibatis.annotations.*;

import java.util.List;

/*
 * 功能描述:JobCate数据模型层
 * @param null
 * @return:
 * @Author: Zhaozj
 * @Date: 2019/11/21 20:19
 */
@Mapper
public interface JobCateMapper {
    /**
     * 功能描述:查询一级类别及该大类别下的所有热门推荐
     *
     * @param
     * @return:
     * @Author: Zhaozj
     * @Date: 2019/11/24 21:59
     */
    List<JobCate> queryFistAndHotCate();

    /**
     * 功能描述:根据一级类别的id查询该以该id为父id的类别及其子类别
     *
     * @param id 父类别id
     * @return:
     * @Author: Zhaozj
     * @Date: 2019/11/27 22:32
     */
    List<JobCate> querySecondAndThree(@Param("id") String id);

    /**
     * 功能描述:查询所有的岗位类别
     *
     * @param
     * @return:
     * @Author: Zhaozj
     * @Date: 2019/11/28 21:01
     */
    List<JobCate> queryAllJobCate();

    /**
     * 功能描述:数据总量
     *
     * @param
     * @return:
     * @Author: Zhaozj
     * @Date: 2019/11/28 21:24
     */
    @Select("select count(*) from t_jobcate")
    int queryAllJobSum();

    /**
     * 功能描述: 根据岗位类别的等级查询所对应等级的所有类别
     *
     * @Author: Zhaozj
     * @Date: 2019/12/2 16:39
     */
    @Select("select * from t_jobcate where type = #{type}")
    List<JobCate> queryJobCateByType(@Param("type") Integer type);

    /**
     * 功能描述:根据父类别id查询该类别下的所有字类别
     *
     * @Author: Zhaozj
     * @Date: 2019/12/2 19:07
     */
    @Select("select * from t_jobcate where parentid = #{pid}")
    List<JobCate> queryJobCateByParentId(@Param("pid") String pid);

    /**
     * 功能描述:添加一个岗位类别
     *
     * @Author: Zhaozj
     * @Date: 2019/12/2 19:53
     */
    void insertJobCate(JobCate jobCate);

    /**
     * 功能描述:根据id删除一条对应的岗位类别信息
     *
     * @Author: Zhaozj
     * @Date: 2019/12/2 20:58
     */
    @Delete("delete from t_jobcate where id = #{id} ")
    void deleteJobCateById(@Param("id") String jid);

    /**
     * 功能描述:根据id查询对应的岗位类别的信息
     *
     * @Author: Zhaozj
     * @Date: 2019/12/3 20:01
     */
    @Select("select * from t_jobcate where id = #{id}")
    JobCate queryJobCateById(@Param("id") String jid);

    /**
     * 功能描述:修改该类型的hotid
     *
     * @Author: Zhaozj
     * @Date: 2019/12/3 20:12
     */
    @Update("update t_jobcate set hotid = #{hotid,jdbcType=VARCHAR} where id = #{id}")
    void updateHotId(JobCate updateJobCate);
}
