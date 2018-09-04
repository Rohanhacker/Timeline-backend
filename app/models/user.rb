# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, -> { order(:created_at) }, dependent: :delete_all
  validates :name, :presence => true
end
