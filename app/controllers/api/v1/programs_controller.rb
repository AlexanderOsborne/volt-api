class Api::V1::ProgramsController < ApplicationController

  def index
    # require 'pry'; binding.pry
    programs = ProgramFacade.find_programs(params)
    # require 'pry'; binding.pry
    render json: WorkoutSerializer.new(programs)
  end
end