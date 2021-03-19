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
    
    # band = Equipment.create!(name: 'band')
    # barbell = Equipment.create!(name: 'barbell')
    # bench = Equipment.create!(name: 'bench')
    # box = Equipment.create!(name: 'box')
    # cable_machine = Equipment.create!(name: 'cable machine')
    # dumbbell = Equipment.create!(name: 'dumbbell')
    # glute_hame = Equipment.create!(name: 'glute-hame')
    # incline_bench = Equipment.create!(name: 'incline bench')
    # lat_pulldown = Equipment.create!(name: 'lat pulldown')
    # medicine_ball = Equipment.create!(name: 'medicine ball')
    # pullup_bar = Equipment.create!(name: 'pullup bar')
    # squat_rack = Equipment.create!(name: 'squat rack')
    # kettlebell = Equipment.create!(name: 'kettlebell')
    # stability_ball = Equipment.create!(name: 'stability ball')
    
    # wis.equipments << [bench, dumbbell, barbell]
    # wbs.equipments << [bench, dumbbell, medicine_ball]
    # was.equipments << [squat_rack, box, stability_ball]
    # fbi.equipments << [squat_rack, lat_pulldown, bench]
    # fba.equipments << [barbell, incline_bench, kettlebell]
    # ci.equipments << [pullup_bar, kettlebell, stability_ball]
    # pe.equipments << [kettlebell, box, squat_rack]
    # rec.equipments << [band, stability_ball]

    equipment = Equipment.create!([{name: 'band'} , {name: 'barbell'}, {name: 'bench'}, {name: 'box'}, {name: 'cable machine'}, {name: 'dumbbell'}, {name: 'glute-hame'}, {name: 'incline bench'}, {name: 'lat pulldown'}, {name: 'medicine ball'}, {name: 'pullup bar'}, {name: 'squat rack'}, {name: 'kettlebell'}, {name: 'stability ball'}])
    sports = Sport.create!([{name: 'soccer'}, {name: 'football'}, {name: 'climbing'}])
    programs = Program.create!([{name: 'Womens Intermediate Soccer'}, {name: 'Womens Beginner Soccer'}, {name: 'Womens Advanced Soccer'}, {name: 'Football Intermediate'}, {name: 'Football Advanced'}, {name: 'Climbing Intermediate'}, {name: 'Power Endurance'}, name: 'Recovery'])
    sport_programs = SportsProgram.create!([{sport_id: sports[0].id, program_id: programs[0].id}, {sport_id: sports[0].id, program_id: programs[1].id}, {sport_id: sports[0].id, program_id: programs[2].id}, {sport_id: sports[1].id, program_id: programs[3].id}, {sport_id: sports[1].id, program_id: programs[4].id}, {sport_id: sports[2].id, program_id: programs[5].id}])

    wsi_equipment = ProgramsEquipment.create!([{program_id: programs[0].id, equipment_id: equipment[2].id}, {program_id: programs[0].id, equipment_id: equipment[5].id}, {program_id: programs[0].id, equipment_id: equipment[1].id}])
    wsb_equipment = ProgramsEquipment.create!([{program_id: programs[1].id, equipment_id: equipment[2].id}, {program_id: programs[1].id, equipment_id: equipment[9].id}])
    wsa_equipment = ProgramsEquipment.create!([{program_id: programs[2].id, equipment_id: equipment[11].id}, {program_id: programs[2].id, equipment_id: equipment[3].id}, {program_id: programs[2].id, equipment_id: equipment[13].id}])

    fbi_equipment = ProgramsEquipment.create!([{program_id: programs[3].id, equipment_id: equipment[11].id}, {program_id: programs[3].id, equipment_id: equipment[8].id}, {program_id: programs[3].id, equipment_id: equipment[2].id}])
    fba_equipment = ProgramsEquipment.create!([{program_id: programs[4].id, equipment_id: equipment[2].id}, {program_id: programs[4].id, equipment_id: equipment[7].id}, {program_id: programs[4].id, equipment_id: equipment[12].id}])

    climbing_equipment = ProgramsEquipment.create!([{program_id: programs[5].id, equipment_id: equipment[10].id}, {program_id: programs[5].id, equipment_id: equipment[12].id}, {program_id: programs[5].id, equipment_id: equipment[13].id}])
    power_endurance_equipment = ProgramsEquipment.create!([{program_id: programs[6].id, equipment_id: equipment[12].id}, {program_id: programs[6].id, equipment_id: equipment[3].id}, {program_id: programs[6].id, equipment_id: equipment[11].id}])
    recovery_equipment = ProgramsEquipment.create!([{program_id: programs[7].id, equipment_id: equipment[1].id}, {program_id: programs[7].id, equipment_id: equipment[11].id}])

    expect(Program.sport_programs("soccer", "bench,dumbbell,barbell")).to eq([programs[0]])
    end
  end
end