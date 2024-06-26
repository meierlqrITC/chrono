class Veranstaltung < ApplicationRecord
  belongs_to :modul
  has_many :fehlzeits
  has_many :anwesenheitslists
  has_many :termine
end
