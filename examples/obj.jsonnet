local obj = import "../lib/obj.libsonnet";
local x = {a: 0, b: 1, c: 2, d:: 3}; 

{
  // remove field `a` from obj `x`
  pop: obj.pop(x, "a"), // returns: `{b: 1, c: 2, d:: 3}`

  // convert all top level fields to hidden fields
  hide: obj.hideAll(x) // returns: `{a:: 0, b:: 1, c:: 2, d:: 3}`
}
