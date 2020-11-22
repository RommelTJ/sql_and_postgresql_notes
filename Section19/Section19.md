# How to Design a Follower System

## Designing a Follower System

`leader_id` is the leader.
`follower_id` is the person doing the following.

* Add a check that `(leader_id <> follower_id)`
* Add a check that `UNIQUE(leader_id, follower_id)`

On dbdiagram.io: 
```
table followers {
  id SERIAL [pk, increment]
  created_at timestamp
  leader_id integer [ref: > users.id]
  follower_id integer [ref: > users.id]
}
```
