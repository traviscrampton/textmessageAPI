class Contact < ActiveRecord::Base
  has_many :messages

  belongs_to :addressbook
end
