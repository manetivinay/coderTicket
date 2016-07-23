require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) {Region.new}

  describe '#validates_inclusion_of' do
    it 'extended_html_description' do
      region.name = 'Vietnam'
      expect(region.save).to eq false
      expect(region.errors.full_messages).to include("Name is not included in the list")
    end
  end

  it 'should contain only 1' do
    Region.create(name: 'Ho Chi Minh')
    region.name = 'Ho Chi Minh'
    expect(region.save).to eq false
    expect(region.errors.full_messages).to include("Name has already been taken")
  end

end
