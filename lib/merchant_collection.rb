class Merchantcollection

  attr_reader :merchants

  def initialize(csv_file_path)
    @merchants = create_merchants(csv_file_path)
  end

  def create_merchants(csv_file_path)
    merchant_array = []
    CSV.foreach("#{csv_file_path}", headers: true, header_converters: :symbol) do |row|
      merchant_array << Merchant.new(row)
    end
    merchant_array
  end

  def acc_headers
    CSV.open("./data/items.csv", &:readline)
  end

  def find(id)
    @merchants.find do |merchant|
      merchant.id == id
    end
  end

end
