package cn.edu.lynu.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/*
 * 功能描述: 分页工具类
 * @param null
 * @return:
 * @Author: Zhaozj
 * @Date: 2019/11/28 20:19
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class PageBean<T> implements Serializable {

    private Integer pageIndex;          //当前页码
    private Integer pageCount;          //总页码
    private List<T> list;               //查询出来的数据
    private Integer rows;               //每页多少条数据
}
