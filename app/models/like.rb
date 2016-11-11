class Like < Viewable
  belongs_to :user
  belongs_to :postable

  design do
    view :by_postable_id
    view :by_user_id
  end
end
