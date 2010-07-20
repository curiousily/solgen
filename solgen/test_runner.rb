require "yaml"

class TestRunner

  def initialize(project_name, config_file)
    @config_file = YAML::load_file config_file
    @project_path = File.join(@config_file["solutions-dir"], project_name)
    @out_file = File.open(File.join(@project_path, @config_file["output-test"]), "r")
    @expected_file = File.open(File.join(@project_path, @config_file["expected-test"]), "r")
  end

  def run
    out_content = Array.new
    while (line = @out_file.gets)
      out_content << line
    end
    expected_content = Array.new
    while (line = @expected_file.gets)
      expected_content << line
    end
    expected_content.each_with_index do |expected_line, index|
      if (expected_line != out_content[index])
        puts "Expected #{format_test_line(expected_content, index)} " +
                     "but actual #{format_test_line(out_content, index)} " +
                     "at line ##{index + 1}"
        return
      end
    end
    puts "All tests passed!"
  end

  private
  def format_test_line(collection, index)
    if (collection[index].nil?)
      return "EMPTY"
    end
    collection[index].chomp
  end
end
