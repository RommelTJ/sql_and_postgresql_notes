# Fast Parallel Testing

## A Note On Testing

Main issue with testing:
* We will be using Jest.
* Jest tries to run tests in parallel, not sequential
* Tests could have conflicts with the database
* Main challenge is to make sure the tests don't run into issues with each other.
