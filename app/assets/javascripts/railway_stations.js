$(document).ready(function () {
   $('a.edit_station').on('click', function (e) {
      e.preventDefault();
      var station_id;
      var form;
      var title;

      station_id = $(this).data('stationId');
      form = $('#edit_railway_station_' + station_id);
      title = $('#station_title_' + station_id);

      if (!$(this).hasClass('cancel')) {
          $(this).html('cancel');
          $(this).addClass('cancel');
      } else {
          $(this).html('edit');
          $(this).removeClass('cancel');
      }

     form.toggle();
     title.toggle();
   });
});
