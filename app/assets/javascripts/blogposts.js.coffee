# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'page:change', -> 
 cur_word = ""							#initialize current word to an empty string.
 
 $("#blogpost_contents").keypress (e) -> 			#update this line with correct selector and event  
  inp = String.fromCharCode(e.which) 				# get the 1-character string that the user typed
  
  if (inp.match(/[a-z]/i)) 					#if this was a letter (use .match method and regular expression)
    cur_word += inp						#add letter to current word

  else
    if (cur_word.match(/\w+/i)) 				# if the current word is a sequence of letters
      $.get window.location.origin + "/spellcheck/" + cur_word, (data) -> 

        if (!data.known)					#join suggestions in a single string
          str = 'The word "' + data.term + '" is unknown!, Did you mean: ' + data.suggestions[0] + ' ?'
          $("#suggestion").text(str)

     cur_word = ""  						#empty the word again
