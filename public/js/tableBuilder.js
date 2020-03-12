$(document).ready(function () {
  loadTable();
});

var loadTable = function() {
  $.get( "/games")
    .done(function ( data ) {
        CreateTableFromJSON( data );
    })
    .fail( function () {
        alert( "Error in network call, please try again.")
    })
}

var CreateTableFromJSON = function( gamesJSON ) {
  var cols = ['Name', 'Year', 'Publisher'];
  var colsLwr = cols.map(function(ele) { return ele.toLowerCase(); });
  var table = document.createElement("table");
  table.setAttribute('class', 'table table-hover')

  var tr = table.insertRow(-1);
  tr.setAttribute('class', 'thead-dark')

  for (var i = 0; i < cols.length; i++) {
    var th = document.createElement("th");
    th.innerHTML = cols[i];
    tr.appendChild(th);
  };

  $.each(gamesJSON, function (index, gameRow) {
    tr = table.insertRow(-1);
    $.each(gameRow, function (key, value) {
      if( colsLwr.indexOf(key) > -1 ) {
        var tabCell = tr.insertCell(-1);
        if( key === colsLwr[0]) {
          tabCell.innerHTML = '<a href="javascript:void(0);" onclick="fetchModal(' + gameRow.id + ')">' + value + '</a>';
        } else {
          tabCell.innerHTML = value;
        }
      }
    })
  })

  var divContainer = document.getElementById("gamesData");
  divContainer.innerHTML = "";
  divContainer.appendChild(table);
}