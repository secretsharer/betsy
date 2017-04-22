class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true, allow_blank: false

  has_and_belongs_to_many :products
end
