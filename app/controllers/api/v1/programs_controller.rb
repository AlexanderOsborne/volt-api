class Api::V1::ProgramsController < ApplicationController

  def index
    programs = ProgramFacade.find_programs(params)
    if programs.empty?
      render json: {"We couldn't find a program that matched your request" => {}}, status:404
    else
      render json: WorkoutSerializer.new(programs)
    end
  end
end