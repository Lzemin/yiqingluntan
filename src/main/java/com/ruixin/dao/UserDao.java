package com.ruixin.dao;

import com.ruixin.bean.User;
import com.ruixin.common.dao.CrudDao;
import org.apache.ibatis.annotations.Param;

/**
 * 用户dao
 */
public interface UserDao extends CrudDao<User>{

    User findByAccount(@Param("userName") String userName);

    User getUserByCode(@Param("code") String code);

    void batchDelete(@Param("ids") String[] ids);

    User getUserInfo(@Param("id") Integer id);
}