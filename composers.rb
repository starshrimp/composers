require_relative './composer_class.rb'
CSV_DELIMITER = ";"

def analyse_composers
  composers_csv = File.read("composers.csv")
  composer_lines = composers_csv.split("\n")

  composer_lines.each do |composer_line|
    parts = composer_line.split(CSV_DELIMITER)
    composer = Composer.new(parts[0], parts[1], parts[2], parts[3])

  end
end
def age
  puts "Which people's age do you want to compare: Beethoven, Kant, Mozart, Bach, Tschaikowski, Wagner, Chopin? You can enter as many as you like, then type run if you want to get the results."

  loop do
    input = gets.chomp.capitalize
    if check_name(input.capitalize) || input == "Run"
      
      Composer.all.each do |composer|
        if composer.first_name.include?(input) || composer.last_name.include?(input)
          composer.select
        elsif input == "Run"
          Composer.selected.each do |composer|
             puts "#{composer.last_name} grew #{composer.age} years old." 
          end
          sorted_composers = sort_composers
          composer_string = compose_output(sorted_composers)
          puts composer_string
          break
        end
      end
    elsif check_name(input.capitalize) == false
      puts "Please enter a valid name."
    end
  end
end

def check_name(input) 
  Composer.all.each do |composer|
    if composer.first_name.include?(input) || composer.last_name.to_s.include?(input)
      return true
    end
  end
  return false
end

def sort_composers
  sorted_composers = Composer.selected.sort_by { |composer| -composer.age }
end

def compose_output(composers)
  composer_string =""
  composers.each_with_index do |composer, index| 
    if index == 1 
      composer_string += " grew older than "
    elsif index != 0 && index < Composer.selected.length 
      composer_string += " who grew older than "
    end
    if index == (Composer.selected.length - 1)
      composer_string += "#{composer.first_name} #{composer.last_name}, who grew #{composer.age} years old." 
    else
      composer_string += "#{composer.first_name} #{composer.last_name}, who grew #{composer.age} years old," 
    end
  end
  return composer_string
end


analyse_composers
age



