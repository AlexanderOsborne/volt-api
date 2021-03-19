require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :sports_programs}
    it {should have_many(:programs).through(:sports_programs)}
  end

  describe 'instance methods' do
  end
end