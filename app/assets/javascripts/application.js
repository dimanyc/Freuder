// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


/*Dismiss alerts after 4ms.*/
$(document).ready (function(){
  $(".alert").delay(4000).slideUp(200, function() {
      $(this).alert('close');
  });
 
  (function($) {

    $.fn.charCounter = function (max, settings) {
      max = max || 100;
      settings = $.extend({
        container: "<span></span>",
        classname: "charcounter",
        format: "(%1 characters remaining)",
        pulse: true,
        delay: 0
      }, settings);
      var p, timeout;
      
      function count(el, container) {
        el = $(el);
        if (el.val().length > max) {
            el.val(el.val().substring(0, max));
            if (settings.pulse && !p) {
              pulse(container, true);
            };
        };
        if (settings.delay > 0) {
          if (timeout) {
            window.clearTimeout(timeout);
          }
          timeout = window.setTimeout(function () {
            container.html(settings.format.replace(/%1/, (max - el.val().length)));
          }, settings.delay);
        } else {
          container.html(settings.format.replace(/%1/, (max - el.val().length)));
        }
      };
      
      function pulse(el, again) {
        if (p) {
          window.clearTimeout(p);
          p = null;
        };
        el.animate({ opacity: 0.1 }, 100, function () {
          $(this).animate({ opacity: 1.0 }, 100);
        });
        if (again) {
          p = window.setTimeout(function () { pulse(el) }, 200);
        };
      };
      
      return this.each(function () {
        var container;
        if (!settings.container.match(/^<.+>$/)) {
          // use existing element to hold counter message
          container = $(settings.container);
        } else {
          // append element to hold counter message (clean up old element first)
          $(this).next("." + settings.classname).remove();
          container = $(settings.container)
                  .insertAfter(this)
                  .addClass(settings.classname);
        }
        $(this)
          .unbind(".charCounter")
          .bind("keydown.charCounter", function () { count(this, container); })
          .bind("keypress.charCounter", function () { count(this, container); })
          .bind("keyup.charCounter", function () { count(this, container); })
          .bind("focus.charCounter", function () { count(this, container); })
          .bind("mouseover.charCounter", function () { count(this, container); })
          .bind("mouseout.charCounter", function () { count(this, container); })
          .bind("paste.charCounter", function () { 
            var me = this;
            setTimeout(function () { count(me, container); }, 10);
          });
        if (this.addEventListener) {
          this.addEventListener('input', function () { count(this, container); }, false);
        };
        count(this, container);
      });
    };

  })(jQuery);

  $(function() {
      $(".counted").charCounter(140,{container: "#counter"});
  });

});
