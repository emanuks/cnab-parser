require 'rails_helper'

describe CnabParserService do
  describe '.call' do
    context 'with invalid file path' do
      it 'raise an exception' do
        service = described_class.new('invalid_file_path.txt')
        expect { service.call }.to raise_error(Errno::ENOENT)
      end
    end

    context 'with valid file path but with incorrect amount of characters per line' do
      it 'raise an exception' do
        service = described_class.new('incorrect_CNAB.txt')
        expect { service.call }.to raise_error(StandardError)
      end
    end

    context 'with valid file path but with invalid type' do
      it 'raise an exception' do
        service = described_class.new('incorrect_type.txt')
        expect { service.call }.to raise_error(StandardError)
      end
    end

    context 'with valid file path but with invalid date' do
      it 'raise an exception' do
        service = described_class.new('incorrect_date.txt')
        expect { service.call }.to raise_error(StandardError)
      end
    end

    context 'with valid file path but with invalid value' do
      it 'raise an exception' do
        service = described_class.new('incorrect_value.txt')
        expect { service.call }.to raise_error(StandardError)
      end
    end

    context 'with valid file path but with invalid cpf' do
      it 'raise an exception' do
        service = described_class.new('incorrect_cpf.txt')
        expect { service.call }.to raise_error(StandardError)
      end
    end

    context 'with valid file path but with invalid bank card' do
      it 'raise an exception' do
        service = described_class.new('incorrect_bank_card.txt')
        expect { service.call }.to raise_error(StandardError)
      end
    end

    context 'with valid file path but with invalid time' do
      it 'raise an exception' do
        service = described_class.new('incorrect_time.txt')
        expect { service.call }.to raise_error(StandardError)
      end
    end
  end
end
