// ==UserScript==
// @name         Replace learningspace links
// @namespace    http://192.168.33.*
// @version      0.1
// @description  Replace link learningspace.falmouth.ac.uk hrefs with the [development] url. Designed to work on moodle_dev default (scotchbox) urls.
// @author       tombola
// @match        http://*/*
// @grant        none
// @require http://code.jquery.com/jquery-latest.js
// ==/UserScript==

document.linkrewrites = 0;

var linkRewriter = function(a, b) {
    $('a[href*="' + a + '"]').each(function() {
        $(this).attr('href', $(this).attr('href').replace(a, b));
        document.linkrewrites ++;
    });
};

$( document ).ready(function() {
    linkRewriter('learningspace.falmouth.ac.uk', document.domain);
    console.log( document.linkrewrites+" learningspace links rewritten" );
});