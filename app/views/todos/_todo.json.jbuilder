json.extract! todo, :id, :nr, :termin, :nazwa, :tresc, :waznosc, :stopien_postepu, :created_at, :updated_at
json.url todo_url(todo, format: :json)
