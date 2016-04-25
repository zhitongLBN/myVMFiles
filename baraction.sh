#!/bin/bash
# baraction.sh script for spectrwm status bar

function get_memusage {
  meminfo=`cat /proc/meminfo`
  memetotal=$(echo "$meminfo"|grep MemTotal|sed 's/kB//g'|sed 's/\ //g'|sed 's/MemTotal\://g')
  memefree=$(echo "$meminfo"|grep MemFree|sed 's/kB//g'|sed 's/\ //g'|sed 's/MemFree\://g')
  memeusage=$(echo "$memefree / $memetotal * 100" | bc -l )
  printf "%.2f" $memeusage
}

function get_cpuusage() {
  cpuusage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
  printf "%.2f" $cpuusage
}

function get_remain_battrie() {
  acpi | cut -d ' ' -f 4|sed 's/\,//g'
}

function get_download_total() {
  info="/sys/class/net/"
  cd $info
  rx=0
  for interface in eth*
  do
    rx=$((rx + `cat $info$interface/statistics/rx_bytes`))
  done

  for interface in wlan*
  do
    rx=$((rx + `cat $info$interface/statistics/rx_bytes`))
  done
  echo $rx
}

function get_upload_total() {
  info="/sys/class/net/"
  cd $info
  tx=0
  for interface in eth*
  do
    tx=$((tx + `cat $info$interface/statistics/tx_bytes`))
  done

  for interface in wlan*
  do
    tx=$((tx + `cat $info$interface/statistics/tx_bytes`))
  done
  echo $tx
}

function get_themperature(){
  echo $(acpi -t|sed 's/,/\n/g'|grep -v Thermal|sed 's/degree/\ndegree/g'|grep -v degree)
}

SLEEP_SEC=5  # set bar_delay = 5 in /etc/spectrwm.conf
upload_total=0
download_total=0
#loops forever outputting a line every SLEEP_SEC secs
while :; do
  let COUNT=$COUNT+1
  memusage=$(get_memusage)
  cpuusage=$(get_cpuusage)
  remain_battrie=$(get_remain_battrie)
  msg="         CPU: $cpuusage% | RAM: $memusage%"
  if [ ! $remain_battrie == "" ]; then
    msg=$msg" | Battrie: $remain_battrie"
  fi
  # internet speed
  new_upload_total=$(get_upload_total)
  new_download_total=$(get_download_total)
  # echo $new_upload_total, $new_download_total
  upload_speed=$(echo "($new_upload_total - $upload_total)/($SLEEP_SEC*1024)" | bc -l )
  download_speed=$(echo "($new_download_total - $download_total)/($SLEEP_SEC*1024)" | bc -l)
  upload_speed=`printf "%.2f" $upload_speed`
  download_speed=`printf "%.2f" $download_speed`
  upload_total=$new_upload_total
  download_total=$new_download_total
  temperature=$(get_themperature)
  if [ ! $temperature == "" ]; then
    msg=$msg" | $temperature C"
  fi
  msg=$msg" | up $upload_speed Kb/s down $download_speed Kb/s"

  echo -e $msg
  sleep $SLEEP_SEC
done
