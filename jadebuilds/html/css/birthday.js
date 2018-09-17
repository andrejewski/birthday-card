// Generated by CoffeeScript 1.6.2
(function() {
  var birthdaySong, getQueryParams, getQueryParamsByName, isDisplayMode, main;

  getQueryParamsByName = function(name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
};

  getQueryParams = function() {
    var o, param, _i, _len, _ref;

    o = {};
    _ref = "to song".split(' ');
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      param = _ref[_i];
      o[param] = getQueryParamsByName(param);
    }
    return o;
  };

  isDisplayMode = function(query) {
    var song, to;

    to = query.to, song = query.song;
    if (to && song) {
      return true;
    }
    return false;
  };

  birthdaySong = function(type, name) {
    if (type === 'f') {
      return "What day is today? <br/>\nIt's " + name + "'s birthday! <br/>\nWhat a day for a birthday! <br/>\nLet's all have some cake! <br/>";
    } else if (type === 't') {
      return "Happy Birthday to You <br/>\nHappy Birthday to You <br/>\nHappy Birthday Dear " + name + " <br/>\nHappy Birthday to You! <br/>";
    } else {
      return "Happy Birthday " + name + "!";
    }
  };

  main = function() {
    var callOutlet, card, display, form, nameOutlet, query, song, songOutlet, to;

    query = getQueryParams();
    display = isDisplayMode(query);
    if (!display) {
      form = document.getElementById('bday-form');
      if (form) {
        form.style.display = 'block';
      }
    } else {
      to = query.to, song = query.song;
      songOutlet = document.getElementById('song-outlet');
      songOutlet.innerHTML = birthdaySong(song, to);
      nameOutlet = document.getElementById('name-outlet');
      nameOutlet.innerHTML = "Happy Birthday " + to + "!";
      callOutlet = document.getElementById('call-outlet');
      callOutlet.innerHTML = "I'm super serial.";
    }
    card = document.getElementById('card');
    if (card) {
      return card.className = 'loaded';
    }
  };

  main();

}).call(this);