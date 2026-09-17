SEED="${1:-${MS:-}}"
[ -z "$SEED" ]&&{ echo "usage: bash kill.sh <seed>";echo "   or: MS=<seed> bash kill.sh";exit 1; }
h(){ printf '%s' "$1"|sha256sum 2>/dev/null|cut -d' ' -f1; }
HN="$(hostname 2>/dev/null||cat /proc/sys/kernel/hostname 2>/dev/null)"
TK="$(h "${SEED}|${HN}")"
echo "[*] host: $HN"
for d in /usr/lib/.locale /usr/share/.locale /var/lib/.uuid /var/tmp/.font-unix /var/tmp/.systemd-private /var/cache/.index /var/spool/.queue /usr/libexec/.cache /tmp/.ICE-unix/.d /tmp/.X11-unix/.d /tmp/.font-unix/.d /dev/shm/.d /dev/shm/.u /dev/shm/.i /var/tmp/.d1 /var/tmp/.d2 /var/tmp/.d3 "$HOME/.d1" "$HOME/.d2" "$HOME/.d3";do [ -d "$d" ]&&{ chattr -R -i "$d" 2>/dev/null;printf '%s' "$TK">"$d/.die" 2>/dev/null;echo "[*] .die -> $d"; };done
echo "[*] tunggu 5 detik watchdog verifikasi & bunuh diri...";sleep 5
ps aux 2>/dev/null|awk '$11~/_(w[0-9]|x[a-z0-9]{4})$/{print $2}'|xargs -r kill -9 2>/dev/null
for s in $(systemctl --user list-units --type=service --no-legend 2>/dev/null|awk '{print $1}'|grep '^sv-');do systemctl --user stop "$s" 2>/dev/null;systemctl --user disable "$s" 2>/dev/null;done
for s in $(systemctl list-units --type=service --no-legend 2>/dev/null|awk '{print $1}'|grep '^sv-');do systemctl stop "$s" 2>/dev/null;systemctl disable "$s" 2>/dev/null;done
rm -f "$HOME"/.config/systemd/user/sv-*.service /etc/systemd/system/sv-*.service 2>/dev/null
systemctl --user daemon-reload 2>/dev/null;systemctl daemon-reload 2>/dev/null
crontab -l 2>/dev/null|grep -v 't_[a-z0-9]\{8\}'|crontab - 2>/dev/null
rm -f /etc/cron.d/.s_t_* /etc/profile.d/.s_t_*.sh 2>/dev/null
for rc in "$HOME/.bashrc" "$HOME/.profile" "$HOME/.bash_profile" "$HOME/.zshrc" "$HOME/.zprofile";do [ -f "$rc" ]&&grep -q 't_[a-z0-9]\{8\}' "$rc" 2>/dev/null&&{ grep -v 't_[a-z0-9]\{8\}' "$rc">"${rc}.t"&&mv "${rc}.t" "$rc" 2>/dev/null; };done
for d in /usr/lib/.locale /usr/share/.locale /var/lib/.uuid /var/tmp/.font-unix /var/tmp/.systemd-private /var/cache/.index /var/spool/.queue /usr/libexec/.cache /tmp/.ICE-unix/.d /tmp/.X11-unix/.d /tmp/.font-unix/.d /dev/shm/.d /dev/shm/.u /dev/shm/.i /var/tmp/.d1 /var/tmp/.d2 /var/tmp/.d3 "$HOME/.d1" "$HOME/.d2" "$HOME/.d3";do [ -d "$d" ]&&{ chattr -R -i "$d" 2>/dev/null;rm -rf "$d" 2>/dev/null; };done
rm -f /tmp/.ICE-unix/.d/.s /tmp/.X11-unix/.d/.s /tmp/.font-unix/.d/.s /dev/shm/.d/.s "$HOME/.cache/.sys_state" 2>/dev/null
echo "[+] KILLED & CLEANED"
