// var MoviePopupJson = {
//   setup: function(){
//     var popupDiv = $('<div id="movieInfo"></div>');
//     popupDiv.hide().appendTo($('body'));
//     $(document).on('click', '#movies a',  MoviePopupJson.getMovieInfo);
//   },
//   getMovieInfo: function() {
//     $.ajax({type: 'GET',
//             dataType: 'json',
//             url: $(this).attr('href'),
//             timeout: 5000,
//             success: MoviePopupJson.showMovieInfo,
//             error: function(xhrObj, textStatus, exception) {
//               alert('Error!');
//             }
//           });
//     return(false);
//   },
//   showMovieInfo: function(jsonData, requestStatus, xhrObject) {
//     console.log('jsonData: '+JSON.stringify(jsonData));
//     var oneFourth = Math.ceil($(window).width() / 4);
//     $('#movieInfo').
//       css({'left': oneFourth, 'width': 2*oneFourth, 'top': 250}).
//       html($('<p>'+jsonData.description+'</p><a id="closeLink" href="#"></a>')).
//       show();
//     $('#closeLink').click(MoviePopupJson.hideMovieInfo);
//     return false;
//   },
//   hideMovieInfo: function() {
//     $('#movieInfo').hide();
//     return false;
//   }
// };
// $(MoviePopupJson.setup)