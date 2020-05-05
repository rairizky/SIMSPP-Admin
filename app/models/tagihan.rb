class Tagihan < ApplicationRecord

  validates :nis, uniqueness: true

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    if spreadsheet
      Tagihan.destroy_all
      header = spreadsheet.row(1)
      (2 .. spreadsheet.last_row).map do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        tagihan = find_by_id(row["id"]) || Tagihan.new
        tagihan.attributes = row.to_hash
        begin
          tagihan.save!
        rescue => exception
          alert: "#{exception}"
        end
      end
    else
      false
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else false
    end
  end
end
