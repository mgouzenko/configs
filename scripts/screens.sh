#!/bin/bash
is_connected() {
    if [[ $1 == *"$2 connected"* ]]; then
        return 0
    fi
    return 1
}

setup() {
    XRANDR_OUTPUT=`xrandr`

    if is_connected "$XRANDR_OUTPUT" "HDMI2" &&
        is_connected "$XRANDR_OUTPUT" "HDMI3" &&
        is_connected "$XRANDR_OUTPUT" "eDP1"; then
        echo "Double monitor setup";
        xrandr --output HDMI2 --scale 2x2 --panning 3840x2160+0+0 \
               --output eDP1 --panning 2880x1800+3840+0 \
               --output HDMI3 --scale 2x2 --panning 3840x2160+6720+0

        # TODO: The following command is from arandr, but this is really hacky because
        # it doesn't work unless the xrandr command above runs. I think it's
        # got to do with the "canvas" expanding due to the --panning flags.
        xrandr --output VIRTUAL1 --off
               --output eDP1 --primary --mode 2880x1800 --pos 3840x0 --rotate normal
               --output DP1 --off
               --output HDMI3 --mode 1920x1080 --pos 6720x0 --rotate normal
               --output HDMI2 --mode 1920x1080 --pos 0x0 --rotate normal
               --output HDMI1 --off
               --output VGA1 --off
               --output DP2 --off
    elif is_connected "$XRANDR_OUTPUT" "eDP1"; then
        echo "Single monitor setup";
        xrandr --output eDP1 --auto --pos 0x0 --panning 2880x1800+0+0
    else
        echo "Unrecognized setup";
    fi
}

setup
