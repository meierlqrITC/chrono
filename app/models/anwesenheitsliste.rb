class Anwesenheitsliste < ApplicationRecord
  belongs_to :veranstaltung
  has_many :anwesenheitslisten_users
  has_many :users, through: :anwesenheitslisten_users
end
