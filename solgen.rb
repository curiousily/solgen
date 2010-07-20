#!/usr/bin/ruby
require "solgen/solution_generator"

CONFIG_FILE = "config/conf.yaml"

project_name = ARGV.shift + "-" + ARGV.shift

ARGV.each do |arg|
  project_name += "." + arg 
end

generator = SolutionGenerator.new(project_name, CONFIG_FILE)
generator.create
