class Article < ActiveRecord::Base
	validates :title, :excerpt,  presence: true, length: ( minimum: 10, maximum: 50)
	validates :description, presence: true, length: ( minimum: 25 )
end