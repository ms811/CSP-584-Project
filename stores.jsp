

<html>
    <head>
        <title>Stores</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <%@ include file="../header.jsp"%>
        <%@ include file="../navbar.jsp"%>
    </head>
    <style>
        * {
        box-sizing: border-box;
        }

        /* Create four equal columns that floats next to each other */
        .column {
        float: left;
        width: 100%;
        padding: 10px;
        height: auto; /* Should be removed. Only for demonstration */
        }

        /* Clear floats after the columns */
        .row:after {
        content: "";
        display: table;
        clear: both;
        }

        #updateproductform {
            background-color: white;
            padding: 20px;
            padding-left: 50px;
        }
        #map {
        height: 100vh;
        }
        html, body {
        max-width: 100%;
        overflow-x: hidden;
        }
        
    </style>
    <body>

        <div class="row">
            <div class="col-sm-1">
            </div>
            <div class="col-sm-2" >
                <div class="row">
                    <div class="column" style="background-color:white;">
                        <form>
                            <label for="fname">Store Name</label><br>
                            <input type="hidden" id="fname" name="fname">
                            <button type="button" class="btn btn-success">Success</button>
                        </form>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="column" style="background-color:white;">
                        <form>
                            <label for="fname">Store Name</label><br>
                            <input type="hidden" id="fname" name="fname">
                            <button type="button" class="btn btn-success">Success</button>
                        </form>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="column" style="background-color:white;">
                        <form>
                            <label for="fname">Store Name</label><br>
                            <input type="hidden" id="fname" name="fname"><address>
                                Written by <a href="mailto:webmaster@example.com">Jon Doe</a>.<br>
                                Visit us at:<br>
                                Example.com<br>
                                Box 564, Disneyland<br>
                                USA
                                </address>
                            <button type="button" class="btn btn-success">Success</button>
                        </form>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="column" style="background-color:white;">
                        <form>
                            <label for="fname">Store Name</label><br>
                            <input type="hidden" id="fname" name="fname">
                            <button type="button" class="btn btn-success">Success</button>
                        </form>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="column" style="background-color:white;">
                        <form>
                            <label for="fname">Store Name</label><br>
                            <input type="hidden" id="fname" name="fname">
                            <button type="button" class="btn btn-success">Success</button>
                        </form>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="column" style="background-color:white;">
                        <form>
                            <label for="fname">Store Name</label><br>
                            <input type="hidden" id="fname" name="fname">
                            <button type="button" class="btn btn-success">Success</button>
                        </form>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="column" style="background-color:white;">
                        <form>
                            <label for="fname">Store Name</label><br>
                            <input type="hidden" id="fname" name="fname">
                            <button type="button" class="btn btn-success">Success</button>
                        </form>
                    </div>
                </div>
            </div>


            <div class="col-sm-8">
                <div class = "row mb-2">
                    <div class = "col-sm-12">
                        <input class = "form-control" id = search type="text" placeholder = "search ... "/>
                    </div>
                </div>
                <br>
                <div id="map"></div>
            <div class="col-sm-1">
            </div>
          </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
        <script src="script.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD22pVOcikl34W4C8NhUrO1QnedM4XdDOU&callback=createMap&libraries=places" async defer></script>        
    </body>
    <br><br>
</html>

