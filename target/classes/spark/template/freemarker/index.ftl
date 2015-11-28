<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurants rating</title>    
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.css" />
        <script src="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js"></script>
        <script src="http://maps.google.com/maps/api/js?v=3.2&sensor=false"></script>
        <script src="http://matchingnotes.com/javascripts/leaflet-google.js"></script>
        <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="js/jssor.slider.mini.js"></script>
        <link rel="stylesheet" href="css/main.css">
        </head>
    <body>
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">
                        <img alt="Brand" src="/images/logo.png" height="30px" width="30px">
                        </a>
                    </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active" id="mapButton" onclick="openMapPage()"><a href="#">Map<span class="sr-only">(current)</span></a></li>
                        <li id="ratingButton"><a href="#">Rating</a></li>
                        <li id="aboutButton"><a href="#">About us</a></li>
                        </ul>
                    <form class="navbar-form navbar-right">
                        <a type="button" href="#signin" class="btn btn-default" id="signIn">Sign in</a>
                        <div class="overlay" id="overlay" style="display:none;"></div>
                        <div class="box" id="box">
                            <a class="boxclose" id="boxclose" href="#">&#215;</a>
                            <h1>Login</h1>
                            <div class="input-group input-group-sm" id="group-autoriz">
                                <input type="text" class="form-control" id="input-login" placeholder="Login..." aria-describedby="sizing-addon3">
                                <input type="text" class="form-control" id="input-password" placeholder="Password..." aria-describedby="sizing-addon3">
                                <a type="button" href="#login" class="btn btn-default" id="loginConfirm">Sign in</a>  
                                <p><span class="info">?</span><a href="#">Forgot Password</a></p>
                                </div>
                            </div>
                        </form>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        <div class="row fill outer-container">
            <div class="col-md-10 fill">
                <div id="main_container">
                    <div id="map"></div>
                    <div id="info_container" style="padding-left: 20px; margin-top: 0px; margin-bottom: 0px;">
                        <h1 class="restName">Restaurant name</h1>
                        <div class="row" style="padding-top: 30px">
                            <div class="col-sm-6">
                                <script>
                                jQuery(document).ready(function ($) {

                                    var jssor_1_SlideshowTransitions = [
                                      {$Duration:1200,$Opacity:2}
                                    ];

                                    var jssor_1_options = {
                                      $AutoPlay: true,
                                      $SlideshowOptions: {
                                        $Class: $JssorSlideshowRunner$,
                                        $Transitions: jssor_1_SlideshowTransitions,
                                        $TransitionsOrder: 1
                                      },
                                      $ArrowNavigatorOptions: {
                                        $Class: $JssorArrowNavigator$
                                      },
                                      $BulletNavigatorOptions: {
                                        $Class: $JssorBulletNavigator$
                                      }
                                    };

                                    var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

                                    //responsive code begin
                                    //you can remove responsive code if you don't want the slider scales while window resizes
                                    function ScaleSlider() {
                                        var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                                        if (refSize) {
                                            refSize = Math.min(refSize, 600);
                                            jssor_1_slider.$ScaleWidth(refSize);
                                        }
                                        else {
                                            window.setTimeout(ScaleSlider, 30);
                                        }
                                    }
                                    ScaleSlider();
                                    $(window).bind("load", ScaleSlider);
                                    $(window).bind("resize", ScaleSlider);
                                    $(window).bind("orientationchange", ScaleSlider);
                                    //responsive code end
                                });
                                </script>
                                <div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden; visibility: hidden;">
                                    <!-- Loading Screen -->
                                    <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
                                        <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
                                        <div style="position:absolute;display:block;background:url('images/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
                                        </div>
                                    <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden;">
                                        <div data-p="112.50" style="display: none;">
                                            <img data-u="image" src="/images/02.jpg" />
                                            </div>
                                        <div data-p="112.50" style="display: none;">
                                            <img data-u="image" src="/images/04.jpg" />
                                            </div>
                                        <div data-p="112.50" style="display: none;">
                                            <img data-u="image" src="/images/05.jpg" />
                                            </div>
                                        <div data-p="112.50" style="display: none;">
                                            <img data-u="image" src="/images/09.jpg" />
                                            </div>
                                        </div>
                                        <!-- Bullet Navigator -->
                                    <div data-u="navigator" class="jssorb05" style="bottom:16px;right:6px;" data-autocenter="1">
                                        <!-- bullet navigator item prototype -->
                                        <div data-u="prototype" style="width:16px;height:16px;"></div>
                                        </div>
                                        <!-- Arrow Navigator -->
                                    <span data-u="arrowleft" class="jssora12l" style="top:123px;left:0px;width:30px;height:46px;" data-autocenter="2"></span>
                                    <span data-u="arrowright" class="jssora12r" style="top:123px;right:0px;width:30px;height:46px;" data-autocenter="2"></span>
                                    <a href="http://www.jssor.com" style="display:none">Bootstrap Carousel</a>
                                    </div>
                                </div>
                            <div class="col-sm-3">
                                <div class="container" style="width: 100%;">
                                    <div class="jumbotron" id="restInfo" style="margin-top: 0px; margin-bottom: 0px; padding-top: 5px; padding-bottom:5px; padding-left: 20px; padding-right: 20px; font-size: 14px;">
                                        DataArt is a technology consulting firm that offers end-to-end solutions, from concept and strategy, to design, implementation and support. We partner with clients to create and support innovative solutions that help businesses become a lasting success in the marketplace. 
                                        </div>
                                    </div>
                                </div>
                            <div class="col-sm-3">
                                <h3 style="text-align: left;">Rating:</h3>
                                <ul style="list-style-type:none; padding-left: 15px; padding-right: 15px;">
                                    <li>
                                        Cuisine
                                        <span class="rightItem" id="rateCuisine">5/5</span>
                                        <p></p>
                                        </li>
                                    <li>
                                        Interior  
                                        <span class="rightItem" id="rateInterior">5/5</span>
                                        <p></p>
                                        </li>
                                    <li>
                                        Service 
                                        <span class="rightItem" id="rateService">5/5</span>
                                        <p></p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        <div class="container" style="width: 100%; padding-left: 0px; padding-right: 0px;">
                            <div class="jumbotron" id="restView" style="margin-top: 0px; margin-bottom: 0px; padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; font-size: 14px; text-indent: 20px;">
                                The developers and managers at DataArt have done an excellent job of enhancing the functionality of Cruiselabs platform, maintaining legacy systems, operating over 70 web sites and enabling our flagship web sites for mobile devices. They have freed us to focus on growing the business rather than worrying about our technology. DataArt started with very little expertise in cruise technology, but, now are experts in the domain and regularly add value to Cruiselabs' customer experience as a result. 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <div class="col-md-2">
                <div class="input-group input-group-sm" id="input-search">
                    <span id="sizing-addon3" class="input-group-addon glyphicon glyphicon-search" aria-hidden="true" style="top: 0px; padding-top: 7px; padding-bottom: 3px;"></span>
                    <input type="text" class="form-control" id="search" placeholder="Search for..." aria-describedby="sizing-addon3" onkeyup="updateList()">
                    </div>
                <ul class="list-group" id="list">
                    </ul>
                </div>
            </div>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.5.1/jquery.json.min.js"></script>
        <script src="js/jssor.slider.debug.js"></script>
        <script src="js/jssor.slider.min.js"></script>
        <script src="js/main.js"></script>
        </body>
    </html>

