require 'spec_helper'
require 'computer'

describe Computer do
  it 'should generate 4-length code' do
    expect(Computer.new.generate_code(4).length).to eq 4
  end
end
