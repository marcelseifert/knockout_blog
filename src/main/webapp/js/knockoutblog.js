

function Person( vorname,  nachname, adresse, alter) {
    
    var self = this;

    if(!alter) {
        alter = "0";
    }
    
    self.vorname = ko.observable(vorname);
    self.nachname = ko.observable(nachname);
    self.alter = ko.observable(alter);
    self.adresse = ko.observable(adresse);
    
    self.fullname = ko.computed(function() {
        return self.vorname() + " "+self.nachname();          
    });
   
}


function Adresse(strasse, plz , ort) {
    var self = this;
    self.strasse = strasse;
    self.plz = plz;
    self.ort = ort;
   
}


function PersonViewModel() {
    var self = this;
    self.adressen = [
    {
        strasse: "Strasse", 
        plz: "1234", 
        ort: "Ort1"
    },
    {
        strasse: "Strasse2", 
        plz: "4321", 
        ort: "Ort2"
    } 
    ];
    
    self.newVorname =ko.observable("");
    self.newNachname=ko.observable("");
    self.index = -1;
       
    self.listOfPersonen = ko.observableArray( [
        new Person("Homer", "Simpson", self.adressen[0],50),
        new Person("Peter", "Lustig", self.adressen[1],70),
        new Person("Fred", "Feuerstein", self.adressen[2],100),
        ] );
    
    self.currentPerson = ko.observable( new Person("","",""));     
    
    self.selectedPerson = function(person) {
        self.index = self.listOfPersonen.indexOf(person);       
        self.currentPerson().vorname(person.vorname());
        self.currentPerson().nachname(person.nachname());
        self.currentPerson().alter(person.alter());
    };
      
    self.clear = function() {
        self.currentPerson(new Person("",""));
        self.newVorname("");
        self.newVorname("");
        self.index=-1;
    };
      
    self.add = function() {
        self.listOfPersonen.push ( new Person(self.newVorname(),self.newNachname()));
        self.clear();
    };
      
    self.remove = function() {
        self.listOfPersonen.remove(self.listOfPersonen()[self.index]);
    };
      
      
    self.update=function() {
        self.listOfPersonen()[self.index].vorname(self.currentPerson().vorname());
        self.listOfPersonen()[self.index].nachname(self.currentPerson().nachname());
        self.listOfPersonen()[self.index].alter(self.currentPerson().alter());
    };
      
} 

//http://jsfiddle.net/rniemeyer/tzD4T/
ko.bindingHandlers.jqSlider = {
           init: function(element, valueAccessor, allBindingsAccessor) {
               //initialize the control
               var options = allBindingsAccessor().jqOptions || {};
               $(element).slider(options);
 
               //handle the value changing in the UI
               ko.utils.registerEventHandler(element, "slidechange", function() {
                   //would need to do some more work here, if you want to bind against non-observables
                   var observable = valueAccessor();
                   observable($(element).slider("value"));
               });
 
           },
           //handle the model value changing
           update: function(element, valueAccessor) {
               var value = ko.utils.unwrapObservable(valueAccessor());
               $(element).slider("value", value);  
 
           }
 
};
// Activates knockout.js 
ko.applyBindings(new PersonViewModel());