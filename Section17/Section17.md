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
