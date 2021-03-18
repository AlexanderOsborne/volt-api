class ProgramFacade
  class << self

    def find_programs(params)

      if params[:sport].blank?
        # require 'pry'; binding.pry
      else
        programs = Program.sport_programs(params[:sport], params[:equipment])
        require 'pry'; binding.pry
      end
    end
  end
end



# equipment = params[:equipment].split(",")
# all_equipment = Equipment.all

# y = []
#   missing_equipment = all_equipment.each do |equip|
#     equipment.each do |x|
#       y << equip.name unless all_equipment.include?(x)
#     end
#   end
#   y