#!/usr/bin/env sh
state=$(nmcli networking connectivity)
case "$state" in
    full)      echo '{"text": "", "class":"online", "tooltip": "Online"}' ;;
    limited)   echo '{"text": " Limited", "class":"limited", "tooltip": "Limited"}' ;;
    portal)    echo '{"text": " Captive", "class":"portal", "tooltip": "Captive Portal"}' ;;
    none)      echo '{"text":" None","class":"none","tooltip": "None"}' ;;
    *)         echo '{"text": " Huh", "class":"unknown","tooltip": "idk"}' ;;
esac

