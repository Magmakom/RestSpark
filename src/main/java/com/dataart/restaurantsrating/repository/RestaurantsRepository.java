package com.dataart.restaurantsrating.repository;

import com.mongodb.*;
import com.dataart.restaurantsrating.entity.Restaurant;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.util.ArrayList;
import org.bson.types.ObjectId;

public class RestaurantsRepository extends AbstractMongoRepository {

    public RestaurantsRepository(DB db) {
        super(db);
    }

    public ArrayList<Restaurant> findAll( ) throws IOException {
        DBCursor cursor = collection.find();
        ArrayList<Restaurant> result = new ArrayList<>();
        try {
            while (cursor.hasNext()) {
                result.add(getEntityFromDBObject(cursor.next()));
            }
            return result;
        } finally {
            cursor.close();
        }
    }

    public Restaurant find(String user_data) throws IOException {
        JsonParser jsp = new JsonParser();
        JsonObject jso = (JsonObject) jsp.parse(user_data);
        Restaurant result = getEntityFromDBObject(findDocumentById(jso.get("_id").getAsString()));
        return result;
    }

    @Override
    public Restaurant getEntityFromDBObject(DBObject object) {
        Restaurant restaurant = new Restaurant(
                object.get("_id").toString(),
                (String) object.get("name"),
                (String) object.get("telephone"),
                (String) object.get("description"),
                (String) object.get("address"),
                (String) object.get("workingHours"),
                object.get("lat").toString(),
                object.get("lng").toString(),
                object.get("cuisine").toString(),
                object.get("interior").toString(),
                object.get("service").toString()
        );
        return restaurant;
    }

    public DBObject findDocumentById(String id) {
        BasicDBObject query = new BasicDBObject();
        query.put("_id", new ObjectId(id));
        DBObject dbObj = collection.findOne(query);
        return dbObj;
    }

    @Override
    public String getCollectionName() {
        return "Marks";
    }
}
