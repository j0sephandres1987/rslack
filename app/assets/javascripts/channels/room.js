App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $("#messages").append(data);
  },

  /*speak: function(message, room_name) {
    return this.perform('speak', {message: message, room_name: room_name});
  }*/
  speak: function(message, room) {
   return this.perform('speak', {message: message, room: room});
  }
});
