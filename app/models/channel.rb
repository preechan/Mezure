class Channel < ActiveRecord::Base
	has_and_belongs_to_many  :projects
	has_many :metrics
end
