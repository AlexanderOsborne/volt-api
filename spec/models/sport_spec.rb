require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    # it {should belong_to :}
    it {should have_many :sport_programs}
    it {should have_many(:programs).through(:sport_programs)}
  end

  describe 'instance methods' do
  end
end