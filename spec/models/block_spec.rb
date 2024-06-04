require 'rails_helper'

RSpec.describe Block, type: :model do
  describe 'validates block name presence' do
    it { is_expected.to validate_presence_of :name }
  end

  describe 'validates presence of cnab file' do
    it { is_expected.to validate_presence_of(:cnab).with_message("file can't be blank") }
  end
end
