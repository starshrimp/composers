# beethoven = {
#   name: "Ludwig van Beethoven", year_born: 1770, year_died: 1827
# }
# kant = {
#   name: "Immanuel Kant", year_born: 1724, year_died: 1804
# }
# mozart = {
#   name: "Wolfgang Amadeus Mozart", year_born: 1756, year_died: 1791
# }

@composers = []
@selected_composers = []
require_relative './composer_class.rb'
CSV_DELIMITER = ";"

def analyse_composers
  composers_csv = File.read("composers.csv")
  composer_lines = composers_csv.split("\n")

  composer_lines.each do |composer_line|
    parts = composer_line.split(CSV_DELIMITER)
    composer = Composer.new(parts[0], parts[1], parts[2], parts[3])
    @composers.push(composer)
  end
end
def age
  puts "Which people's age do you want to compare: Beethoven, Kant, Mozart? You can enter as many as you like, then type run if you want to get the results."
  
 
  loop do
    input = gets.chomp.capitalize
    if check_name(input.capitalize) || input == "Run"
      @composers.each do |composer|
        if composer.first_name.include?(input) || composer.last_name.include?(input)
          @selected_composers.push(composer)
        elsif input == "Run"
          @selected_composers.each do |composer|
             puts "#{composer.last_name} grew #{composer.age} years old." 
          end
          @sorted_composers = @selected_composers.sort_by { |composer| -composer.age }
          composer_string =""
          @sorted_composers.each_with_index do |composer, index| 
            if index != 0 && index < @selected_composers.length 
              composer_string += " grew older than "
            end
            if index == (@selected_composers.length - 1)
              composer_string += "#{composer.first_name} #{composer.last_name}, who grew #{composer.age} years old." 
            else
              composer_string += "#{composer.first_name} #{composer.last_name}, who grew #{composer.age} years old," 
            end
          end
          puts composer_string
          break
        end
      end
    end
  end

end

def check_name(input) 
  @composers.each do |composer|
    if composer.first_name.include?(input) || composer.last_name.to_s.include?(input)
      return true
    end
  end
  return false
end


analyse_composers
age



