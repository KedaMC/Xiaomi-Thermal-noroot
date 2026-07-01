#!/system/bin/sh

FLAG='/data/local/tmp/module'
LOG='/storage/emulated/0/log_on.txt'
LOG_='/storage/emulated/0/log_off.txt'


SERVICES='
  mi_thermald
  thermal
  thermald
  thermalloadalgod
'

ctrl() {
  local act=$1
  local log=$2
  
  for svc in $SERVICES; do
    service call miui.mqsas.IMQSNative 21 i32 1 s16 'setprop' i32 1 \
      s16 "ctl.$act $svc" s16 "$log" i32 60 > /dev/null
  done
}

if [ -f "$FLAG" ]; then

  ctrl 'start' "$LOG_"
  rm -f "$FLAG"
  
  echo 'No Gimmick, No Scam, all Done!'
  echo 'Status: Off'
  
else

  ctrl 'stop' "$LOG"
  touch "$FLAG"
  
  echo 'No Gimmick, No Scam, all Done!'
  echo 'Status: On'
  
fi
