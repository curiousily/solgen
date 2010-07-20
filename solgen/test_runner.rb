require "yaml"

class TestRunner

  def initialize(project_name, config_file)
    @config_file = YAML::load_file config_file
    @project_path = File.join(@config_file["solutions-dir"], project_name)
    @out_file = File.open(File.join(@project_path, @config_file["output-test"]), "r")
    @expected_file = File.open(File.join(@project_path, @config_file["expected-test"]), "r")
  end

  def run
    out_content = content_of @out_file
    expected_content = content_of @expected_file

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

  def content_of(file)
    content = Array.new
    while (line = file.gets)
      content << line
    end
    content
  end
end
