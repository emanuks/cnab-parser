class CnabParserService
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    file = File.open(@file_path)
    validate_format(file)
  end

  private

  def validate_format(file)
    file.each do |line|
      raise StandardError unless line.length == 81
    end
  end
end
