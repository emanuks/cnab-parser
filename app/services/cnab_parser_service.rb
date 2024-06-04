# frozen_string_literal: true

require 'date'

class CnabParserService
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    file = File.open(@file_path)

    parse(file)
  end

  private

  def validate_format(line)
    raise StandardError unless line.length == 81
  end

  def parse(file)
    transactions = []

    file.each do |line|
      validate_format(line)

      tx_type = line[0]
      validate_type(tx_type)

      date_string = line[1..8]
      tx_date = Date.parse(date_string)

      value_string = line[9..18]
      validate_value(value_string)
      tx_value = value_string.to_i / 100

      cpf = line[19..29]
      validate_cpf(cpf)

      bank_card = line[30..41]
      validate_bank_card(bank_card)

      time_string = line[42..47]
      tx_time = Time.parse("#{date_string} #{time_string}")

      owner_name = line[48..61].strip

      store_name = line[62..80].strip

      transactions << {
        tx_type:,
        tx_date:,
        tx_value:,
        cpf:,
        bank_card:,
        tx_time:,
        owner_name:,
        store_name:
      }
    end

    transactions
  end

  def validate_type(type)
    type_int = type.to_i
    raise StandardError unless type_int.positive? && type_int < 10
  end

  def validate_value(value)
    raise StandardError unless contains_only_numbers?(value)
  end

  def validate_cpf(cpf)
    raise StandardError unless contains_only_numbers?(cpf) && CPF.valid?(cpf)
  end

  def validate_bank_card(bank_card)
    raise StandardError unless numbers_and_asterisks_only?(bank_card)
  end

  def contains_only_numbers?(string)
    string.scan(/\D/).empty?
  end

  def numbers_and_asterisks_only?(string)
    # Use a regular expression to check if the string contains only digits (0-9) and asterisks (*)
    /^[0-9*]+$/ === string
  end
end
