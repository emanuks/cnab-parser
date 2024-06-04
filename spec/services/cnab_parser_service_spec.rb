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
        expect { service.call }.to raise_error(Date::Error)
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

    context 'with valid file and correct values' do
      it 'should return the transaction array' do
        service = described_class.new('CNAB.txt')
        transactions = [{
          type: '3',
          date: Date.parse('20190301'),
          value: 142,
          cpf: '09620676017',
          bank_card: '4753****3153',
          time: Time.parse('20190301 153453'),
          owner_name: 'JOÃO MACEDO',
          store_name: 'BAR DO JOÃO'
        }]

        expect(service.call).to eq(transactions)
      end
    end
  end
end
