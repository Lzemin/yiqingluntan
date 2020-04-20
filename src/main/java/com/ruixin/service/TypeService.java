package com.ruixin.service;

import com.ruixin.bean.Type;
import com.ruixin.common.service.CrudService;
import com.ruixin.common.utils.CacheNames;
import com.ruixin.dao.TypeDao;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional(readOnly = true)
@CacheConfig(cacheNames = CacheNames.SYS_CACHE)
public class TypeService extends CrudService<TypeDao,Type>{
    public List<Type> findTypeList (){
        return dao.findTypeList();
    }
}
