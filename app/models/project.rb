class Project < ApplicationRecord
  table_name = 'projects'
  validates :name, presence: true
  # def getAll
  #   self::all
  # end
end
