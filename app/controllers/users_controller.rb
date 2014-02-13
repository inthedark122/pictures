# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  require 'mail'
  
  def index
    @user = User.find_by_id(params[:id])
  end
  
  def new
    @user = User.new
    render "devise/registrations/new"
  end
  
  def create
    @user = User.new(params[:user])
    if (params[:user][:password_confirmation] == params[:user][:password]) && @user.name.blank?
      flash[:error] = "Password incorrect"
      render "devise/registrations/new"
    else
      subject = "Проверка пользователя"
      body = "Ваша учетная запись приняла участие в регестрации на сайте pictures.com.ua, для ее подтверждения перейдите пожалуйста по ссыки"
      body += "<br /><a href='http://localhost:3000/users/confirm/#{@user.name}'>ссылка</a>"
      if @user.save
        send_mail(@user.email, subject, body)
        redirect_to "/id#{@user.id}"
      else
        render "devise/registrations/new"
      end
    end
  end
  
  def edit_post
  end
  
  def new_post
    #@categories = Categories.find_by_id(params[:category_id])
    @post = Post.new #Categories.find_by_id(params[:category_id]).posts.new
  end
  
  def send_mail(to, subject, body)
    Mail.defaults do
      delivery_method :smtp,  :address              => "smtp.gmail.com",
                              :port                 => 587,
                              :domain               => 'gmail.com',
                              :user_name            => 'inthedark1225@gmail.com',
                              :password             => 'mangos12',
                              :authentication       => :login,
                              :enable_starttls_auto => true
    end
    mail = Mail.new do
      from 'inthedark1225@gmail.com'
      to to
      subject subject
      html_part do
        content_type 'text/html; charset=UTF-8'
        body body
      end
    end
    mail.deliver!
  end
  
end
