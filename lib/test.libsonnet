// SPDX-FileCopyrightText: 2022-2023 Simen Strange <https://github.com/dxlr8r/argus>
// SPDX-License-Identifier: MIT
{
  // Check if value has content as a boolean
  hasContent(value) ::
    if std.type(value) == 'null' then false
    else if std.isBoolean(value) then value
    else if std.isNumber(value)  then (if value == 0 then false else true)
    else if std.isString(value)  then (if std.length(value) == 0 then false else true)
    else if std.isArray(value)   then (if std.length(value) == 0 then false else true)
    else if std.isObject(value)  then (if std.length(value) == 0 then false else true),

  // Aliases for hasContent
  nonempty(value) :: self.hasContent(value),
  laden(value) :: self.hasContent(value),
  loaded(value) :: self.hasContent(value),

  // Negated alias for hasContent
  empty(value) :: ! self.hasContent(value),

  // check if haystack has needle, haystack can be an object or an array
  exists(haystack, needle, value_if_true=null, value_if_false=null) ::
    local false_value = 
      if std.isObject(value_if_true) && 
         std.type(value_if_false) == 'null' then
        {}
      else if std.isArray(value_if_true) && 
              std.type(value_if_false) == 'null' then
        []
      else if std.type(value_if_true)  == 'null' && 
              std.type(value_if_false) == 'null' then
        false
      else
        value_if_false;
    local true_value = 
      if std.isObject(value_if_false) && 
         std.type(value_if_true) == 'null' then
        {}
      else if std.isArray(value_if_false) && 
              std.type(value_if_true) == 'null' then
        []
      else if std.type(value_if_false) == 'null' && 
              std.type(value_if_true)  == 'null' then
        true
      else
        value_if_true;
    if std.isObject(haystack) && std.objectHas(haystack, needle) then
      true_value
    else if std.isArray(haystack) && std.member(haystack, needle) then
      true_value
    else 
      false_value,

  get(haystack, needle, value_if_true=null, value_if_false=null) ::
    self.exists(haystack, needle, value_if_true, value_if_false),

  // Ternary conditional operator
  ternary(cond, value_if_true, value_if_false) ::
    if cond then value_if_true else value_if_false
}
