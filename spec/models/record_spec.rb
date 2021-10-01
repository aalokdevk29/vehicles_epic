require 'rails_helper'

RSpec.describe Record, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:vehicle).class_name('Vehicle') }
    it { should belong_to(:nationality).class_name('Nationality') }
  end
end
