require 'rails_helper'

RSpec.describe Program, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    # it {should belong_to :}
    it {should have_many :sports_programs}
    it {should have_many :programs_equipments}
    it {should have_many(:equipments).through(:program_equipments)}
  end

  describe 'instance methods' do
  end
end