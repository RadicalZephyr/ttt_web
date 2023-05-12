require 'mustache'
require 'ttt_web/views/board'

module TttWeb

  module Views

    class Game < Mustache
      attr_reader :game, :x_mark, :o_mark

      def self.render(game)
        self.new(game).render
      end

      def initialize(game)
        @game = game
        @x_mark = TicTacToeGS::Core::Game::X
        @o_mark = TicTacToeGS::Core::Game::O
      end

      def current_mark
        case game.current_mark
        when x_mark
          "ex"
        when o_mark
          "oh"
        end
      end

      def x_current
        game.current_mark == x_mark
      end

      def o_current
        game.current_mark == o_mark
      end

      def board
        TttWeb::Views::Board.render(game.board)
      end
    end

    class FinishedGame < Mustache
      attr_reader :game, :winning_mark

      def self.render(game)
        self.new(game).render
      end

      def initialize(game)
        @game = game
        # This explicit nil check is to get around a weirdness in
        # mustache.  It seems mustache sees an empty string as both
        # true and false
        @winning_mark = game.who_won?.nil? ? nil : game.who_won?.to_s
      end

      def board
        TttWeb::Views::Board.render(game.board, true)
      end
    end

  end
end
