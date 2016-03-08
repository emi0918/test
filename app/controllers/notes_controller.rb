class NotesController < ApplicationController
  def new
  end

  def create
    # フォームのname属性がtitleの値を、@titleに代入してください
     @title = params[:title]
    # フォームのname属性がcontentの値を、@contentに代入してください
     @content = params[:content]
  end
end
