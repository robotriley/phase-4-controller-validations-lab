class Author < ApplicationRecord
  validates :name, presence: true
  validates :email, confirmation: {case_sensitive: true}, uniqueness: true
end
