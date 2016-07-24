class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_associated :ticket_types
  validates_presence_of :user

  validates_presence_of :extended_html_description, :venue, :category, :starts_at, :name
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.search(search)
    where('Lower(name) LIKE ? OR LOWER(extended_html_description) LIKE ?', "%#{search.downcase}%")
  end
end
