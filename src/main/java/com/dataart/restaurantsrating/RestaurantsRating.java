package com.dataart.restaurantsrating;

import java.util.*;
import com.google.gson.Gson;
import static spark.Spark.*;
import spark.template.freemarker.FreeMarkerEngine;
import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.dataart.restaurantsrating.repository.RestaurantsRepository;

public class RestaurantsRating {

    public static void main(String[] args) throws Exception {

        MongoClient mongoClient = new MongoClient();
        DB db = mongoClient.getDB("Restarate");
        RestaurantsRepository restaurantsRepository = new RestaurantsRepository(db);

        Gson gson = new Gson();

	staticFileLocation("/public");

        get("/", (request, response) -> {
            Map<String, Object> viewObjects = new HashMap<>();
            return modelAndView(viewObjects, "index.ftl");
        }, new FreeMarkerEngine());

        get("/api/restaurant", (request, response) -> restaurantsRepository.findAll(), gson::toJson);
        get("/api/restaurantInfo", (request, response) -> restaurantsRepository.find(request.queryParams("user_data")), gson::toJson);
    }

}
