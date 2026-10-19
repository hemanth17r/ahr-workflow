---
name: send-outreach-email
description: >-
  Dispatches cold outreach, founder applications, and follow-up emails directly via configured Gmail SMTP credentials. Trigger whenever the user says "send email", "send this email", "dispatch email", "send outreach", "mail the founder", or "send it via smtp".
---

# Send Outreach Email (Direct SMTP Integration)

Direct automated email dispatching skill using standard authenticated Gmail SMTP configuration.

---

## 🔑 SMTP Configuration & Environment Variables

Configure the following environment variables (in your system environment or a `.env` file in your workspace):

- **Sender Address**: `GMAIL_USER` (e.g. `your-name@gmail.com`)
- **Sender Name**: `SENDER_NAME` (e.g. `Your Name`)
- **App Password**: `GMAIL_APP_PASSWORD` (16-character Google App Password generated from [myaccount.google.com/apppasswords](https://myaccount.google.com/apppasswords))
- **Host**: `smtp.gmail.com`
- **Port**: `465` (SSL)

---

## ⚡ Execution Protocol

When triggered to send an email:

1. **Verify Recipient, Subject, and Body**:
   - Ensure the message content matches a grounded, concise style (under 80 words, zero fluff, verified live products).
   - Ensure `To`, `Cc` (if applicable), and `Subject` are clearly defined.

2. **Execute Dispatch Command**:
   Run the following Python dispatch script directly via command line:

```python
import os
import smtplib
from email.mime.text import MIMEText
from email.header import Header

# Load credentials from environment
sender = os.environ.get('GMAIL_USER')
password = os.environ.get('GMAIL_APP_PASSWORD')
sender_name = os.environ.get('SENDER_NAME', 'Founder')

if not sender or not password:
    raise ValueError("Missing GMAIL_USER or GMAIL_APP_PASSWORD environment variables.")

recipient = 'TARGET_EMAIL_HERE'
cc = 'OPTIONAL_CC_HERE' # or empty string ''
recipients = [recipient] + ([cc] if cc else [])

subject = 'SUBJECT_HERE'
body = '''BODY_HERE'''

msg = MIMEText(body, 'plain', 'utf-8')
msg['Subject'] = Header(subject, 'utf-8')
msg['From'] = f'{sender_name} <{sender}>'
msg['To'] = recipient
if cc:
    msg['Cc'] = cc

with smtplib.SMTP_SSL('smtp.gmail.com', 465) as server:
    server.login(sender, password)
    server.sendmail(sender, recipients, msg.as_string())

print('SUCCESS_EMAIL_DISPATCHED')
```

3. **Verification**:
   - Confirm output logs `SUCCESS_EMAIL_DISPATCHED`.
   - Report sent status to the user with the recipient, subject, and time of dispatch.
