require 'spec_helper'
require 'ttt_web/views/game'

describe TttWeb::Views::Game do
  let(:player) { mock_player }
  let(:game) { test_game }
  let(:gv) { TttWeb::Views::Game.new(game) }

  def mock_player
    instance_double("TicTacToeGS::Core::Players::Human").tap do |player|
      allow(player).to receive(:set_marks)
      allow(player).to receive(:get_move).and_return(0)
    end
  end

  def test_game
    TicTacToeGS::Core::Game.new_game.tap do |game|
      game.set_players(player, player)
    end
  end

  it 'can find the mustache template' do
    expect(gv.render).to be_a(String).and start_with('<!DOCTYPE html>').and end_with("</html>\n")
  end

  it 'returns the correct value for the current mark image' do
    expect(gv.current_mark).to eq("ex")
    game.next_turn
    expect(gv.current_mark).to eq("oh")
  end

end

describe TttWeb::Views::FinishedGame do
  context 'with X winning' do
    let(:game) { TicTacToeGS::Core::Game.new(TicTacToeGS::Core::Board.from(["X", " ", " ",
                                                                        "O", "X", "O",
                                                                        " ", " ", "X"])) }

    it 'displays the winning mark correctly' do
      body = TttWeb::Views::FinishedGame.render(game)
      expect(body).not_to include("<form")
      expect(body).to include("Player X Wins!")
    end
  end

  context 'with a draw game' do
    let(:game) { TicTacToeGS::Core::Game.new(TicTacToeGS::Core::Board.from(["X", "O", "X",
                                                                        "O", "X", "O",
                                                                        "O", "X", "O"])) }

    it 'displays the draw message' do
      body = TttWeb::Views::FinishedGame.render(game)
      expect(body).not_to include("<form")
      expect(body).not_to include("Wins!")
      expect(body).to include("It's a draw!")
    end
  end
end
