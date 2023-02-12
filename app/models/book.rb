class Book < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   has_one_attached :image
   belongs_to :user
   
   validates :title, presence: true
   validates :body, presence: true
         
end
