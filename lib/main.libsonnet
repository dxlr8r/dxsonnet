local array = import 'array.libsonnet';
local obj = import 'obj.libsonnet';
local string = import 'string.libsonnet';
local test = import 'test.libsonnet';

{
  array: array,
  obj: obj,
  string: string,
  test: test,
} + array + obj + string + test
