class HomeController < ApplicationController

def index
 @note_id = params[:id]
   @note1 = Note.find(4) #全てのレコードを取得する
@note2 = Note.find(5)
@note3 = Note.find(6)
@note4 = Note.find(7)

 end

end

