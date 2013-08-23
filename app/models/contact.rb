require_relative '../../db/config'

class Contact < ActiveRecord::Base

  validates :company, presence: true
  validates :email, format: { with: /\w+\S*@\w+[\.]\w{2,}/i }
  validates :phone_number, format: { with: /\d{10,}/ }


  def name
    "#{first_name} #{last_name}"
  end

  def area_code
    "#{phone_number.slice(/\A\d{3}/)}"
  end

end
