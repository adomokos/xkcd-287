require_relative 'lib/xkcd'

Dir.glob("menus/*.txt") do |menu_file|
  file = File.open(menu_file, "rb")
  contents = file.read

  context = Xkcd::SelectsMenus.from_input_string(contents)

  if context.failure?
    puts "#{context.message} in file: #{menu_file}"
  else
    puts "Menus from file: #{menu_file}"
    puts context[:result]
  end

  puts "======================"
end
