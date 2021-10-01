require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'associations' do
    it { should have_one(:record) }
  end
end
