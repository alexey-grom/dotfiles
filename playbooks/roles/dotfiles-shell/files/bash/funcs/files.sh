function remove-pyc () {
  find . -name \*.pyc -delete
}

function count-loc () {
  find -type f -name "*.py" -print0 | wc --files0-from=- -l
}
