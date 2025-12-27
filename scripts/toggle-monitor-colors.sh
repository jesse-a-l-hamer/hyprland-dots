SCRIPT_NAME="Toggle Monitor Colors"

CM_8BPC=auto
SDRBRIGHTNESS_8BPC=1.2
SDRSATURATION_8BPC=1.1

CM_10BPC=hdr
SDRBRIGHTNESS_10BPC=1.2
SDRSATURATION_10BPC=1.1

MONITOR_MODE_8BPC="desc:Samsung Electric Company QCQ90 0x01000E00,3840x2160@119.88,0x0,1.0,bitdepth,8,cm,$CM_8BPC,sdrbrightness,$SDRBRIGHTNESS_8BPC,sdrsaturation,$SDRSATURATION_8BPC"
MONITOR_MODE_10BPC="desc:Samsung Electric Company QCQ90 0x01000E00,3840x2160@119.88,0x0,1.0,bitdepth,10,cm,$CM_10BPC,sdrbrightness,$SDRBRIGHTNESS_10BPC,sdrsaturation,$SDRSATURATION_10BPC"

if [ "$MONITOR_COLOR_PROFILE" = "10bpc" ]; then
    app2unit -- hyprctl keyword monitor "$MONITOR_MODE_8BPC"
    MONITOR_COLOR_PROFILE="8bpc"
elif [ "$MONITOR_COLOR_PROFILE" = "8bpc" ]; then
    app2unit -- hyprctl keyword monitor "$MONITOR_MODE_10BPC"
    MONITOR_COLOR_PROFILE="10bpc"
else
    dunstify "$SCRIPT_NAME" "Unable to toggle monitor color profile."
    exit 1
fi

systemctl --user import-environment MONITOR_COLOR_PROFILE

dunstify "$SCRIPT_NAME" "Monitor color profile set to: $MONITOR_COLOR_PROFILE"
