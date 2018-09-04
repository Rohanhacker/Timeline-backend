# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :message, :presence => true
  validates :recipient_id, :presence => true
end
