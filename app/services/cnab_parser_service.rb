class CnabParserService
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    file = File.open(@file_path)
  end
end
