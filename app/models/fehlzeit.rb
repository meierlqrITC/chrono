class Fehlzeit < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :veranstaltung
end
