require 'rails_helper'

RSpec.describe SportProgram, type: :model do
  describe 'relationships' do
    it {should belong_to :sport}
    it {should belong_to :program}
  end

  describe 'instance methods' do
  end
end