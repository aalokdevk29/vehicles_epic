require 'rails_helper'

RSpec.describe Nationality, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:nationality) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:records) }
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:vehicles) }
  end
end
