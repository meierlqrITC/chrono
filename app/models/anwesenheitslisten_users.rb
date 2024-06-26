class AnwesenheitslistenUsers < ApplicationRecord
  belongs_to :anwesenheitsliste
  belongs_to :user
end
