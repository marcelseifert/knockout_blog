<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!doctype html>
<html>
  <head>  
    <link href="css/bootstrap.min.css" rel="stylesheet"> 
    <link type="text/css" href="css/jquery-ui-1.9.2.custom.css" rel="stylesheet" />
   
    <style>
      body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
      }
      
      #personList {
          display: inline;
          width:250px;
          float:left;
      }
      
      #personContent {
          display: inline;
      }
    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
  </head> 

  <body>
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">Project Knockout-Check</a>
          <div class="nav-collapse collapse"> 
           
            <ul class="nav">
              <li class="active"><a href="#">Zurück zum Blog</a></li> 
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
     
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
            <div class="well sidebar-nav">
               <ul class="nav nav-list"> <li class="nav-header">Vorhandene Personen</li></ul> 
            </div>
          <div class="well sidebar-nav" data-bind="template: { name: 'person-list-template', foreach: listOfPersonen }">
          </div><!--/.well -->
          <a href="#myModal" role="button" class="btn" data-toggle="modal" data-bind="click: clear">Neu</a>
        </div><!--/span-->
        <div class="span9">
          <div class="tabbable"> <!-- Only required for left/right tabs -->
                <ul class="nav nav-tabs">
                      <li><a href="#tabPerson" data-toggle="tab">Person</a></li>
                      <li><a href="#tabAdresse" data-toggle="tab">Adresse</a></li> 
                  </ul>
             <div class="tab-content">
                <div class="tab-pane" id="tabPerson" data-bind="with: currentPerson">
                     
                    <label for="vorname">Vorname</label> <input type="text" id="vorname" data-bind="value: vorname" />
                     <label for="vorname">Nachname</label> <input type="text" id="nachname" data-bind="value: nachname" />
                     <label for="alter">Alter</label> <input type="text" id="alter" data-bind="value: alter" />
                      <div data-bind="jqSlider: alter, jqOptions: { min: 0, max: 100 }"></div>
                      <br/>
                     <button data-bind="click: $root.update" class="btn">Update</button>
                     <button data-bind="click: $root.remove" class="btn">Delete</button> 
                </div>
                <div class="tab-pane" id="tabAdresse"> 
                    <p>Adresse</p>
                </div>
            </div>   
        </div>
        </div>  
    </div>  
    </div>
        
      
    <!-- Fenster -->
    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Neu</h3>
      </div>
      <div class="modal-body">
           <label for="vorname">Vorname</label> <input type="text" id="vorname" data-bind="value: newVorname" />
           <label for="vorname">Nachname</label> <input type="text" id="nachname" data-bind="value: newNachname" />
      </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Schliessen</button>
        <button class="btn btn-primary" data-bind="click: add" data-dismiss="modal" aria-hidden="true">Speichern</button>
      </div>
    </div>
       
   <script type="text/html" id="person-list-template">
     <ul class="nav nav-list">
        <li>
          <a href="#" data-bind="click: $root.selectedPerson , text: fullname" />
        </li>
    </ul>
  </script> 
 
  <script src="http://code.jquery.com/jquery-latest.js"></script> 
  <script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
  <script src="js/bootstrap.js"></script>  
  <script src="js/knockout-2.2.0.js"></script>
  <script src="js/knockoutblog.js"></script>
  
  
 
  </body>
 
  
</html>