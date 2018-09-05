class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_commit :handle_transaction, on: %i[create]

  def handle_transaction
    comment = self.as_json(include: :user)
    recipient_id = self.post.recipient_id
    ActionCable.server.broadcast("timeline_#{recipient_id}", { type: "ADD_COMMENT", payload: comment })
  end

end
