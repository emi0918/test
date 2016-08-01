class NoteMailer < ApplicationMailer
	  default from: "from@example.com"



  def note_email(provider, note)
  	 @provider = provider
    @title = note.title
    mail to: note.provider.email, subject: "【Seekle】サービスぺージの掲載が完了しました"
  end
end
