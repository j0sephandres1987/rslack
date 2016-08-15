$(document).ready(function() {
  var messages = $("#messages");
  messages.scrollTop(messages.prop('scrollHeight'));
  $("#message_input").focus();

  $("#message_input").keypress(function(e) {
    if(e.keyCode == 13 && $("#message_input").val()) {
      console.log("ikgsdfh");
      App.room.speak($("#message_input").val());
      $("#message_input").val("");
    }
  });
});
