require_relative '../nameable'

RSpec.describe Nameable do
  let(:nameable) { Nameable.new }

  it 'creates a new Nameable instance' do
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
