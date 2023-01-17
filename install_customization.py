import sys
import os

def clean_line(line):
    if '#' in line:
        return line.split('#')[0].strip()
    else:
        return line.strip()

def apt_command(line):
    line = clean_line(line)
    if '|' in line:
        package_name, ppa = line.strip().split('|')
        os.system(f'sudo add-apt-repository {ppa}')
        os.system('sudo apt update')
    else:
        package_name = line.strip()
    os.system(f'sudo apt-get install {package_name}')

def manual_install(line):
    line = clean_line(line)
    os.system(f'sudo {line}')

process = {\
                'APT':apt_command,
                'CLI':manual_install\
          }

os.system('sudo apt update')
with open('list_of_apps.txt', 'r') as fin:
    for line in fin:
        if line[0] == '#':
            mode = line.strip().replace('#', '')
            continue
        process[mode](line)




