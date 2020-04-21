package com.ruixin.service;

import com.ruixin.bean.Comments;

import com.ruixin.common.service.CrudService;
import com.ruixin.common.utils.CacheNames;
import com.ruixin.dao.CommentsDao;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
@CacheConfig(cacheNames = CacheNames.COMMENT_CACHE)
public class CommentsService extends CrudService<CommentsDao,Comments> {



}