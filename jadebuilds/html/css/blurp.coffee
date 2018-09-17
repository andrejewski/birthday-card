# blurp.coffee


getQueryParamsByName = `function(name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}`
# via http://stackoverflow.com/questions/901115/how-can-i-get-query-string-values-in-javascript
