# frozen_string_literal: true

class Block < ApplicationRecord
  has_many :transactions, dependent: :destroy
  belongs_to :user

  has_one_attached :cnab

  validates :name, presence: true
  validates :cnab, presence: { with: true, message: "file can't be blank" }

  INCOME_TYPES = %w[1 4 5 6 7 8].freeze
  EXPENSE_TYPES = %w[2 3 9].freeze

  def incomes
    total = 0

    transactions.each do |transaction|
      total += transaction.tx_value if INCOME_TYPES.include? transaction.tx_type
    end

    total
  end

  def expenses
    total = 0

    transactions.each do |transaction|
      total += transaction.tx_value if EXPENSE_TYPES.include? transaction.tx_type
    end

    total
  end

  def total
    incomes - expenses
  end
end
