// SPDX-FileCopyrightText: 2022-2023 Simen Strange <https://github.com/dxlr8r/argus>
// SPDX-License-Identifier: MIT
{
  // Returns a new array that consists of `el` split/divided into nth
  splitInto(el, nth, _result=[])::
  if std.length(el) == 0 then _result
  else
    if std.type(el) == 'string'
    then self.splitInto(std.stringChars(el), nth)
    else self.splitInto(el[nth:std.length(el)], nth, _result+[el[0:nth]]),
}
