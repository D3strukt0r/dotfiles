import subprocess, dotbot

class Flatpak(dotbot.Plugin):
    _directive = 'flatpak'

    def can_handle(self, directive):
        return self._directive == directive

    def handle(self, directive, data):
        if directive != self._directive:
            raise ValueError('flatpak cannot handle directive %s' %directive)

        success = True

        # Read file defined in "data.list" and install all packages
        with open(data["list"]) as f:
            for line in f:
                try:
                    subprocess.run(['flatpak install --noninteractive '+line], shell=True, check=True)
                except subprocess.CalledProcessError:
                    success = False

        if success:
            self._log.info('All packages have been installed')
        else:
            self._log.error('Some packages were not successfully installed')
        return success
