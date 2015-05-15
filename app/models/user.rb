class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :registerable, :recoverable, :rememberable, :trackable, :database_authenticatable

  validates_presence_of :email, :first_name, :last_name, :company_name, :country
  validates :business_phone, length: { in: 10..12 }


end
