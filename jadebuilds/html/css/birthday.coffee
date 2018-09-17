# birthday.coffee

# determine edit or display mode
getQueryParamsByName = `function(name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}`
# via http://stackoverflow.com/questions/901115/how-can-i-get-query-string-values-in-javascript
getQueryParams = ->
	o = {}
	o[param] = getQueryParamsByName param for param in "to song".split ' '
	o

isDisplayMode = (query) ->
	{to, song} = query
	return true if to && song
	false

birthdaySong = (type, name) ->
	if type == 'f' # futurama
		"""
			What day is today? <br/>
			It's #{name}'s birthday! <br/>
			What a day for a birthday! <br/>
			Let's all have some cake! <br/>
		"""
	else if type == 't' # traditional
		"""
			Happy Birthday to You <br/>
			Happy Birthday to You <br/>
			Happy Birthday Dear #{name} <br/>
			Happy Birthday to You! <br/>
		"""
	else "Happy Birthday #{name}!"


main = ->
	query = getQueryParams()
	display = isDisplayMode query

	if !display
		form = document.getElementById 'bday-form'
		form.style.display = 'block' if form
	else
		{to, song} = query
		songOutlet = document.getElementById 'song-outlet'
		songOutlet.innerHTML = birthdaySong song, to
		nameOutlet = document.getElementById 'name-outlet'
		nameOutlet.innerHTML = "Happy Birthday #{to}!"
		callOutlet = document.getElementById 'call-outlet'
		callOutlet.innerHTML = "I'm super serial."
	# show
	card = document.getElementById 'card'
	card.className = 'loaded' if card

# init
main()