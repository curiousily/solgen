#!/usr/bin/ruby
require "solution_generator"

project_name = ARGV.shift + "-" + ARGV.shift

ARGV.each do |arg|
  project_name += "." + arg 
end

generator = SolutionGenerator.new(project_name)
generator.create
