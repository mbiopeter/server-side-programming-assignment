#Go over to your Gmail account and setup 2 factor authentication
#generate app password
from email.message import EmailMessage
from env import APP_PASSWORD, SENDER_EMAIL, RECEIVER_EMAIL
import ssl
import smtplib

email_sender = SENDER_EMAIL
email_password = APP_PASSWORD
#email_password = 'gnny hqdo pwno esfy'

email_receiver = RECEIVER_EMAIL

subject = 'Python Programming Language'

body ="""
Python, created by Guido van Rossum, emerged in the late 1980s as a versatile and readable programming language. Guido, aiming for a language that prioritized code readability and simplicity, released Python's first version, 0.9.0, in 1991. Its name was inspired by the British comedy group Monty Python, highlighting the language's emphasis on humor and fun. Python steadily gained popularity due to its clear syntax and a robust standard library, attracting developers across various domains. The release of Python 2 in 2000 and Python 3 in 2008 marked significant milestones, with Python 3 addressing language inconsistencies. Python's versatility propelled it to become a dominant force in web development, data science, artificial intelligence, and more. Its community-driven development and commitment to simplicity have sustained Python's widespread adoption, making it a go-to language for both beginners and seasoned developers alike. 
"""

em = EmailMessage()

em['From'] = email_sender
em['To'] = email_receiver
em['Subject'] = subject
em.set_content(body)



context = ssl.create_default_context()
#create a function to send the email
with smtplib.SMTP_SSL('smtp.gmail.com', 465, context=context) as smtp:
    smtp.login(email_sender, email_password)
    smtp.sendmail(email_sender, email_receiver, em.as_string())