// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require_tree .

$(function() {

currdir = $(location).attr('href');
var root = location.protocol + '//' + location.host;

init_alert()

$('#bu_alert_01').click(function () {
var msg = 'Ongoing work';
alert(msg);
});

function init_alert() {
$.ajax({
url: root+'/interacs',
//type: 'GET',
dataType: "json",
beforeSend: function(a){ },
success: function(a){
$('#divright_alert').html(
'There are a<br />maximum of<br /><b>'+
a[0]['user_interactions']+
'</b><br />interactions<br />for user '+
a[0]['user_id']+'<br />app n. '+a[0]['app_id']
);
},
error: function(a,b,c){ alert( 'a = ' + a + '\nb = ' + b + '\nc = ' + c ) },
complete: function(a,b){ }
});
}

});
