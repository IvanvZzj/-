package cn.edu.lynu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

/*
  * 功能描述: 个人用户实体类
  * @Author: Zhaozj
  * @Date: 2019/11/22 20:42
  */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class PersonalUser implements Serializable {

    private String id;
    private String uid;
    private String realName;
    private String sex;
    private String src;
    private String education;
    private String workExerience;
    private String mobile;
    private String workEmail;
    private String newState;
    private String selfDescription;
    private String workDisplaySrc;
    private String workDisplayDescription;


}
