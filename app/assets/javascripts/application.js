// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require materialize-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .


//$(document).ready(function() {
$(document).on('turbolinks:load', function() {
    $('select').material_select();
    Materialize.updateTextFields();
    $('.operator_id').dropdown();
    $('#obs').val('New Text');
    $('#obs').trigger('autoresize');
    $(".button-collapse").sideNav();
    $("ul.tabs").tabs();
    var $input = $('.datepicker').pickadate({
      selectMonths:true, selectYears: 15
    });
    $('.collapsible').collapsible({
      accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
    });
});
/*/
$(document).on('turbolinks:load', function() {
  $('select').material_select();
})

/*/

// Use the picker object directly.
var picker = $input.pickadate('picker')
