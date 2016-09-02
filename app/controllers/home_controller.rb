class HomeController < ApplicationController

def index

 @note_id = params[:id]
   @note1 = Note.find(236) #全てのレコードを取得する
@note2 = Note.find(236)
@note3 = Note.find(236)
@note4 = Note.find(236)

 render :layout => 'top_home.html'

 end

end

