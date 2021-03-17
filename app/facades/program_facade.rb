class ProgramFacade
  class << self

    def find_programs(params)
      # require 'pry'; binding.pry
      if params[:sport].blank?
        # require 'pry'; binding.pry
      else
        # require 'pry'; binding.pry
        programs = Program.sport_programs(params[:sport], params[:equipment].split(","))
      end
    end
  end
end