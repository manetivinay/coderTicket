class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_insenssiitve: false}
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  has_secure_password

  validates_uniqueness_of :name

  has_many :events
end
