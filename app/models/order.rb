class Order < ApplicationRecord

  class Order < ApplicationRecord
    has_many :orderitems, :foreign_key => 'orderitems'
    belongs_to :merchant, :foreign_key => 'merchant_id'

    validates :id, presence: true, uniqueness: true
    validates :session, presence: true

  end

end
