# Implementing Database Design Patterns

## When to use null or default

* If we don't care if value exists -> Don't add constraint.
* If we always want to have a value -> Set `NOT NULL`
* If we want a value but optional -> Set `NOT NULL + DEFAULT`
