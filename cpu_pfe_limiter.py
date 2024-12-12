#!/usr/bin/env python3
# Created by: Artur Zdolinski
# Add to cronetab
# echo "*/2 *   * * *   root    python3 /root/cpu_pfe_limiter.py" >> /etc/crontab

import psutil                # ubuntu: apt-get install python3-psutil
import subprocess

search_in_cmdline = "-PFE"  # Target process identifier | grep to search on ps ax correct identifier which will match your setup (ie. name QEMU running instance with Leaf-PFE)
cpu_limit_percent = 25  # CPU limit percentage

for proc in psutil.process_iter(['pid', 'name', 'cmdline']):
    try:
        if proc.info and search_in_cmdline in ' '.join(proc.info['cmdline']):
            net24_pid = proc.info['pid']
            cpulimit_running = False
            for p in psutil.process_iter(['pid', 'name', 'cmdline']):
                try:
                    if p.info and 'cpulimit' in ' '.join(p.info['cmdline']) and f'-p {net24_pid}' in ' '.join(p.info['cmdline']):
                        cpulimit_running = True
                        print(f"cpulimit is active for PID {net24_pid}")
                        break
                except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
                    pass
            if not cpulimit_running:
                cmdline = ' '.join(proc.info['cmdline'])
                name_index = cmdline.find('-name')
                if name_index != -1:
                    name = cmdline[name_index + 6:].split()[0]
                    print(f"PID: {net24_pid}, Nazwa: {name}")

                subprocess.Popen(f"cpulimit -p {net24_pid} -l {cpu_limit_percent} -b", shell=True)

    except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
        pass
