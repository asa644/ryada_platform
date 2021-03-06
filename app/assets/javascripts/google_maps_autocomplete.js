function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);

  var listingAddress = document.getElementById('listing_address');
  listingAddress.blur();
  listingAddress.value = components.address;

  document.getElementById('listing_zip_code').value = components.zip_code;
  document.getElementById('listing_city').value = components.city;
  var position = $('.map_structure').css('position');
  if (position == 'fixed'){
      document.getElementById('listing_latitude').value = place.geometry.location.lat();
      document.getElementById('listing_longitude').value = place.geometry.location.lng();
    }
  if (components.country_code) {
    var selector = '#listing_country option[value="' + components.country_code + '"]';
    document.querySelector(selector).selected = true;
  }
}
// console.log('hello');
function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()

  if (window.console && typeof console.log === "function") {
    console.log(place.formatted_address);
    // console.log(place.city);
  }

  var street_number = null;
  var route = null;
  var zip_code = null;
  var city = null;
  var country_code = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      // console.log(type);
      var type = component.types[j];
      if (type === 'street_number') {
        street_number = component.long_name;
      } else if (type === 'route') {
        route = component.long_name;
      } else if (type === 'postal_code') {
        zip_code = component.long_name;
      } else if (type === 'locality') {
        city = component.long_name;
        console.log(city);
      } else if (type === 'country') {
        country_code = component.short_name;
      }
    }
  }

  return {
    address: place.formatted_address,
    zip_code: zip_code,
    city: city,
    country_code: country_code
  };
}

document.addEventListener("DOMContentLoaded", function() {
  var listingAddress = document.getElementById('listing_address');

  if (listingAddress) {
    var autocomplete = new google.maps.places.Autocomplete(listingAddress, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(listingAddress, 'keydown', function(e) {
      if (e.key === "Enter") {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});
