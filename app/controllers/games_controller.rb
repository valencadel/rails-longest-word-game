require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    @included = @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) }

    response = URI.parse("https://dictionary.lewagon.com/#{@word}")
    json = JSON.parse(response.read)
    @is_english = json['found']
  end
end
