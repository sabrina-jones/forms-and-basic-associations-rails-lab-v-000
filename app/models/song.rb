class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    if artist
      self.artist.name
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    self.notes.map{|note| note.content}
  end

  def note_contents=(notes)
     notes.each do |content|
      note = self.notes.build(content: content)
      note.save
    end
  end
end
