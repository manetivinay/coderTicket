require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) {Event.new}

  describe '#Validate_presenece_of' do
    it 'extended_html_description' do
      expect(event.save).to eq false
      expect(event.errors.full_messages).to include("Extended html description can't be blank")
    end
  end

  describe '#validate_presence_of_venue' do
    it 'venue should be present' do
      event.venue_id = nil
      event.save
      expect(event.errors.full_messages).to include("Venue can't be blank")
    end
  end

  describe '#validates_presence_of_category' do
    it 'category should be present' do
      event.category_id = ''
      event.save
      expect(event.errors.full_messages).to include("Category can't be blank")
    end
  end

  describe '#validates_presence_of_starts_at' do
    it 'start at should be present' do
      event.save
      expect(event.errors.full_messages).to include("Starts at can't be blank")
    end
  end
end

