import subprocess


def packageHandler(count):
    listLength = len(count)
    print(f"\nInstalling {listLength} packages. Standby...\n")


# Enter your tools of choice here.
tools = ["curl",
         "ffuf",
         "git",
         "nmap",
         "python3-shodan",
         "python3-pip",
         "sublist3r",
         "vim",
         "zaproxy"
         ]


print(tools)
packageHandler(tools)

for tool in tools:
    try:
        subprocess.check_call(['apt-get', 'install', '-y', tool])
    except subprocess.CalledProcessError as e:
        print(f"Error installing {tool}: {e}")
        try:
            subprocess.check_call(['snap', 'install', tool])
        except subprocess.CalledProcessError as e:
            print(f"Error installing {tool} using snap: {e}")
