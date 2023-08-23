// SPDX-FileCopyrightText: 2022-2023 Simen Strange <https://github.com/dxlr8r/argus>
// SPDX-License-Identifier: MIT
{
  local special=std.stringChars('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'),
  rfc1123(str)::
    std.asciiLower(
      std.foldl(function(prev, this) std.strReplace(prev, this, '-'), special, str)),
  posixEnv(str)::
    std.asciiUpper(
      std.foldl(function(prev, this) std.strReplace(prev, this, '_'), special, str))
}
