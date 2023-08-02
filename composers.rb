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
@composer_ages = {}
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
  p @composers
  @composers.each do |composer|
    
  end
  puts @composer_ages
end
def age
  
  puts "Which people's age do you want to compare: Beethoven, Kant, Mozart? You can enter as many as you like, then type run if you want to get the results."
  
 
  loop do
    input = gets.chomp.downcase
    if check_name(input.capitalize) || input == "run"
      @composers.each do |composer|
        if composer.first_name.downcase.include?(input) || composer.last_name.downcase.include?(input)
          composer_age = composer.year_died.to_i - composer.year_born.to_i
          @composer_ages[composer.last_name.downcase] = composer_age
        elsif input == "run"
          @composer_ages.each {|key,value| puts "#{key.capitalize} grew #{value} years old." }
          @composer_ages = @composer_ages.sort_by(&:last).reverse
          p @composer_ages
          composer_string =""
          @composer_ages.each_with_index do |composer_age, index| 
            name = composer_age[0]
            age = composer_age[1]
            if index != 0 && index < @composer_ages.length 
              composer_string += " grew older than "
            end
            if index == (@composer_ages.length - 1)
              composer_string += "#{name.capitalize}, who grew #{age} years old." 
            else
              composer_string += "#{name.capitalize}, who grew #{age} years old," 
              puts index
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



