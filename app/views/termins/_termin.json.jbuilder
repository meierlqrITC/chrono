json.extract! termin, :id, :bezeichnung, :beginn, :ende, :beschreibung, :veranstaltung_id, :created_at, :updated_at
json.url termin_url(termin, format: :json)
