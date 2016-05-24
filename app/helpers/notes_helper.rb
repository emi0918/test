module NotesHelper


  def image_for(note)
    if note.image_1
      image_tag "/note_images/#{note.image_1}", class: "service_pic"
    else
      image_tag "logo.png", class: "service_pic"
    end
  end


end
