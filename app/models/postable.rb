class Postable < Viewable
  belongs_to :user
  collection_of :likes
  design do
    view :by_created_at,
      :map =>
        "function(d) {
          t = d['type'];
          if ((t == 'Post' || t == 'Repost' || t == 'Like') && d['created_at']) {
            emit(d.created_at, 1);
          }
        }"

  end
end
