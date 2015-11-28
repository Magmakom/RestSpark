package com.dataart.restaurantsrating.repository;

import com.mongodb.*;
import com.dataart.restaurantsrating.entity.Entity;

public abstract class AbstractMongoRepository<T extends Entity> {

    protected DB db;
    protected DBCollection collection;

    public AbstractMongoRepository(DB db) {
        this.db = db;
        collection = db.getCollection(getCollectionName());
    }

    public abstract T getEntityFromDBObject(DBObject object);

    public abstract String getCollectionName();
}