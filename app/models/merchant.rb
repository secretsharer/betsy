class Merchant < ApplicationRecord
  has_many :products

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.create_from_github(auth_hash)
    merchant = Merchant.new
    merchant.uid = auth_hash['uid']
    merchant.provider = auth_hash['provider']
    merchant.username = auth_hash['info']['name']
    merchant.email = auth_hash['info']['email']

    merchant.save ? merchant : nil # if it's saved, it will return the user. Otherwise, it returns nil. w/o this, it will return true or false
  end
end
