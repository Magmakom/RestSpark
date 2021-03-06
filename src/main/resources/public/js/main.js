var map;
var position;
var myOptions;
var user_data;
var markersList = new Set();
var restaurants = new Set();
var infowindow;
var isOpened;
var mode;
var updatelistTimer;

$(function () {
    $('#signIn').click(function () {
        $('#overlay').fadeIn('fast', function () {
            $('#box').animate({'top': '160px'}, 500);
        });
    });
    $('#boxclose').click(function () {
        $('#box').animate({'top': '-400px'}, 500, function () {
            $('#overlay').fadeOut('fast');
        });
    });
});

function getMarks() {
    user_data = {
        mod: "all"
    };
    $.ajax({
        type: "GET",
        url: "/api/restaurant",
        data: {
            user_data: $.toJSON(user_data)
        },
        success: function (data) {
            var dbl = jQuery.parseJSON(data);
            if (dbl.length > 0) {
                for (var i = 0; i < dbl.length; i++) {
                    putMarker(dbl[i]);
                }
            }
            updateList();
        },
        error: function () {
            alert('Can not connect to the server');
        }
    });
    //  var arr = Array.from(markersList);
}

function getRestaurantInfo(restaurantId) {
    user_data = {
        _id: restaurantId
    };
    $.ajax({
        type: "GET",
        url: "/api/restaurantInfo",
        data: {
            user_data: $.toJSON(user_data)
        },
        success: function (data) {
            var dbl = jQuery.parseJSON(data);
            updateRestaurantInfo(dbl);
        },
        error: function () {
            alert('Can not connect to the server');
        }
    });
}

function getRestaurantsByName() {
    // GET to server
    var inputText = document.getElementById("search").value;
    updateList();
}

function initMap() {
    mode = "map";
    document.getElementById("info_container").style.visibility = "hidden";
    document.getElementById("info_container").style.display = "none";
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            if (position == null) {
                position = L.latLng(position.coords.latitude, position.coords.longitude);
            }
        });
    } else {
        // Browser doesn't support Geolocation
        // handleLocationError(false, infoWindow, map.getCenter());
    }
    if (position == null) {
        position = L.latLng(46.475406, 30.734472);
    }
    map = new L.Map('map', {center: position, zoom: 14});
    var googleLayer = new L.Google('ROADMAP');
    map.addLayer(googleLayer);
    isOpened = false;
    getMarks();
}

function putMarker(obj) {
    var marker = L.marker([obj["lat"], obj["lng"]]).addTo(map);
    marker.title = obj["name"];
    marker.bindPopup(getContent(obj));
    restaurants.add(obj);
    markersList.add(marker);
}

function getContent(obj) {
    return '<b>' + obj["name"] + '</b><br>' +
            obj["description"] + '<br><br>' +
            '<b>Address: </b>' + obj["address"] + '</br>' +
            '<b>Phones: </b>' + obj["telephone"] + '</br>' +
            '<b>Working hours: </b>' + obj["workingHours"] + '</br></br><a onclick="openRatingPage(\'' + obj["_id"] + '\')">View more</a>';
}

function updateList() {
    if (updatelistTimer !== null) {
        clearTimeout(updatelistTimer);
    }
    updatelistTimer = setTimeout(getRestaurantsByName, 1000);
    $('.list-group-item').remove();
    var inputText = document.getElementById("search").value;
    var items = Array.from(restaurants);
    for (var i = 0; i < items.length; i++) {
        if (items[i]["name"].toLowerCase().indexOf(inputText.toLowerCase()) > -1 || inputText === "") {
            $('.list-group').append(
                    '<button type="button" class="list-group-item" onclick="targetRestaurant(' + i + ')"><span class="badge">5</span>'
                    + items[i]["name"]
                    + '</button>');
        }
    }
}

function updateRestaurantInfo(restaurant) {
    $('.restName').html(restaurant["name"]);
    $('#restInfo').html(restaurant["description"]);
    $('#rateCuisine').html(restaurant["cuisine"] + "/5");
    $('#rateInterior').html(restaurant["interior"] + "/5");
    $('#rateService').html(restaurant["service"] + "/5");
    $('#restView').html(restaurant["description"]);
}

function centerRestaurant(id) {
    var markers = Array.from(markersList);
    if (map.getZoom() < 14)
        map.setZoom(14);
    map.setCenter(markers[id].getPosition());
    google.maps.event.trigger(markers[id], 'click');
}

function targetRestaurant(id) {
    if (mode === "map") {
        centerRestaurant(id);
    } else {
        if (mode === "rate") {
            var rests = Array.from(restaurants);
            getRestaurantInfo(rests[id]["_id"]);
        }
    }
}

//var button = document.getElementById("ratingButton");
//button.classList.add("active");
//var button = document.getElementById("mapButton");
//button.classList.remove("active");

function openRatingPage(_id) {
    position = map.getCenter();
    mode = "rate";
    $('#map').css("visibility", "hidden");
    $('#map').css("display", "none");
    $('#info_container').css("visibility", "visible");
    $('#info_container').css("display", "block");
    $('#mapButton').removeAttr("active");
    getRestaurantInfo(_id);
}

function openMapPage() {
    mode = "map";
    $('#info_container').css("visibility", "hidden");
    $('#info_container').css("display", "none");
    $('#map').css("visibility", "visible");
    $('#map').css("display", "block");
    $('#mapButton').attr("active");
}

google.maps.event.addDomListener(window, 'load', initMap);



