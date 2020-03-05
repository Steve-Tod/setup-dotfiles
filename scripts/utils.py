import os

def search_package(pack):
    output = os.popen('apt list --installed | grep %s' % (pack)).read()
    flag = False
    for l in output.splitlines():
        if l.startswith(pack):
            flag = True
    return flag

def modify_zshrc(packs):
    zshrc_path = os.path.expanduser('~/.zshrc')
    with open(zshrc_path, 'r') as f:
        lines = f.read().splitlines()
    for i, l in enumerate(lines):
        if l.startswith('plugins='):
            lines[i] = 'plugins=(%s)' % (' '.join(packs))
    with open(zshrc_path, 'w') as f:
        f.write('\n'.join(lines))

def search_package_and_install(packs):
    for pack in packs:
        if not search_package(pack):
            os.system('sudo apt-get install %s' % pack)
