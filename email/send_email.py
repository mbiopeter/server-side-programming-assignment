from email.message import EmailMessage
import smtplib
import ssl
from flask import Flask, request

app = Flask(__name__)

@app.route('/send_email.py', methods=['POST'])
def send_email():
    sender_email = request.form['sender_email']
    sender_password = request.form['sender_password']
    receiver_email = request.form['receiver_email']

    subject = 'Python Programming Language'
    body = """
    Python, created by Guido van Rossum, emerged in the late 1980s as a versatile and readable programming language. Guido, aiming for a language that prioritized code readability and simplicity, released Python's first version, 0.9.0, in 1991. Its name was inspired by the British comedy group Monty Python, highlighting the language's emphasis on humor and fun. Python steadily gained popularity due to its clear syntax and a robust standard library, attracting developers across various domains. The release of Python 2 in 2000 and Python 3 in 2008 marked significant milestones, with Python 3 addressing language inconsistencies. Python's versatility propelled it to become a dominant force in web development, data science, artificial intelligence, and more. Its community-driven development and commitment to simplicity have sustained Python's widespread adoption, making it a go-to language for both beginners and seasoned developers alike.
    """

    em = EmailMessage()
    em['From'] = sender_email
    em['To'] = receiver_email
    em['Subject'] = subject
    em.set_content(body)

    context = ssl.create_default_context()
    with smtplib.SMTP_SSL('smtp.gmail.com', 465, context=context) as smtp:
        smtp.login(sender_email, sender_password)
        smtp.sendmail(sender_email, receiver_email, em.as_string())
    
    return 'Email sent successfully!'

if __name__ == '__main__':
    app.run(debug=True)
