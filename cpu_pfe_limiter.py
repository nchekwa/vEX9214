#!/usr/bin/env python3
# Created by: Artur Zdolinski
#
# Crontab:
# echo "*/2 *   * * *   root    /usr/bin/python3 /root/cpu_pfe_limiter.py" >> /etc/crontab

import psutil   # ubuntu: apt-get install python3-psutil
import subprocess

search_in_cmdline_1 = "-PFE"           # Target process identifier 1
search_in_cmdline_2 = "qemu-system"    # Target process identifier 2
cpu_limit_percent = 25                 # CPU limit percentage

for proc in psutil.process_iter(['pid', 'name', 'cmdline']):
    try:
        cmdline = ' '.join(proc.info['cmdline'])
        if proc.info and search_in_cmdline_1 in cmdline and search_in_cmdline_2 in cmdline:  # Check both conditions
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
                name_index = cmdline.find('-name')
                if name_index != -1:
                    name = cmdline[name_index + 6:].split()[0]
                    print(f"PID: {net24_pid}, Nazwa: {name}")
                subprocess.Popen(f"cpulimit -p {net24_pid} -l {cpu_limit_percent} -b", shell=True)

    except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
        pass

