#!/system/bin/sh

SERVICES="
    mi_thermald
    thermal
    thermald
    thermalloadalgod
"

LOG="/storage/emulated/0/log.txt"

mqsas_ctl() {
    action="$1" 
    svc="$2"

    service call miui.mqsas.IMQSNative 21 \
        i32 1 s16 'setprop' \
        i32 1 s16 "ctl.$action $svc" \
        s16 "$LOG" \
        i32 600 > /dev/null 2>&1
}

apply_to_all() {
    action="$1"
    for svc in $SERVICES; do
        mqsas_ctl "$action" "$svc"
        log -t ToggleServices "mqsas $action $svc"
\    done
}

first_svc=$(echo "$SERVICES" | awk 'NF{print $1; exit}')
current_state=$(getprop "init.svc.$first_svc")

if [ "$current_state" = "running" ]; then
    log -t ToggleServices "State: running -> stopping all services"
    apply_to_all stop
    echo "[-] Services stopped via mqsas"
else
    log -t ToggleServices "State: stopped -> starting all services"
    apply_to_all start
    echo "[+] Services started via mqsas"
fi
