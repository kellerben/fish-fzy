
function __fzy_get_directory_list -d 'Get a list of directories using fd or find'
  command find . \( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune  -o -type d -print ^/dev/null \
    | command tail -n+2 \
    | command sed 's#\./##'
end

function fzy_select_directory -d 'select directory using fzy'
  __fzy_get_directory_list | fzy | read -l selected_dir
  commandline --insert $selected_dir
  commandline -f repaint
end
