from distutils.core import setup
from glob import glob
from importlib.machinery import EXTENSION_SUFFIXES
import py2exe
data_files = [("Microsoft.VC90.CRT", glob(r'C:\Program Files\Microsoft Visual Studio 9.0\VC\redist\x86\Microsoft.VC90.CRT\*.*'))]

setup(name="MonitorBPA15",
    version="1.0",
    description="Monitor de las Agentes de BMC BPA",
    author="Cristiel y Eduardo",
    author_email="ejimenez@sti.com.ve",
    url="E:\Anaconda",
    license="GPL",
    scripts=["MonitorBPA15.py"],
    console=["MonitorBPA15.py"],
    options={"py2exe":{"bundle_files":1}},
    zipfile=None,
    data_files=data_files
    )                                                                                                                                                                                                     