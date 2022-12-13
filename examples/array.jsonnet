local arr = import '../lib/array.libsonnet';
local x = ['a', 'b', 'c', 'd', 'e', 'f']; 

{
  // split an array/string into 2
  split: arr.splitInto(x, 2) // returns: `[['a', 'b'], ['c', 'd'], ['e', 'f']]`
}
