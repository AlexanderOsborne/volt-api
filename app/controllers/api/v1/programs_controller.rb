class Api::V1::ProgramsController < ApplicationController

  def index
    # require 'pry'; binding.pry
    ProgramFacade.find_programs(params)
  end
end