class Reservation < ActiveRecord::Base 
	belongs_to :user
	belongs_to :note
	belongs_to :provider

    validates :name, presence:  true
	validates :phone_number, presence: true
	validates :message, presence: true
	validates :date, presence: true

end