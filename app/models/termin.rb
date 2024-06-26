class Termin < ApplicationRecord
  belongs_to :veranstaltung
  has_many :beobachters

  validate :termin_zeitraum_frei

  def ergänze_beobachter(beobachter)
    beobachters << beobachter
  end

  def entferne_beobachter(beobachter)
    beobachters.delete(beobachter)
  end

  def benachrichtige_beobachter
    beobachters.each(&:update)
  end

  private

  def termin_zeitraum_frei
    if Termin.exists?(["veranstaltung_id = ? AND ((beginn BETWEEN ? AND ?) OR (ende BETWEEN ? AND ?))", veranstaltung_id, beginn, ende, beginn, ende])
      errors.add(:base, "Ein Termin in diesem Zeitraum existiert bereits.")
    end
  end
end
