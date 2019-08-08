/* eslint-env node, es6 */
/* eslint-env jquery */
/* eslint strict: ["error", "global"] */

"use strict";

$(document).ready(function(){
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
});
