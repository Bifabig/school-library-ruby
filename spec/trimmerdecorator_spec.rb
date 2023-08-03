require 'rspec'
require_relative '../nameable'
require_relative '../trimmerdecorator'

RSpec.describe TrimmerDecorator do
  let(:nameable) { Nameable.new }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  it 'creates a new TrimmerDecorator instance' do
    expect(decorator).to be_a(TrimmerDecorator)
  end

  it 'calls the correct_name method and trims the result' do
    allow(nameable).to receive(:correct_name).and_return('Peter A.')
    expect(decorator.correct_name).to eq('Peter A.')
  end

  it 'trims the name to 10 characters if name > 10 characters' do
    allow(nameable).to receive(:correct_name).and_return('This name will be trimmed')
    expect(decorator.correct_name).to eq('This name ')
  end
end
