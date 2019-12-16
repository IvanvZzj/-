package cn.edu.lynu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * 职位类别JobCate实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class JobCate implements Serializable {

    private String id;                           //id
    private String name;                        //名称
    private String parentId;                    //父类别
    private String hotid;                       //是否是推荐 不为空则值为该大类的id
    private Integer type;                       //类别

    private List<JobCate> childJobCate;         //下属类别
    private List<JobCate> hotJobCate;           //热门推荐类别
    private JobCate jobCate;                    //所属父类别

}
