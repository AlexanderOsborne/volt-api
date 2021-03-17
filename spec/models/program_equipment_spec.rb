require 'rails_helper'

RSpec.describe ProgramEquipment, type: :model do

  describe 'relationships' do
    it {should belong_to :program}
    it {should belong_to :equipment}
  end

  describe 'instance methods' do
  end
end