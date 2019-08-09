// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
    var latitudeFieldElement = $('#latitude');
    var longitudeFieldElement = $('#longitude');

    var latitude = getParam('latitude');
    var longitude = getParam('longitude');

    if (latitude && longitude) {
        latitudeFieldElement.attr('value', latitude);
        longitudeFieldElement.attr('value', longitude);
    } else {
        navigator.geolocation.getCurrentPosition(function(position){
            latitudeFieldElement.attr('value', position.coords.latitude);
            longitudeFieldElement.attr('value', position.coords.longitude);
        });
    }
});

function getParam(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

