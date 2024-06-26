class Beobachter < ApplicationRecord
  belongs_to :termin
  def update
    # Logik zur Aktualisierung des Beobachters
  end
end
