#!/system/bin/sh

SERVICES='
  mi_thermald
  thermal
  thermald
  thermalloadalgod
'

for svc in $SERVICES; do
  service call miui.mqsas.IMQSNative 21 i32 1 s16 'setprop' i32 1 \
    s16 "ctl.start $svc" s16 "storage/emulated/0/log.txt" i32 1 > /dev/null
done
