class BaseRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @elements
  end

  # When we save, we give an ID
  def add(element) # INSTANCE
    element.id = @next_id
    @elements << element
    @next_id += 1
    save_csv
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # row is a HASH
      @elements << build_instance(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << @elements.first.class.headers
      # Order.headers
      @elements.each do |element|
        csv << element.build_row
        # order.build_row -> array
      end
    end
  end
end




