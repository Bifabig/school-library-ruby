require_relative '../nameable'
require_relative '../decorator'

RSpec.describe Decorator do
  let(:nameable) { Nameable.new }
  let(:decorator) { Decorator.new(nameable) }

  it 'creates a new Decorator instance' do
    expect(decorator).to be_a(Decorator)
  end

  it 'calls the correct_name method of the nameable object' do
    allow(nameable).to receive(:correct_name).and_return('Biftu G.')
    expect(decorator.correct_name).to eq('Biftu G.')
  end
end
