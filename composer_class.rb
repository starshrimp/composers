class Composer
  attr_accessor :first_name, :last_name, :year_born, :year_died, :age
  def initialize(first_name, last_name, year_born, year_died)
    @first_name = first_name
    @last_name = last_name
    @year_born = year_born
    @year_died = year_died
    @age = year_died.to_i - year_born.to_i
  end
end

