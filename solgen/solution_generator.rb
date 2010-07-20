require "fileutils"
require "yaml"

class SolutionGenerator

  def initialize(project_name, config_file)    
    @config_file = YAML::load_file config_file
    @project_path = File.join(@config_file["solutions-dir"], project_name)
  end

  def create
    make_project_dir    
    create_project_files
  end

private
  def make_project_dir
    Dir.mkdir(@project_path)
  end

  def create_project_files
    FileUtils.cp(@config_file["template"], File.join(@project_path, @config_file["main"]))
    File.open(File.join(@project_path, @config_file["input-test"]), "w")
    File.open(File.join(@project_path, @config_file["output-test"]), "w")
  end
end
