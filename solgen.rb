#!/usr/bin/ruby
require "solgen/solution_generator"
require "solgen/test_runner"

CONFIG_FILE = "config/conf.yaml"

def project_name
  project_name = ARGV.shift + "-" + ARGV.shift
  ARGV.each do |arg|
    project_name += "." + arg
  end
  project_name
end

if(ARGV[0] == "t")
  ARGV.shift
  project = project_name
  runner = TestRunner.new(project, CONFIG_FILE)
  runner.run
else
  generator = SolutionGenerator.new(project_name, CONFIG_FILE)
  generator.create
end


