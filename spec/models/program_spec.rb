require 'rails_helper'

RSpec.describe Program, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :sports_programs}
    it {should have_many :programs_equipments}
    it {should have_many(:equipments).through(:programs_equipments)}
  end

  describe 'class methods' do
    it "should return programs filtered by sport" do
    
    soccer = Sport.create!(name: 'Soccer')
    football = Sport.create!(name: 'Football')
    climbing = Sport.create!(name: 'Climbing')
    
    wis = Program.create!(name: 'Womens Intermediate Soccer')
    wbs = Program.create!(name: 'Womens Beginner Soccer')
    was = Program.create!(name: 'Womens Beginner Soccer')
    fbi = Program.create!(name: 'Football Intermediate')
    fba = Program.create!(name: 'Football Advanced')
    ci = Program.create!(name: 'Climbing Intermediate')
    pe = Program.create!(name: 'Power Endurance')
    rec = Program.create!(name: 'Recovery')
    
    soccer.programs << [wis, wbs, was, rec]
    football.programs << [fbi, fba, pe, rec]
    climbing.programs << [ci, pe, rec]
    
    band = Equipment.create!(name: 'band')
    barbell = Equipment.create!(name: 'barbell')
    bench = Equipment.create!(name: 'bench')
    box = Equipment.create!(name: 'box')
    cable_machine = Equipment.create!(name: 'cable machine')
    dumbbell = Equipment.create!(name: 'dumbbell')
    glute_hame = Equipment.create!(name: 'glute-hame')
    incline_bench = Equipment.create!(name: 'incline bench')
    lat_pulldown = Equipment.create!(name: 'lat pulldown')
    medicine_ball = Equipment.create!(name: 'medicine ball')
    pullup_bar = Equipment.create!(name: 'pullup bar')
    squat_rack = Equipment.create!(name: 'squat rack')
    kettlebell = Equipment.create!(name: 'kettlebell')
    stability_ball = Equipment.create!(name: 'stability ball')
    
    wis.equipments << [bench, dumbbell, barbell]
    wbs.equipments << [bench, dumbbell, medicine_ball]
    was.equipments << [squat_rack, box, stability_ball]
    fbi.equipments << [squat_rack, lat_pulldown, bench]
    fba.equipments << [barbell, incline_bench, kettlebell]
    ci.equipments << [pullup_bar, kettlebell, stability_ball]
    pe.equipments << [kettlebell, box, squat_rack]
    rec.equipments << [band, stability_ball]
    require 'pry'; binding.pry
    end
  end
end