sleep 5

while true; do
    grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) |
select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" - | \
    tesseract stdin stdout | \
    llm -s "start from basic then optimize. only code no comment"
    sleep 60
done
