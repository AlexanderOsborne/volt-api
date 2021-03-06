class ProgramFacade
  class << self

    def find_programs(params)
      if params[:sport].blank?
        programs = Program.programs(params[:equipment])
        program_objects = programs.map {|program| Workout.new(program.as_json, program.sports.as_json, program.equipments.as_json)}
      else
        programs = Program.sport_programs(params[:sport], params[:equipment])
        program_objects = programs.map {|program| Workout.new(program.as_json, program.sports.as_json, program.equipments.as_json)}
      end
    end
  end
end