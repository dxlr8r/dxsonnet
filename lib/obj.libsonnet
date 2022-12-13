{
// Apply the given function to each field:value pair of the object to form a new object.
map(func, obj, _mfunc=function(o,f)std.get(o,f,{}), _field=[], _return={}) ::
  if std.length(_field) == 0 && std.length(std.objectFieldsAll(_return)) == 0 then
    self.map(func, obj, _mfunc, std.objectFieldsAll(obj))
  else
    if std.length(_field) > 0 then
      self.map(func, obj, _mfunc, _field[1:std.length(_field)],
        local f = func(_field[0], _mfunc(obj, _field[0]));
        if std.isObject(f) then _return + f else _return)
    else
      _return,

// Alias for map
forEach(func, obj) ::
  self.map(func, obj),

// Removes field from `obj`
pop(obj, field) ::
  self.forEach(function(f,v) if f != field then if std.objectHas(obj,f) 
    then { [f]:  v } 
    else { [f]:: v },
  obj),

hideAll(obj) ::
  self.forEach(function(field, value) { [field]:: value }, obj)
}
