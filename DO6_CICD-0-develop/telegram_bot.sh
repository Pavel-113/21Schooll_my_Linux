TELEGRAM_BOT_TOKEN="5453197180:AAGxYGfOtbGTRRPbYNZ7jgfv9Iukofw8Bfw"
TELEGRAM_USER_ID="1446701832"
TIME=8

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="$1: $CI_JOB_STAGE%0A%0AStatus: $CI_JOB_STATUS%0A%0AProject:+$CI_PROJECT_NAME%0A"

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null