import smtplib
import email.utils
from email.mime.text import MIMEText

# Create the message
msg = MIMEText('This is the body of the message.')
msg['To'] = email.utils.formataddr(('Recipient', 'ejimenez@sti.com.ve'))
msg['From'] = email.utils.formataddr(('Author', 'ejimenmail@gmail.com'))
msg['Subject'] = 'Simple test message'

server = smtplib.SMTP('mail')
server.set_debuglevel(True) # show communication with the server
try:
    server.sendmail('ejimenmail@gmail.com', ['ejimenez@sti.com.ve'], msg.as_string())
finally:
    server.quit()