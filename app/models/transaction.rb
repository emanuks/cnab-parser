# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :block

  TX_TYPES = [
    '',
    'Débito',
    'Boleto',
    'Financiamento',
    'Crédito',
    'Recebimento Empréstimo',
    'Vendas',
    'Recebimento TED',
    'Recebimento DOC',
    'Aluguel'
  ].freeze
end
