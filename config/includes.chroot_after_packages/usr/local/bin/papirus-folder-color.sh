#!/bin/bash
# papirus-folder-color.sh
# Generate icon theme inheriting Papirus,
# but with different coloured folder icons.
# original script from https://forums.bunsenlabs.org/viewtopic.php?id=4290
# Adapted for use in Lilidog by sleekmason 2-14-2022

#### EDIT THESE FOUR VARIABLES APPROPRIATELY ####
# See also the [Icon Theme] spec. from line ~188
# and possibly change Inherits=Papirus to Papirus-Dark.

new_theme='Papirus-color' # Name of new generated theme

source_dir=/usr/share/icons/Papirus
#source_dir="$PWD"

target_dir="$HOME/.local/share/icons/${new_theme}"
#target_dir=../"${new_theme}"

copy_files=true # If true, copy icons into new theme instead of symlinking.

########

USAGE="
papirus-folder-color.sh [color]
Where color can be one of:
black,blue,bluegrey,breeze,brown,cyan,deeporange,green,grey,indigo,magenta,nordic,orange,palebrown,paleorange,pink,red,teal,violet,white,yaru,yellow,custom
If color is not specified, it defaults to bluegrey.
NB \"custom\" color corresponds to jet black, while \"black\"
is actually dark grey.
\"jet-black\" may also be passed as an alias for \"custom\"
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
black|blue|bluegrey|breeze|brown|cyan|deeporange|green|grey|indigo|magenta|nordic|orange|palebrown|paleorange|pink|red|teal|violet|white|yaru|yellow|custom)
    color="$1";;
jet-black)
    color=custom;;
'')
    color=bluegrey;;
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
        local tld_src=$( readlink -f "${source_dir}" )
        tld_src=${tld_src#/}
        tld_src=${tld_src%%/*}
        local tld_tgt=$( readlink -f "${target_dir}" )
        tld_tgt=${tld_tgt#/}
        tld_tgt=${tld_tgt%%/*}
        if [[ "$tld_src" = "$tld_tgt" ]]
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
Comment=Recolored Papirus icon theme for Lilidog
Inherits=Papirus,breeze,ubuntu-mono-dark,gnome,hicolor
Example=folder
FollowsColorScheme=true
DesktopDefault=48
DesktopSizes=16,22,24,32,48,64
ToolbarDefault=22
ToolbarSizes=16,22,24,32,48
MainToolbarDefault=22
MainToolbarSizes=16,22,24,32,48
SmallDefault=16
SmallSizes=16,22,24,32,48
PanelDefault=48
PanelSizes=16,22,24,32,48,64
DialogDefault=48
DialogSizes=16,22,24,32,48,64
# Directory list
Directories=${shortdirlist%,}
$longdirlist
EOF

gtk-update-icon-cache "$target_dir"
