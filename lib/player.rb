require_relative 'scoring'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score, :tiles

    def initialize(name)
      raise ArgumentError.new("name must be a string!") if name.class != String
      raise ArgumentError.new("name string cannot be empty!") if name == ""

      @name = name
      @plays = []
      @total_score = 0
      @tiles = []
    end

    def play(word)
      return false if won?
      score = Scoring.score(word)
      @plays << word
      @total_score += score

      return score
    end

    def highest_scoring_word
      word = Scoring.highest_score_from(@plays)
      return word
    end

    def highest_word_score
      return Scoring.score(highest_scoring_word)
    end

    def won?
      return @total_score > 100
    end

  end
end
