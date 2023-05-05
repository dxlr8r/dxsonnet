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

  // Ternary conditional operator
  ternary(cond, value_if_true, value_if_false) :: if cond then value_if_true else value_if_false
}
