from distutils.core import setup
import py2exe

setup(name="MonitorBPA6",
    version="1.0",
    description="Monitor de las Agentes de BMC BPA",
    author="Cristial y Eduardo",
    author_email="ejimenez@sti.com.ve",
    url="C:\Python27",
    license="GPL",
    scripts=["MonitorBPA6.py"],
    console=["MonitorBPA6.py"],
    options={"py2exe":{"bundle_files":1}},
    zipfile=None,
    )