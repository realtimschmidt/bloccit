class User < ActiveRecord::Base
  before_save { self.email = email.downcase if email.present? }
  before_save :full_name #I got this part on my own
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, masimum: 254 }
  has_secure_password

  def full_name
    if name #help from video - rspec kept showing an error without this. If there's no name, the function won't be able to do anything.
      full_name_array = []
      name.split.each do |name_seg|
        full_name_array << name_seg.capitalize
      end
      self.name = full_name_array.join(" ") #help from video - I tried `name = ...` why is `self.name` required?
    end
  end

end
