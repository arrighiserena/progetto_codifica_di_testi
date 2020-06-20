function resetLine(name){  
   for (var i = 0; i < 94;i++){
     document.getElementsByTagName('a').item([i]).className='reset-riga';
   }
   document.getElementsByName(name).item(0).className='riga';
  }  


  function gestoreResize () {
    try {
       var attualeDimensioneFoto = nodoLettera1.width;
       var ratio = attualeDimensioneFoto / dimensioneFoto;
       for (var i = 0; i < nodiArea.length; i++) {
          for (var j = 0; j < coordinateAree[i].length; j++) {
             coordinateAree[i][j] /= ratio;
          }
           nodiArea[i].coords = coordinateAree[i].join(',');
       }
       attualeDimensioneFoto = dimensioneFoto;
       nodoLettera1.setAttribute("width", dimensioneFoto);

       var attualeDimensioneFoto = nodoLettera2.width;
       var ratio = attualeDimensioneFoto / dimensioneFoto;
       for (var i = 0; i < nodiArea2.length; i++) {
          for (var j = 0; j < coordinateAree2[i].length; j++) {
             coordinateAree2[i][j] /= ratio;
          }
           nodiArea2[i].coords = coordinateAree2[i].join(',');
       }
       attualeDimensioneFoto = dimensioneFoto;
       nodoLettera2.setAttribute("width", dimensioneFoto);

       var attualeDimensioneFoto = nodoLettera3.width;
       var ratio = attualeDimensioneFoto / dimensioneFoto;
       for (var i = 0; i < nodiArea3.length; i++) {
          for (var j = 0; j < coordinateAree3[i].length; j++) {
             coordinateAree3[i][j] /= ratio;
          }
           nodiArea3[i].coords = coordinateAree3[i].join(',');
       }
       attualeDimensioneFoto = dimensioneFoto;
       nodoLettera3.setAttribute("width", dimensioneFoto);

       var attualeDimensioneFoto = nodoLettera4.width;
       var ratio = attualeDimensioneFoto / dimensioneFoto;
       for (var i = 0; i < nodiArea4.length; i++) {
          for (var j = 0; j < coordinateAree4[i].length; j++) {
             coordinateAree4[i][j] /= ratio;
          }
           nodiArea4[i].coords = coordinateAree4[i].join(',');
       }
       attualeDimensioneFoto = dimensioneFoto;
       nodoLettera4.setAttribute("width", dimensioneFoto);


    } catch ( e ) {
       alert("gestoreResize " + e);
    }
  }

  var LARGHEZZA_FOTO = 386;
  var nodoLettera1;
  var nodoLettera2;
  var nodoLettera3;
  var nodoLettera4;

  var nodiArea;
  var nodiArea2;
  var nodiArea3;
  var nodiArea4;

  var coordinateAree;
  var coordinateAree2;
  var coordinateAree3;
  var coordinateAree4;

  var dimensioneFoto;
  
  function gestoreLoad () {
    try {
       nodiArea = document.getElementsByClassName("LL1.3_folio_1fr_class");
       nodoLettera1 = document.getElementById("imglettera1");
       nodiArea2 = document.getElementsByClassName("LL1.3_folio_1rr_class");
       nodoLettera2 = document.getElementById("imglettera2");
       nodiArea3 = document.getElementsByClassName("LL1.3_folio_1rv_class");
       nodoLettera3 = document.getElementById("imglettera3");
       nodiArea4 = document.getElementsByClassName("LL1.3_folio_1fv_class");
       nodoLettera4 = document.getElementById("imglettera4");
       
       coordinateAree = [];
       coordinateAree2 = [];
       coordinateAree3 = [];
       coordinateAree4 = [];

       for (var i = 0; i < nodiArea.length; i++){	
          var nodoArea = nodiArea[i];
          coordinateAree[i] = nodoArea.coords.split(',');
        }
        for (var i = 0; i < nodiArea2.length; i++){	
         var nodoArea2 = nodiArea2[i];
         coordinateAree2[i] = nodoArea2.coords.split(',');
       }
       for (var i = 0; i < nodiArea3.length; i++){	
         var nodoArea3 = nodiArea3[i];
         coordinateAree3[i] = nodoArea3.coords.split(',');
       }
       for (var i = 0; i < nodiArea4.length; i++){	
         var nodoArea4 = nodiArea4[i];
         coordinateAree4[i] = nodoArea4.coords.split(',');
       }
       dimensioneFoto = LARGHEZZA_FOTO;
  
       gestoreResize(); 
     } catch ( e ) {
        alert ("gestoreLoad " + e);
     }
  }
  
  window.onload = gestoreLoad;
  