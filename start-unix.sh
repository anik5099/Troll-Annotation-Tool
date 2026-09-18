#!/usr/bin/env sh
cd "$(dirname "$0")" || exit 1
python3 -m http.server 8765 --bind 127.0.0.1 &
SERVER_PID=$!
sleep 1
URL="http://localhost:8765/bangla-troll-annotator.html"
if command -v xdg-open >/dev/null 2>&1; then xdg-open "$URL" >/dev/null 2>&1
elif command -v open >/dev/null 2>&1; then open "$URL"
else printf 'Open %s in Chrome or Edge.\n' "$URL"
fi
trap 'kill $SERVER_PID' INT TERM EXIT
wait $SERVER_PID
