# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, -> { order(:created_at => :desc) }
  validates :message, :presence => true
  validates :recipient_id, :presence => true
  after_commit :handle_transaction, on: %i[create]

  def handle_transaction
    post = self.as_json(include: [:user, :comments])
    ActionCable.server.broadcast("timeline_#{self.recipient_id}", { type: "ADD_POST", payload: post })
  end

end
