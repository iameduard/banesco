from distutils.core import setup
from glob import glob
#from importlib.machinery import EXTENSION_SUFFIXES
import py2exe

data_files2 = [("Microsoft.VC90.CRT", glob(r'C:\Program Files\Microsoft Visual Studio 9.0\VC\redist\x86\Microsoft.VC90.CRT\*.*'))]

data_files = [("Microsoft.VC90.CRT", glob(r'C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\redist\x86\Microsoft.VC100.CRT\*.*'))]

setup(name="MonitorBPA16",
    version="1.0",
    description="Monitor de las Agentes de BMC BPA",
    author="Cristiel y Eduardo",
    author_email="ejimenmail@gmail.com",
    url="C:\Python27",
    license="GPL",
    scripts=["MonitorBPA16.py"],
    console=["MonitorBPA16.py"],
    options={"py2exe" : {"dll_excludes": ["OCI.dll",], "includes" : ["decimal", ]}},
    zipfile=None,
    data_files=data_files
    )