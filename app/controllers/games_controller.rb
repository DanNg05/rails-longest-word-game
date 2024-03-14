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
    @word = params["word"].downcase
    @grid = params[:array].split(",")
    # web = "https://wagon-dictionary.herokuapp.com/#{@word}"
    # user_serialized = URI.open(web).read
    # user = JSON.parse(user_serialized)
    # @include = include?(@word, @grid)
    if include?(@word, @grid)
      if check_word(@word)
        @answer = "english word"
      else
        @answer = "Sorry not an English word!"
      end
    else
      @answer = "Not in the grid"
    end
    # raise
  end

  private

  def include?(guess, grid)
    guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end

  def check_word(word)
    web = "https://wagon-dictionary.herokuapp.com/#{word}"
    user_serialized = URI.open(web).read
    user = JSON.parse(user_serialized)
    return user["found"]
  end
end
