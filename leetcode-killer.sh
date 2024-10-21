LANG=""  # Default language

 while [[ "$#" -gt 0 ]]; do
     case $1 in
         --lang) LANG="$2"; shift ;;
         *) echo "Unknown parameter passed: $1"; exit 1 ;;
     esac
     shift
 done

 while true; do
     grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) |
 select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" - | \
     tesseract stdin stdout | \
     sgpt "solve coding problems & complexity analysis in $LANG. start from
 basic then optimize."
     sleep 60
 done
