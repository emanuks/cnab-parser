require 'rails_helper'

describe CnabParserService do
  describe '.call' do
    context 'with invalid file path' do
      it 'throws an error' do
        service = described_class.new('invalid_file_path.txt')
        expect { service.call }.to raise_error(ArgumentError)
      end
    end
  end
end
