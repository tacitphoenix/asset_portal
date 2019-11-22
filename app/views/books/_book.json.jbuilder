json.extract! book, :id, :isbn, :title, :year_published, :author_id, :category_id, :created_at, :updated_at
json.url book_url(book, format: :json)
