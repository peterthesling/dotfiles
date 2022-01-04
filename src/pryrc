if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'w', 'whereami'
end
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end

def dump_yml(obj)
  puts({ "#{obj.class.table_name.singularize}_#{obj.id}" => obj.attributes }.
    to_yaml.sub!(/---\s?/, "\n"))
end

puts "Loaded ~/.pryrc ..."

def get_project
  File.basename(Dir.pwd)
end

def load_helper_file
  helper_file = Pathname.new("#{Dir.pwd}/console_helpers.rb")
  if helper_file.exist?
    puts "trying to require #{helper_file}"
    require helper_file
  end
end

load_helper_file

class Object
  def interesting_methods
    (self.methods - Object.new.methods).sort
  end
end

Pry.config.prompt_name = get_project
Pry.config.editor = ENV['VISUAL']
Pry.config.ls.separator = "\n" # new lines between methods
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end
