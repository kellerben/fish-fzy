function fzy_select_file
  if test (count $argv) = 0
    set fzy_flags
  else
    set fzy_flags -q "$argv"
  end
  rg --files|fzy $fzy_flags|read -l foo
  commandline -f repaint
  commandline $foo
end
