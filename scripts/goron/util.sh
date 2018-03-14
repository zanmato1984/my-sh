#!/bin/bash

function find_without_slf4j ()
{
  find $* -name "*.jar" | grep -v "[^-]slf4j"
}
