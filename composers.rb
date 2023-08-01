beethoven = {
  name: "Ludwig van Beethoven", year_born: 1770, year_died: 1827
}
kant = {
  name: "Immanuel Kant", year_born: 1724, year_died: 1804
}
mozart = {
  name: "Wolfgang Amadeus Mozart", year_born: 1756, year_died: 1791
}


def age(number_1, number_2) 
  
  names = ["mozart", "kant", "beethoven"]
  puts "Which people's age do you want to compare: Beethoven, Kant, Mozart?"
  number_1 = gets.chomp.downcase.to_sym
  number_2= gets.chomp.downcase.to_sym
    
    names = [mozart, kant, beethoven]
    hash_name = {mozart: mozart, kant: kant, beethoven: beethoven}
    name_1 = hash_name[number_1]
    name_2 = hash_name[number_2]
  if names.include?(person.to_s)
    lifetime =person[:year_died] - person[:year_born]
  puts lifetime
  else
    puts "Please enter a valid name"
  end
end

age(name_1, name_2)



