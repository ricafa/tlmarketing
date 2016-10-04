class Contact < ActiveRecord::Base
require 'spreadsheet'

scope :namesearch, -> (namesearch) { where("name like ?", "%#{namesearch}%")}
scope :emailsearch, -> (emailsearch) { where("email like ?", "%#{emailsearch}%")}
scope :schoolsearch, -> (schoolsearch) { where("school like ?", "%#{schoolsearch}%")}
scope :vt, -> (vt) {where("id not in (?)", Visit.pluck(:contact_id))}
scope :cl, -> (cl) {where("id not in (?)", Call.pluck(:contact_id))}

def self.import(file)
  Spreadsheet.client_encoding = 'UTF-8'

  book = Spreadsheet.open file
  book.worksheets
  sheet1 = book.worksheet 0
  sheet1.each 1 do |row|
    unless Contact.exists?(name: row[2].to_s.downcase)
      if row[2].present?
        contact = Contact.new
        contact.name = row[2].to_s.downcase
        contact.phonenumber1 = row[7]
        contact.phonenumber2 = row[8]
        contact.phonenumber3 = row[9]
        contact.email = row[10]
        contact.campaign = row[13].to_s.downcase
        contact.save!
      end
    end
  end
end

end
