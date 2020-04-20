package com.ruixin.dao;


import com.ruixin.bean.Type;
import com.ruixin.common.dao.CrudDao;

import java.util.List;

public interface TypeDao extends CrudDao<Type> {

    List<Type> findTypeList();

}
