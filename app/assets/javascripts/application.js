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
//= require_tree .
/*
jQuery.ajaxSetup({
    'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") }
});

$.fn.subSelectWithAjax = function() {
    var that = this;

    this.change(function() {
        $.post(that.attr('rel'), {id: that.val()}, null, "script");
    });
};

$("#widget_subcategory").subSelectWithAjax();
*/

jQuery(document).ready(function() {

// jQuery('#regform_district_id').html("<option value=''>Select District</option>");
    jQuery('#item_location_id').change(function() {
        var data=$('#item_location_id').val();
        $.ajax({

            type: "POST",
            url: "http://"+location.host+"/dynamic_districts/"+data,
            data: data,

            beforeSend: function()
            {
                // alert('hi');
                //$('#status').html('<img src="loading.gif">');

            },

            success: function(response)
            {
                // alert(response);
                // $('#regform_district_id').html(html); //dynamic_districts.js.erb
                // $('#status').html(html);


            }

        });
    });
});
