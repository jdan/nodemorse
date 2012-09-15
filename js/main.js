$(function() {
  var server = io.connect('/');

  server.on('on', function(data) {
    $('body').addClass('active');
  });

  server.on('off', function(data) {
    $('body').removeClass('active');
  });

  $('#trigger').mousedown(function() {
    server.emit('on');
  });

  $('#trigger').mouseup(function() {
    server.emit('off');
  });
});
