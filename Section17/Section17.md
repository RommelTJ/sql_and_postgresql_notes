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
