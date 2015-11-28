package com.dataart.restaurantsrating.entity;

public class Restaurant implements Entity {

    private String _id;
    private String name;
    private String telephone;
    private String description;
    private String address;
    private String workingHours;
    private String lat; //positionLatitude
    private String lng; // positionLongitude
    private String cuisine;
    private String interior;
    private String service;

    public Restaurant(String _id, String name, String telephone, String description, String address,
            String workingHours, String positionLatitude, String positionLongitude, String cuisine, String interior, String service) {
        this._id = _id;
        this.name = name;
        this.telephone = telephone;
        this.description = description;
        this.address = address;
        this.workingHours = workingHours;
        this.lat = positionLatitude;
        this.lng = positionLongitude;
        this.cuisine = cuisine;
        this.interior = interior;
        this.service = service;
    }

}
