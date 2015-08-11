// var MoviePopup = {
//   setup: function(){
//     var popupDiv = $('<div id="movieInfo"></div>');
//     popupDiv.hide().appendTo($('body'));
//     $(document).on('click', '#movies a',  MoviePopup.getMovieInfo);
//   },
//   getMovieInfo: function() {
//     $.ajax({type: 'GET',
//             url: $(this).attr('href'),
//             timeout: 5000,
//             success: MoviePopup.showMovieInfo,
//             error: function(xhrObj, textStatus, exception) {
//               alert('Error!');
//             }
//           });
//     return(false);
//   },
//   showMovieInfo: function(data, requestStatus, xhrObject) {
//     var oneFourth = Math.ceil($(window).width() / 4);
//     $('#movieInfo').
//       css({'left': oneFourth, 'width': 2*oneFourth, 'top': 250}).
//       html(data).
//       show();
//     $('#closeLink').click(MoviePopup.hideMovieInfo);
//     return false;
//   },
//   hideMovieInfo: function() {
//     $('#movieInfo').hide();
//     return false;
//   }
// };
// $(MoviePopup.setup)