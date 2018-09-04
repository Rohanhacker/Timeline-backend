# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, -> { order(:created_at => :desc) }
  validates :message, :presence => true
  validates :recipient_id, :presence => true
end
