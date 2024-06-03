require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates user full name presence' do
    it { is_expected.to validate_presence_of :full_name }
  end
end
