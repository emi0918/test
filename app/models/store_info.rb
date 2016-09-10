class StoreInfo < ActiveRecord::Base
		belongs_to :provider


	validates :payment, presence: true
	validates :hours, presence: true
	validates :prefecture, presence: true
	validates :holiday, presence: true

end

