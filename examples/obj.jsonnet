local obj = import '../lib/obj.libsonnet';
local x = {a: 0, b: 1, c: 2, d:: 3}; 

{
  // return a copy of object `x` that only contains fields `a` & `c`
  filterFields: obj.filterFields(x, ['a','c']), // returns `{a: 0, c: 2}`

  // return a copy of object `x` that does not contain the fields `a` & `c`
  removeFields: obj.removeFields(x, ['a','c']), // returns `{b: 1, d:: 3}`

  // remove field `a` from obj `x`
  pop: obj.pop(x, 'a'), // returns: `{b: 1, c: 2, d:: 3}`

  // convert all top level fields to hidden fields
  hide: obj.hideFields(x), // returns: `{a:: 0, b:: 1, c:: 2, d:: 3}`

  // expands object `obj` with array `array`
  traverse: obj.getTraverse({a: {b: 0}}, ['a','b']), // returns: `0`
}
