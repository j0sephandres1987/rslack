(function() {
  var messages = $("#messages");
  messages.scrollTop(messages.prop('scrollHeight'));
  $("#message_input").focus();

  $(document).keypress(function(e) {
    if(e.keyCode == 13 && e.target.value) {
      App.room.speak(e.target.value);
      e.target.value = "";
      e.preventDefault();
    }
  });
});
