class Entry < ActiveRecord::Base
  validates_presence_of :total
  validates_numericality_of :total, greater_than_or_equal_to: 0.00001

end
