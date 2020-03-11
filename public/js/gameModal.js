function fetchModal( id ) {
  $.get("/games/"+ id)
      .done(function ( data ) {
          buildModal( data );
          $("#gameModal").modal('show');
      })
      .fail( function () {
          alert( "Error in network call, please try again.")
      })
}

function buildModal( game ) {
  $('#modalContainer').replaceWith(`
      <div id="modalContainer">
          <div class="modal fade" id="gameModal" tabindex="-1" role="dialog" aria-hidden="true">
              <div class="modal-dialog" role="document">
                  <div class="modal-content">
                      <div class="modal-header">
                          <h5 class="modal-title">${game.name}</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                          </button>
                      </div>
                      <div class="modal-body">
                          <div class="row justify-content-center card-image">
                              <img src="${game.image}" class="img-fluid img-thumbnail">
                          </div>
                          <table class="table">
                              <tr><th>Name</th><td>${game.name}</td></tr> 
                              <tr><th>Year</th><td>${game.year}</td></tr> 
                              <tr><th>Publisher</th><td>${game.publisher}</td></tr>
                              <tr><th>Description</th><td>${game.description}</td></tr>
                          </table>
                      </div>
                      <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  `)
}