function addpaths
    contains -- $argv $fish_user_paths
    or fish_add_path -Up fish_user_paths $fish_user_paths $argv
    echo "Updated PATH: $PATH"
end
