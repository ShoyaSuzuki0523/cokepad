# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  include Rails.application.routes.url_helpers

  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :goods
  has_many :comments, dependent: :destroy
  
  def avatar_url
    avatar.attached? ?  url_for(avatar) : nil
  end
end
