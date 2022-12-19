import sys
import os 
os.system('sudo apt update')
with open('list_of_apps.txt', 'r') as fin:
    for line in fin:
        if '|' in line:
            package_name, ppa = line.strip().split('|')
            os.system(f'sudo add-apt-repository {ppa}')
            os.system('sudo apt update')
            os.system(f'sudo apt-get install {package_name}')
        else:
            package_name = line.strip()
            os.system(f'sudo apt-get install {package_name}')
