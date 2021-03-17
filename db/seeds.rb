Program.destroy_all
Sport.destroy_all
Equipment.destroy_all

equipment = Equipment.create!([{name: 'band'} , {name: 'barbell'}, {name: 'bench'}, {name: 'box'}, {name: 'cable machine'}, {name: 'dumbbell'}, {name: 'glute-hame'}, {name: 'incline bench'}, {name: 'lat pulldown'}, {name: 'medicine ball'}, {name: 'pullup bar'}, {name: 'squat rack'}, {name: 'kettlebell'}, {name: 'stability ball'}])
sports = Sport.create!([{name: 'Soccer'}, {name: 'Football'}, {name: 'Climbing'}])
programs = Program.create!([{name: 'Womens Intermediate Soccer'}, {name: 'Womens Beginner Soccer'}, {name: 'Womens Advanced Soccer'}, {name: 'Football Intermediate'}, {name: 'Football Advanced'}, {name: 'Climbing Intermediate'}, {name: 'Power Endurance'}, name: 'Recovery'])
sport_programs = SportProgram.create!([{sport_id: sports[0].id, program_id: programs[0].id}, {sport_id: sports[0].id, program_id: programs[1].id}, {sport_id: sports[0].id, program_id: programs[3].id}, {sport_id: sports[1].id, program_id: programs[4].id}, {sport_id: sports[1].id, program_id: programs[5].id}, {sport_id: sports[2].id, program_id: programs[5].id}])

wsi_equipment = ProgramEquipment.create!([{program_id: programs[0].id, equipment_id: equipment[2].id}, {program_id: programs[0].id, equipment_id: equipment[5].id}, {program_id: programs[0].id, equipment_id: equipment[1].id}])
wsb_equipment = ProgramEquipment.create!([{program_id: programs[1].id, equipment_id: equipment[0].id}, {program_id: programs[1].id, equipment_id: equipment[9].id}])
wsa_equipment = ProgramEquipment.create!([{program_id: programs[2].id, equipment_id: equipment[11].id}, {program_id: programs[2].id, equipment_id: equipment[3].id}, {program_id: programs[2].id, equipment_id: equipment[13].id}])

fbi_equipment = ProgramEquipment.create!([{program_id: programs[3].id, equipment_id: equipment[11].id}, {program_id: programs[3].id, equipment_id: equipment[8].id}, {program_id: programs[3].id, equipment_id: equipment[2].id}])
fba_equipment = ProgramEquipment.create!([{program_id: programs[4].id, equipment_id: equipment[2].id}, {program_id: programs[4].id, equipment_id: equipment[7].id}, {program_id: programs[4].id, equipment_id: equipment[12].id}])

climbing_equipment = ProgramEquipment.create!([{program_id: programs[5].id, equipment_id: equipment[10].id}, {program_id: programs[5].id, equipment_id: equipment[12].id}, {program_id: programs[5].id, equipment_id: equipment[13].id}])
power_endurance_equipment = ProgramEquipment.create!([{program_id: programs[6].id, equipment_id: equipment[12].id}, {program_id: programs[6].id, equipment_id: equipment[3].id}, {program_id: programs[6].id, equipment_id: equipment[11].id}])
recovery_equipment = ProgramEquipment.create!([{program_id: programs[7].id, equipment_id: equipment[1].id}, {program_id: programs[7].id, equipment_id: equipment[11].id}])