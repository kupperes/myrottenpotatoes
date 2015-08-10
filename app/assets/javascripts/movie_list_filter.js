var MovieListFilter = {
  filter_adult: function() {
    if($(this).is(':checked')) {
      $('tr.adult').hide();
    } else {
      $('tr.adult').show();
    }
  },
  setup: function() {
    var labelAndCheckbox = 
      $('<label for="filter">Only movies suitable for children</label>' + 
        '<input type="checkbox" id="filter"/>');
    labelAndCheckbox.insertBefore('#movies');
    $('#filter').change(MovieListFilter.filter_adult);
  }
};
$(MovieListFilter.setup);