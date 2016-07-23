require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.new }

  describe '#validates_inclusion_of' do
    it 'should return true when provide valid name' do
      category.name = 'Entertainment'
      expect(category.save).to eq(true)
    end

    it 'should return false when provide invalid name' do
      category.name = 'Hello'
      expect(category.save).to eq(false)
      expect(category.errors.full_messages).to include('Name is not included in the list')
    end
  end

  describe '#validates_uniqueness_of' do
    it 'should have only 1 name' do
      Category.create(name: 'Entertainment')
      category.name = 'Entertainment'
      expect(category.save).to eq(false)
      expect(category.errors.full_messages).to include('Name has already been taken')
    end
  end
end

