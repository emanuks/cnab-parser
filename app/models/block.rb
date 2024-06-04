class Block < ApplicationRecord
  has_many :transactions
  belongs_to :user

  has_one_attached :cnab
end
