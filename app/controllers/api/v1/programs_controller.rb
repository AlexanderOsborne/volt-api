class Api::V1::ProgramsController < ApplicationController

  def index
    programs = ProgramFacade.find_programs(params)
    render json: WorkoutSerializer.new(programs)
  end
end