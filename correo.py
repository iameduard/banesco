#!/usr/bin/env python
# -*- coding: utf8 -*-

import os
import socket
import smtplib

def send_mail_local(subject, text):
    """Send a mail to the user's local mailbox."""
    # Set the local mail address for the script' user
    email = "@".join([os.getenv("LOGNAME"), socket.gethostname()])
    msg = ("From: {0}\nTo: {0}\nSubject: {1}\n{2}".format(email, subject, text))
    server = smtplib.SMTP("localhost")
    server.sendmail(email, email, msg)
    server.quit()
    return

def main():
    """Main section"""

    send_mail_local("Comprobando el envío de correo localmente",
                    "Si puedes leer esto, tu servidor local SMTP está OK")

    print("Comprueba el correo en tu buzón local {0}\nEste normalmente se "
          "encuentra situado en /var/mail/{1}".
          format("@".join([os.getenv("LOGNAME"), socket.gethostname()]),
                 os.getenv("LOGNAME")))

if __name__ == "__main__":
    main()