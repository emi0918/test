class ProviderAccount < ActiveRecord::Base
	belongs_to :provider



	validates :phonenumber, presence: true
	validates :staffname, presence: true

end
