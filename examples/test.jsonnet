local test = import '../lib/test.libsonnet';

{
  // check if different values of different data types are empty
  object_empty: test.empty({a:[]}), // returns false
  array_empty:  test.empty([{}]),   // returns false,
  string_empty: test.empty(''),     // returns true
  number_empty: test.empty(0),      // returns true
}
