/* eslint-env node, es6 */
/* eslint-env jquery */
/* eslint strict: ["error", "global"] */
/* global svgPanZoom, realZoom, panZoom, realZoom, panZoom */
/* eslint no-undef: "error" */

"use strict";

$(document).ready(function() {
  $(".cluster, .node").click(function(e) {
    if (e.ctrlKey) {
      return;
    }
    e.preventDefault();

    var prefix = $(this).attr("id");

    $(".edge").not(`[id^="${prefix}@"]`).removeClass("edge-showed").addClass("edge-hidden");
    $(".cluster, .node").not(`[id^='${prefix}']`).removeClass("fade-back").addClass("fade-away");

    $(`.edge[id^='${prefix}@']`)
      .addClass("edge-showed")
      .each(function(idx) {
        var destination = $(this).attr("id").split("@")[1];
        $(`.node[id='${destination}']`).removeClass("fade-away").addClass("fade-back");
      });

    $(".cluster, .node").filter(`.fade-away[id^='${prefix}']`).removeClass("fade-away").addClass("fade-back");
  });

  $('.graph0, .cluster, .node').each(function() {
    $(this).attr('data-search-term', $(this).text().toLowerCase());
    $('.live-search-box').on('keyup submit', function() {
      var searchTerm = $(this).val().toLowerCase();
      $('.graph0, .cluster, .node').each(function() {
        if ($(this).filter('[data-search-term *= ' + searchTerm + ']').length > 0 || searchTerm.length < 1) {
          $(this).show();
          $(this)[0].scrollIntoView({
            behavior: "auto",
            block: "center"
          });
        } else {
          $(this).hide();
        }
      });
    });
  });

  var zoom = svgPanZoom('#svg-id', {
    zoomEnabled: true,
    viewportSelector: '.g',
    controlIconsEnabled: true,
    mouseWheelZoomEnabled: false,
    minZoom: 0.1
  });

  $("#zoomin").click(function(e) {
    zoom.zoomIn();
  });

  $("#zoomout").click(function() {
    zoom.zoomOut();
    zoom.pan({
      x: 0,
      y: 0
    });
    zoom.pan({
      x: -(755 * realZoom) + (panZoom.getSizes().width / 2),
      y: -(240 * realZoom) + (panZoom.getSizes().height / 2)
    });
  });

  $("#reset").click(function() {
    zoom.resetZoom();
    zoom.reset();
    $(".node, .cluster").addClass("fade-back");
    $(".edge").removeClass("edge-showed");
    $('.graph0, .cluster, .node').show();
    $('#svg').each(function() {
      $(this).data('originalParent', $(this).parent());
    });
    var searchbox = document.getElementById("tags");
    searchbox.value = searchbox.defaultValue;
  });

  const matchWords = /(?!type|label)[0-9a-zA-Z_::]+/gi;
  const results = [];
  const testStr = $('.graph0, .cluster, .node').text().toString();
  let match = null;
  while(match = matchWords.exec(testStr)) {
  	results.push(match[0]);
  }

  function onlyUnique(value, index, self) {
  	return self.indexOf(value) === index;
  }
  var x = results;
  var unique = x.filter(onlyUnique);
  var availableTags = unique;

  $("#tags").autocomplete({
    source: availableTags
  });

  function copyToClipboard(element) {
    var $temp = $("<input>");
    $("body").append($temp);
    $temp.val($(element).text()).select();
    document.execCommand("copy");
    $temp.remove();
  }

  $('text').click("Ctrl+C", function() {
    copyToClipboard($(this));
  });
});