require "#{Rails.root}/app/models/web_spellchecker.rb"


class DictionaryWordsController < ApplicationController
  def spellcheck
    input_word = params[:term]
    #render :text => "we want to check the word #{input_word}"
    if input_word.nil?
      return
    end 
    webSpellchecker = WebSpellchecker.new
    word_arr = webSpellchecker.correct(input_word)

    if word_arr.nil?
	render :text => "Unknown word and no suggestions"
        return
    end 
    
    if word_arr.include? input_word
      results = {"term"=> input_word, "known"=>true }
        
    else 
      results = {"term"=> input_word, "known"=>false, "suggestions"=> word_arr }
    end
    
    render :json => results

  end
end
