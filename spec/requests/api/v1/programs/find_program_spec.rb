require 'rails_helper'

RSpec.describe 'it returns programs' do
  before(:each) do
    equipment = Equipment.create!([{name: 'band'} , {name: 'barbell'}, {name: 'bench'}, {name: 'box'}, {name: 'cable machine'}, {name: 'dumbbell'}, {name: 'glute-hame'}, {name: 'incline bench'}, {name: 'lat pulldown'}, {name: 'medicine ball'}, {name: 'pullup bar'}, {name: 'squat rack'}, {name: 'kettlebell'}, {name: 'stability ball'}])
    sports = Sport.create!([{name: 'Soccer'}, {name: 'Football'}, {name: 'climbing'}])
    programs = Program.create!([{name: 'Womens Intermediate Soccer'}, {name: 'Womens Beginner Soccer'}, {name: 'Womens Advanced Soccer'}, {name: 'Football Intermediate'}, {name: 'Football Advanced'}, {name: 'Climbing Intermediate'}, {name: 'Power Endurance'}])
    sport_programs = SportsProgram.create!([{sport_id: sports[0].id, program_id: programs[0].id}, {sport_id: sports[0].id, program_id: programs[1].id}, {sport_id: sports[0].id, program_id: programs[2].id}, {sport_id: sports[1].id, program_id: programs[3].id}, {sport_id: sports[1].id, program_id: programs[4].id}, {sport_id: sports[2].id, program_id: programs[5].id}, {sport_id: sports[2].id, program_id: programs[6].id}, {sport_id: sports[1].id, program_id: programs[6].id}])

    wsi_equipment = ProgramsEquipment.create!([{program_id: programs[0].id, equipment_id: equipment[2].id}, {program_id: programs[0].id, equipment_id: equipment[5].id}, {program_id: programs[0].id, equipment_id: equipment[1].id}])
    wsb_equipment = ProgramsEquipment.create!([{program_id: programs[1].id, equipment_id: equipment[2].id}, {program_id: programs[1].id, equipment_id: equipment[9].id}])
    wsa_equipment = ProgramsEquipment.create!([{program_id: programs[2].id, equipment_id: equipment[11].id}, {program_id: programs[2].id, equipment_id: equipment[3].id}, {program_id: programs[2].id, equipment_id: equipment[13].id}])
    fbi_equipment = ProgramsEquipment.create!([{program_id: programs[3].id, equipment_id: equipment[11].id}, {program_id: programs[3].id, equipment_id: equipment[8].id}, {program_id: programs[3].id, equipment_id: equipment[2].id}])
    fba_equipment = ProgramsEquipment.create!([{program_id: programs[4].id, equipment_id: equipment[2].id}, {program_id: programs[4].id, equipment_id: equipment[7].id}, {program_id: programs[4].id, equipment_id: equipment[12].id}])
    climbing_equipment = ProgramsEquipment.create!([{program_id: programs[5].id, equipment_id: equipment[10].id}, {program_id: programs[5].id, equipment_id: equipment[12].id}, {program_id: programs[5].id, equipment_id: equipment[13].id}])
    power_endurance_equipment = ProgramsEquipment.create!([{program_id: programs[6].id, equipment_id: equipment[12].id}, {program_id: programs[6].id, equipment_id: equipment[3].id}, {program_id: programs[6].id, equipment_id: equipment[11].id}])

  end

  it 'works with sport and equipment params' do
    get "/api/v1/programs?sport=Soccer&equipment=bench,dumbbell,barbell"
    
    expect(response).to be_successful
    expect(response.status).to eq(200)
    
    programs = JSON.parse(response.body, symbolize_names: true)
    expect(programs).to be_a(Hash)
    expect(programs[:data][0][:type]).to eq("program")
    expect(programs[:data][0][:attributes].keys).to match_array([:id, :name, :sport, :required_equipment])
    expect(programs[:data][0][:attributes][:id]).to be_a(Numeric)
    expect(programs[:data][0][:attributes][:name]).to be_a(String)
    expect(programs[:data][0][:attributes][:sport]).to be_a(Hash)
    expect(programs[:data][0][:attributes][:required_equipment]).to be_a(Array)
    expect(programs[:data][0][:attributes][:required_equipment][0]).to be_a(Hash)
  end

  it 'works without sport params' do
    get "/api/v1/programs?equipment=bench,dumbbell,barbell"
    
    expect(response).to be_successful
    expect(response.status).to eq(200)
    
    programs = JSON.parse(response.body, symbolize_names: true)
    expect(programs).to be_a(Hash)
    expect(programs[:data][0][:type]).to eq("program")
    expect(programs[:data][0][:attributes].keys).to match_array([:id, :name, :sport, :required_equipment])
    expect(programs[:data][0][:attributes][:id]).to be_a(Numeric)
    expect(programs[:data][0][:attributes][:name]).to be_a(String)
    expect(programs[:data][0][:attributes][:sport]).to be_a(Hash)
    expect(programs[:data][0][:attributes][:required_equipment]).to be_a(Array)
    expect(programs[:data][0][:attributes][:required_equipment][0]).to be_a(Hash)
  end

  it 'It can return multiple programs with a sport' do
    get "/api/v1/programs?sport=Soccer&equipment=bench,dumbbell,barbell,band,kettlebell,box,squat%20rack,stability%20ball,pullup%20bar,medicine%20ball"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    programs = JSON.parse(response.body, symbolize_names: true)
    expect(programs).to be_a(Hash)
    expect(programs[:data][0][:type]).to eq("program")
    expect(programs[:data][0][:attributes].keys).to match_array([:id, :name, :sport, :required_equipment])
    expect(programs[:data][0][:attributes][:id]).to be_a(Numeric)
    expect(programs[:data][0][:attributes][:name]).to be_a(String)
    expect(programs[:data][0][:attributes][:sport]).to be_a(Hash)
    expect(programs[:data][0][:attributes][:required_equipment]).to be_a(Array)
    expect(programs[:data][0][:attributes][:required_equipment][0]).to be_a(Hash)
  end

  it 'It can return multiple programs without a sport' do
    get "/api/v1/programs?equipment=bench,dumbbell,barbell,band,kettlebell,box,squat%20rack,stability%20ball,pullup%20bar,medicine%20ball"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    
    programs = JSON.parse(response.body, symbolize_names: true)
    expect(programs).to be_a(Hash)
    expect(programs[:data][0][:type]).to eq("program")
    expect(programs[:data][0][:attributes].keys).to match_array([:id, :name, :sport, :required_equipment])
    expect(programs[:data][0][:attributes][:id]).to be_a(Numeric)
    expect(programs[:data][0][:attributes][:name]).to be_a(String)
    expect(programs[:data][0][:attributes][:sport]).to be_a(Hash)
    expect(programs[:data][0][:attributes][:required_equipment]).to be_a(Array)
    expect(programs[:data][0][:attributes][:required_equipment][0]).to be_a(Hash)
  end

  it 'It can Sadpath not finding a program' do
    get "/api/v1/programs?equipment=bench"

    expect(response.status).to eq(404)
    
    programs = JSON.parse(response.body, symbolize_names: true)
    expect(programs).to be_a(Hash)
    expect(programs.keys).to eq([:"We couldn't find a program that matched your request"])
  end
end