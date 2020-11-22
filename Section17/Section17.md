# How to build a Mention system

## Additional Features Around Posts

Linking a person to a photo and to the specific location on the photo for the tag.

* Post should have a caption
* Post might have latitude / longitude.
* Post might tag people on a photo

## Adding Captions and Locations

Using dbdiagram.io: 
```
table posts {
  id SERIAL [pk, increment]
  created_at timestamp
  updated_at timestamp
  url varchar(200)
  user_id integer [ref: > users.id]
  caption VARCHAR(240)
  lat real
  lng real
}
```

## Photo Mentions vs Caption Mentions

Tagging a person inside of a photo.

Might create a new `tags` table with `id`, `user_id`, and `post_id` columns.
To store location, we also add `x`, and `y` columns for the coordinates from the top-left.

* Highlighted text doesn't necessarily mean that we need to store something in the database.
* Mobile app could be in charge of highlighting anything that looks like a mention
* Need to show a list of posts a user was mentioned in?
* Need to show a list of the most-often mentioned users?
* Need to notify a user when they've been mentioned?

## Considerations on Photo Tags vs Caption Tags

Tag solution #1:
* `tags` table has x, y coordinate columns, where null means tag in a caption.
* Upside is one single table for all mentions / tags.
* Downside is that they're two different kinds of things.

Tag solution #2:
* Two tables: `photo_tags` and `caption_tags`.

* Do you expect to query for `caption_tags` and `photo_tags` at different rates? If so, perhaps separate tables.
* Will the meaning a `photo_tag` change at some point? If so, perhaps different tables.
