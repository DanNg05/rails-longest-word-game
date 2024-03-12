require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @alphabet = ("a".."z").to_a
    @array = []
    9.times do
      @array << @alphabet.sample
    end
  end

  def score
    @word = params["word"]
    web = "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_serialized = URI.open(web).read
    user = JSON.parse(user_serialized)
    raise
  end
end
