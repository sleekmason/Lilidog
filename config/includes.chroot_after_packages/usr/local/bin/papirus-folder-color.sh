#!/bin/bash
# papirus-folder-color.sh
# Generate icon theme inheriting Papirus,
# but with different coloured folder icons.
# original script from https://forums.bunsenlabs.org/viewtopic.php?id=4290
# Adspted for use in Lilidog 2-13-2022

new_theme='Papirus-color' # Name of new generated theme

source_dir=/usr/share/icons/Papirus
#source_dir="$PWD"

target_dir="$HOME/.local/share/icons/${new_theme}"
#target_dir=../"${new_theme}"

copy_files=false # If true, copies icons into new theme instead of symlinking.

USAGE="
papirus-folder-color.sh [color]
Where color can be one of:
black,blue,bluegrey,brown,cyan,green,grey,magenta,orange,pink,purple,red,teal,violet,yellow
If color is not specified, it defaults to grey.

    Generates a user custom icon theme with a different folder color from
    the default Papirus blue.

papirus-folder-color.sh [-h|--help]

    Display this message.

The Papirus theme is read from /usr/share/icons/Papirus, and
the generated theme written to $HOME/.local/share/icons/${new_theme}
These paths can be changed by editing the variables
source_dir, target_dir and new_theme at the top of this file.

If copy_files=true then icons will be copied into the new theme,
not symlinked (which is the default). This increases the size,
but improves portability.

If source_dir and target_dir are under the same top-level directory
then symlinked icons will use relative paths, otherwise absolute paths.
"
########################################################################

defcolor=blue # the Papirus default

error_exit() {
    echo "$0 error: $1" >&2
    exit 1
}

[[ $(basename "$source_dir") = Papirus ]] || error_exit "$source_dir: Not a Papirus theme directory"
[[ $(basename "$target_dir") = Papirus* ]] || error_exit "$target_dir: Not a Papirus theme directory" # try to avoid accidents

case "$1" in
black|blue|bluegrey|brown|cyan|green|grey|magenta|orange|pink|red|teal|violet|yellow)
    color="$1";;
'')
    color=grey;;
-h|--help)
    echo "$USAGE"; exit;;
*)
    error_exit "$1: Unrecognized option."
esac

# Define function to make symlinks,
# relative if source & target have same top-level directory.
# If copy_files is true, copy instead of linking.
set_linking() {
    if [[ $copy_files = true ]]
    then
        link_file() { cp "$1" "$2"; }
    else
        local tld_src=$( readlink -f ${source_dir} )
        tld_src=${tld_src#/}
        tld_src=${tld_src%%/*}
        local tld_tgt=$( readlink -f ${target_dir} )
        tld_tgt=${tld_tgt#/}
        tld_tgt=${tld_tgt%%/*}
        if [[ $tld_src = $tld_tgt ]]
        then
            link_file() { ln -sfr "$1" "$2"; }
        else
            link_file() { ln -sf "$1" "$2"; }
        fi
    fi
}

set_linking

[[ -e "$target_dir" ]] && {
    echo "$target_dir will be removed and replaced, OK?"
    read -r -p ' remove? (y/n) '
    case ${REPLY^^} in
    Y|YES)
        rm -rf "$target_dir" || error_exit "Failed to remove $target_dir";;
    *)
        echo 'User cancelled. Exiting...'; exit;;
    esac
}
mkdir -p "$target_dir" || error_exit "Failed to create $target_dir"

shortdirlist=
longdirlist=
for subdir in "$source_dir"/*
do
    [[ -d ${subdir}/places && ! -h $subdir ]] || continue
    files=()
    while IFS= read -r -d '' file
    do
        files+=("$file")
    done < <(find "${subdir}/places" -type l \( -ilname "*-$defcolor-*" -o -lname "*-$defcolor.*" \) ! -iname "*-$defcolor-*" ! -iname "*-$defcolor.*" -print0)
    [[ ${#files[@]} -gt 0 ]] || continue
    dirname=${subdir##*/}
    mkdir -p "$target_dir/${dirname}/places" || error_exit "Failed to create $target_dir/${dirname}/places"
    scaledname=${dirname}@2x
    [[ $dirname != symbolic ]] && ln -s "${dirname}" "${target_dir}/${scaledname}" || error_exit "Failed to link ${target_dir}/${scaledname} to ${dirname}"
    for i in "${files[@]}"
    do
        find "${subdir}/places" -type l -lname "${i##*/}" -exec cp --no-dereference '{}' "$target_dir/${dirname}/places" \;
        target="$(readlink "$i")"
        target="${target/-${defcolor}/-${color}}"
        [[ -f "$subdir/places/$target" ]] || { echo "$subdir/places/$target: not found"; continue; }
        link_file "$subdir/places/$target" "$target_dir/$dirname/places/${i##*/}" || error_exit "Failed to link_file() $target_dir/$dirname/places/${i##*/} to $subdir/places/$target"
    done
    case "${dirname}" in
    64x64)
        shortdirlist+="${dirname}/places,${scaledname}/places,"
        longdirlist+="[${dirname}/places]
Context=Places
Size=64
MinSize=64
MaxSize=512
Type=Scalable

[${scaledname}/places]
Context=Places
Size=64
Scale=2
MinSize=64
MaxSize=512
Type=Scalable

"

        ;;
    symbolic)
        shortdirlist+="${dirname}/places,"
        longdirlist+="[${dirname}/places]
Context=Places
Size=16
MinSize=16
MaxSize=512
Type=Scalable

"

        ;;
    *)
        shortdirlist+="${dirname}/places,${scaledname}/places,"
        longdirlist+="[${dirname}/places]
Context=Places
Size=${dirname%x*}
Type=Fixed

[${scaledname}/places]
Context=Places
Size=${dirname%x*}
Scale=2
Type=Fixed

"

        ;;
    esac
done

cat <<EOF > "$target_dir/index.theme"
[Icon Theme]
Name=$new_theme
Comment=Recolored Papirus icon theme for Lilidog.
Inherits=Papirus,breeze,ubuntu-mono-dark,gnome,hicolor

DesktopDefault=48
ToolbarDefault=16
ToolbarSizes=16,22,32,48
MainToolbarDefault=16
MainToolbarSizes=16,22,32,48
PanelDefault=22
PanelSizes=16,22,32,48,64,128,256
FollowsColorScheme=true

# Directory list
Directories=${shortdirlist%,}

$longdirlist
EOF

gtk-update-icon-cache "$target_dir"
