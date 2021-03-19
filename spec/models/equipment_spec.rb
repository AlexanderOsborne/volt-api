require 'rails_helper'

RSpec.describe Equipment, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :programs_equipments}
  end

  describe 'instance methods' do
  end
end