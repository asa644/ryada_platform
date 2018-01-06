//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
// = require star-rating
//= require add-listing
//= require underscore
//= require google_maps_autocomplete
//= require gmaps/google
//= require jpanelmenu.min
//= require cocoon
//= require chosen.min
//= require slick.min
//= require rangeslider.min
//= require magnific-popup.min
//= require waypoints.min
//= require counterup.min
//= require jquery-ui
//= require tooltips.min
//= require switcher
//= require custom
//= require dropzone
//= require moment
//= require bootstrap-datepicker
//= require fullcalendar
//= require turbolinks

// alert('Sadly this is static...');
$(document).on("submit", "form[data-turboform]", function(e) {
    Turbolinks.visit(this.action+(this.action.indexOf('?') == -1 ? '?' : '&')+$(this).serialize());
    return false;
});

