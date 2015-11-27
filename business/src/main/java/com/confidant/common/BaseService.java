package com.confidant.common;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * Created by Administrator on 2015/1/7.
 */
@Service
public abstract class BaseService {

    @Autowired
    @Qualifier("baseSqlSession")
    protected SqlSession baseSqlSession;

    protected String NAMESPACE;
//    protected String namespace;
//
//    @PostConstruct
//    protected void init() {
//        this.namespace = NAMESPACE;
//    }

    public void insert(BaseEntity entity) {
        baseSqlSession.insert(NAMESPACE + "insert", entity);
    }

    public void batchInsert(List<BaseEntity> entities) {
        baseSqlSession.insert(NAMESPACE + "batchInsert", entities);
    }
}
