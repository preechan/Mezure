class Metric < ActiveRecord::Base
	belongs_to :channel
	has_and_belongs_to_many  :projects
end
