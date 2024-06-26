json.extract! veranstaltung, :id, :name, :datum, :beschreibung, :modul_id, :created_at, :updated_at
json.url veranstaltung_url(veranstaltung, format: :json)
