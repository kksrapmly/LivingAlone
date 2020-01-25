// if(/room/.test(window.location.pathname)) { 
//   var path = window.location.pathname.split('/');
//   var room_id = path[path.length - 1];
//   App.room = App.cable.subscriptions.create({ channel: "RoomChannel", room_id: room_id }, {
//     connected: function() {},
//     disconnected: function() {},
//     received: function(data) {
//       $('.chatShowpage_message').append(data['content']);
//     },
//     speak: function(conversation) {
//       return this.perform('speak', {
//         conversation: conversation,
//         room_id: room_id,
//         user_id: $('meta[name="current_user_id"]').attr('content')
//       });
//     }
//   });

//   $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
//     if (event.keyCode === 13) {
//       App.room.speak(event.target.value);
//       event.target.value = '';
//       return event.preventDefault();
//     }
//   });
// }
