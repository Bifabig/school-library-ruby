require_relative '../nameable'
require_relative '../capitalizedecorator'

RSpec.describe CapitalizeDecorator do
  let(:nameable) { Nameable.new }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  it 'creates a new CapitalizeDecorator instance' do
    expect(decorator).to be_a(CapitalizeDecorator)
  end

  it 'calls the correct_name method and capitalizes the name' do
    allow(nameable).to receive(:correct_name).and_return('biftu')
    expect(decorator.correct_name).to eq('Biftu')
  end
end
