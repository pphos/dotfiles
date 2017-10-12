python3 << EOF
import os
import sys

path = os.path.expanduser("~/.pyenv/versions/anaconda-3.5.0.0/lib/python3.6/site-packages")
if not path in sys.path:
    sys.path.append(path)
EOF
