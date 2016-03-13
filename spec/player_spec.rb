require 'spec_helper'
require 'player'

describe Player do
  before(:all) do
    @player = Player.new
  end

  it 'should return user guess' do
    allow(@player).to receive(:get_player_guess).and_return('1234')
    expect(@player.guess).to eq [1, 2, 3, 4]
  end
end
